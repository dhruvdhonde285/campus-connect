const express = require("express");
const cors = require("cors");
const path = require("path");
const mysql = require("mysql2");

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, "../public")));

/* DATABASE CONNECTION */
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "admin123",
    database: "campusconnect"
});

db.connect((err) => {
    if (err) {
        console.error("Database connection failed", err);
        return;
    }
    console.log("MySQL Connected Successfully");
});

/* TEST ENDPOINT - TO VERIFY SERVER IS WORKING */
app.get("/test", (req, res) => {
    res.json({ message: "Server is working! All routes are loaded." });
});

/* Middleware to check if user is admin */
const isAdmin = (req, res, next) => {
    const { user_id } = req.body;
    
    if (!user_id) {
        return res.status(403).json({ message: "User ID required" });
    }
    
    const sql = "SELECT role FROM users WHERE id = ?";
    db.query(sql, [user_id], (err, result) => {
        if (err || result.length === 0) {
            return res.status(403).json({ message: "Unauthorized" });
        }
        if (result[0].role !== 'admin') {
            return res.status(403).json({ message: "Admin access required" });
        }
        next();
    });
};

/* LOGIN */
app.post("/login", (req, res) => {
    const { email, password } = req.body;
    const sql = "SELECT * FROM users WHERE email=? AND password=?";
    
    db.query(sql, [email, password], (err, result) => {
        if (err) return res.status(500).send(err);
        if (result.length === 0) {
            return res.status(401).json({ message: "Invalid login" });
        }
        res.json({
            message: "Login success",
            user: result[0]
        });
    });
});

/* GET EVENTS */
app.get("/events", (req, res) => {
    const sql = "SELECT * FROM events ORDER BY event_date ASC";
    
    db.query(sql, (err, result) => {
        if (err) return res.status(500).send("Database error");
        res.json(result);
    });
});

/* CREATE EVENT (Admin only) */
app.post("/events", isAdmin, (req, res) => {
    const { title, description, event_date, event_time, location } = req.body;
    
    const sql = `
        INSERT INTO events (title, description, event_date, event_time, location)
        VALUES (?, ?, ?, ?, ?)
    `;
    
    db.query(sql, [title, description, event_date, event_time, location], (err, result) => {
        if (err) {
            console.error("Insert failed:", err);
            return res.status(500).send("Insert failed");
        }
        res.json({
            message: "Event created",
            eventId: result.insertId
        });
    });
});

/* UPDATE EVENT */
app.put("/events/:id", (req, res) => {
    const { title, description, event_date, event_time, location } = req.body;
    
    const sql = `
        UPDATE events
        SET title=?, description=?, event_date=?, event_time=?, location=?
        WHERE id=?
    `;
    
    db.query(sql, [title, description, event_date, event_time, location, req.params.id], (err) => {
        if (err) return res.status(500).send("Update failed");
        res.json({ message: "Event updated" });
    });
});

/* DELETE EVENT (Admin only) */
app.delete("/events/:id", isAdmin, (req, res) => {
    const sql = "DELETE FROM events WHERE id=?";
    
    db.query(sql, [req.params.id], (err) => {
        if (err) return res.status(500).send("Delete failed");
        res.json({ message: "Event deleted" });
    });
});

/* REGISTER EVENT - WITH DUPLICATE CHECK */
app.post("/register", (req, res) => {
    const { user_id, event_id } = req.body;
    
    console.log("Registration attempt:", { user_id, event_id });
    
    const checkSql = "SELECT * FROM registrations WHERE user_id = ? AND event_id = ?";
    
    db.query(checkSql, [user_id, event_id], (err, results) => {
        if (err) {
            console.error("Check error:", err);
            return res.status(500).json({ message: "Database error during check" });
        }
        
        if (results.length > 0) {
            console.log("Duplicate registration prevented");
            return res.json({ message: "Already registered for this event" });
        }
        
        const insertSql = `
            INSERT INTO registrations (user_id, event_id, status)
            VALUES (?, ?, 'registered')
        `;
        
        db.query(insertSql, [user_id, event_id], (err, result) => {
            if (err) {
                console.error("Insert error:", err);
                return res.status(500).json({ message: "Registration failed" });
            }
            
            console.log("Registration successful:", result);
            res.json({ message: "Registered successfully" });
        });
    });
});

/* ADMIN REGISTRATIONS */
app.get("/registrations", (req, res) => {
    const sql = `
        SELECT users.name, users.email, events.title
        FROM registrations
        JOIN users ON registrations.user_id = users.id
        JOIN events ON registrations.event_id = events.id
    `;
    
    db.query(sql, (err, result) => {
        if (err) return res.status(500).send("Database error");
        res.json(result);
    });
});

/* GET USER'S REGISTERED EVENTS */
app.get("/my-events/:userId", (req, res) => {
    const userId = req.params.userId;
    
    const sql = `
        SELECT events.* 
        FROM events 
        JOIN registrations ON events.id = registrations.event_id 
        WHERE registrations.user_id = ?
        ORDER BY events.event_date ASC
    `;
    
    db.query(sql, [userId], (err, result) => {
        if (err) {
            console.error("Error fetching user events:", err);
            return res.status(500).send("Database error");
        }
        res.json(result);
    });
});

/* ========== SIGNUP ENDPOINT - ADD THIS ========== */
app.post("/signup", (req, res) => {
    const { name, email, password, role } = req.body;
    
    console.log("📝 Signup attempt:", { name, email, role });
    
    if (!name || !email || !password) {
        return res.status(400).json({ message: "All fields are required" });
    }
    
    const checkSql = "SELECT * FROM users WHERE email = ?";
    db.query(checkSql, [email], (err, results) => {
        if (err) {
            console.error("Check error:", err);
            return res.status(500).json({ message: "Database error" });
        }
        
        if (results.length > 0) {
            return res.status(400).json({ message: "Email already exists" });
        }
        
        const userRole = role || 'student';
        const insertSql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
        
        db.query(insertSql, [name, email, password, userRole], (err, result) => {
            if (err) {
                console.error("Insert error:", err);
                return res.status(500).json({ message: "Failed to create user" });
            }
            
            console.log("✅ User created successfully:", { id: result.insertId, name, email });
            res.json({ 
                message: "User created successfully", 
                userId: result.insertId 
            });
        });
    });
});
/* ========== END OF SIGNUP ========== */

/* START SERVER */
const PORT = 3000;

app.listen(PORT, () => {
    console.log("Server running on port " + PORT);
    console.log("Visit: http://localhost:3000");
});