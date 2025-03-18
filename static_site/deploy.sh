#!/bin/bash

echo "#DEPLOY STARTED..."

# Sync index.html and only updated PNG files
# rsync --update (-u): Only newer files are copied, saving time and bandwidth.
rsync -ruv --exclude-from='exclude.txt' index.html *.png ec2:/home/ubuntu/static_site

ssh ec2 << 'EOF'
  echo "Updating the server..."

  # Move index.html
  sudo cp /home/ubuntu/static_site/index.html /var/www/html

  # Move PNG images using a loop
  for img in /home/ubuntu/static_site/*.png; do
    sudo cp "$img" /var/www/html/
  done

  # Restart Nginx
  sudo systemctl restart nginx
  echo "Update completed!"
EOF
