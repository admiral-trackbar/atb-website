#automatic deployment from local to admiral-trackbar.github.io
#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go to admiral trackbar hostname repo
cd admiral-trackbar.github.io/
#pull any changes
git pull origin master
#come back to project root
cd ..
#build the site
hugo -d ../admiral-trackbar.github.io/
#return to hostname repo
cd ../admiral-trackbar.github.io/

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..