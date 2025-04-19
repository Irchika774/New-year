@echo off

echo Git Commit and Push to Current Branch

rem Ask for commit message
set /p COMMIT_MSG=Enter your commit message: 

rem Add all changes
git add .

rem Commit with the provided message
git commit -m "%COMMIT_MSG%"

rem Push to current branch
git push

echo Done!
pause