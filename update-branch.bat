@echo off

echo Git Commit and Push to Current Branch

rem Get current branch name first
for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set CURRENT_BRANCH=%%i

rem Show current branch
echo Current branch: %CURRENT_BRANCH%

rem Ask for commit message
set /p COMMIT_MSG=Enter your commit message: 

rem Add all changes
git add .

rem Commit with the provided message
git commit -m "%COMMIT_MSG%"

rem Try to push, and if it fails due to no upstream branch, set the upstream
git push --porcelain 2>&1 | findstr "has no upstream" > nul
if %ERRORLEVEL% EQU 0 (
    echo Setting upstream branch and pushing...
    git push --set-upstream origin %CURRENT_BRANCH%
) else (
    rem Normal push if upstream exists
    git push
)

echo Done!
pause