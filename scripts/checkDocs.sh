sleep 1s
exec < /dev/tty
printf " 🚧  CHECKING DOCUMENTATION CHANGES 🚧\n\n"
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

printf "\n\n"

# Just to confirm
printf "      The following list is optional to be updated with each commit.\n\n"
optionalFilesUpdated=true

if [ -f "README.md" ]; then
  readmeChanges=$(git diff --staged README.md)
  if [ -n "$readmeChanges" ]; then
    printf "      ✅  - README.md"
  else
    printf "      ❌  - README.md"
    optionalFilesUpdated=false
  fi
else 
  printf "      ⚠️  - README.md file does not exists"
fi

printf "\n\n"

if [ "$requiredFilesUpdated" == "false" ]; then
  printf "      Please make sure to do proper changes to documentation and come back later. 😥\n"
  exit 1
fi

if [ "$optionalFilesUpdated" == "false" ]; then
  printf "      Some optional files are not changed. 🤔\n"
  printf "      Do you want to continue? (Y/N)\n\n"
  read -p " 👩🏽‍💻  - " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
fi

printf "\n"

printf " 🤖  - Thanks for having all documentation up to date! 👍\n"