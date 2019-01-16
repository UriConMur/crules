sleep 1s
exec < /dev/tty
printf "      🚧  CHECKING DOCUMENTATION CHANGES 🚧\n\n"
printf " 🤖  - The system has prepared this file checklist to confirm that all documentation is updated with your changes.\n\n" 

# Required
printf "      The following files must be updated with each commit.\n\n"
requiredFilesUpdated=true

if [ -f "CHANGELOG.md" ]; then
  changelogChanges=$(git diff --staged CHANGELOG.md)
  if [ -n "$changelogChanges" ]; then
    printf "      ✅  - CHANGELOG.md"
  else
    printf "      ❌  - CHANGELOG.md"
    requiredFilesUpdated=false
  fi
else 
  printf "      ⚠️  - CHANGELOG.md file does not exists"
fi

printf "\n"

unstagedFiles=false
unstageChanges=$(git diff)
if [ -n "$unstageChanges" ]; then
  unstagedFiles=true
  printf "      ❌  - You have unstaged files"
fi

printf "\n\n"

if [ "$requiredFilesUpdated" == "false" ]; then
  printf "      Please make sure to do proper changes to documentation and come back later. 😥\n"
  exit 1
fi

if [ "$unstagedFiles" == "true" ]; then
  printf "      There are some unstaged files. 🤔\n"
  printf "      Do you want to continue? (Y/N)\n\n"
  read -p " 🙂  - " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
fi

printf "\n"

printf " 🤖  - Thanks for having all documentation up to date! 👍\n"