sleep 1s
exec < /dev/tty
printf " 🚧  SELF REVIEW CHANGES 🚧\n\n"
printf " 🤖  - This is to check if you did not forget anything while you were coding\n" 
# Checklist:
printf "      Please answer the following just to be sure we are following some of our rules of contribution.\n\n"
read -p " 👩🏽‍💻  - I have performed a self-review of my own code (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
read -p "      I have commented my code, particularly in hard-to-understand areas (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
read -p "      I have made corresponding changes to the documentation (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
read -p "      My changes generate no new warnings in console (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
read -p "      I have added tests that prove my fix is effective or that my feature works (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
printf "\n"
printf " 🤖  - Awesome, thanks for being an excellent developer! ❤️\n"
printf "      We've finished the self review checkpoint!\n\n"