#!/bin/bash
MAX_DAYS=360

rm -rf .git
git init
cat  <<EOF > README.md
# Time 

keeping Refactoring time?
Run `run.sh`
It will create a commit for every day for the last $MAX_DAYS days.

## Commits for the last $MAX_DAYS

EOF
git add .
git commit --date "$date" -m "$message"

days=$(seq $MAX_DAYS | tac)
for day in $days ;
do 
    date="$day days ago"
    message="Refactoring timeheet $date"
    echo "- Added commit $message" >> README.md
    git add .
    git commit --date "$date" -m "$message"
done
git log --oneline | tac

cat <<EOF

# Now push to GitHub with something like...

git remote add origin https://github.com/arishma108/Refactoring.git
git branch -M main
git push -u origin main
EOF
