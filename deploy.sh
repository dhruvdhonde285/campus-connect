#!/bin/bash
echo "Uploading files to AWS..."
scp -i ~/.ssh/campusconnect-key.pem -r backend public ubuntu@3.7.55.39:~/campusconnect/

echo "Restarting app on AWS..."
ssh -i ~/.ssh/campusconnect-key.pem ubuntu@3.7.55.39 "cd ~/campusconnect/backend && pm2 restart campusconnect"

echo "✅ Deployment complete!"
