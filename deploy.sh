echo "Jump to project folder"
cd ~/project

echo "Pulling build file from s3"
aws s3 cp s3://devops-sample-project .

echo "Install dependencies"
rm -rf node_modules package-lock.json
npm install

echo "Re-run pm2"
pm2 delete 0
pm2 start dist/main.js