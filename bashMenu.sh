#!/bin/bash
# set up variable to test in do while loop.
stop=0

#test stop and continue until stop does not equal 0
while [ $stop -eq 0 ]
do
#clear screen
clear

# print menu
echo
echo ------------------------------
echo
echo  1: Open Editor
echo  2: Word Count
echo  3: Show File
echo  4: Sort
echo  5: Exit
echo
echo  Please select an item
echo ----------------------------
# wait/read users input and store it in the variable option
# read switches -n 1  will return after reading 1 character.  
# -s stops the input been echoed to the screen,
# -r just stops the user from using backslash to escape a character. 
read -n 1 -s -r option

case $option in
# open a document in nano with the filename poem.
"1") nano words ;; 

# open peom in wc using the --words switch to show word count.
"2") clear #clear the screen
echo  Your Poem has  #output text to explain the number
wc --words words # count the words
# create a pause so the user can see the output
# the additional switch -p just outputs the prompt rather than us echoing it.
read -n 1 -s -r -p "Press any key to continue"  ;;

"3") clear # clear the screen
# display the options to the user and the number they need to enter to select an option.  \[1\] is showing the default option.
echo Would you like to view the poem using 1\) \'more\' or  2\)\'less\'? \[1\] 
# Get user input
read -n 1 -s -r selection
# test to see if the user has pressed enter or 1
# The variable "$selection" is in the double quotes to stop errors with empty input.
if [ -z "$selection" ] || [ "$selection" -eq 1 ] 
then
# Open poem in more
more words
# create a pause for user to read output of more
read -n 1 -s -r -p "Press any key to continue"
#if the user has pressed anything else 
else
# show poem using less
less words
# endif
fi ;;
 
"4") clear # clear the screen
sort -o sortOutput words # sort the poem lines by alphabetical order and output it to sortOutput

# tell the user it has been down and ask them how they would like to view the output
echo The poem has been sorted, would you like to view it in 1\) \'cat\' or 2\) \'more\'? \[1\]
# read user input
read -n 1 -s -r outputselection
if [ -z "$outputselection" ] || [ "$outputselection" -eq 1 ]
then
# display output file using cat
cat sortOutput
else
# display output file using more
more sortOutput
# endif
fi
read -n 1 -s -r -p "Press any key to continue"  ;;

# exit the loop by changing the value of var stop. so when the value of stop is re-evaulated on the next loop it will exit the loop.
"5") let stop=1 ;;
# Display an error if the user enters a number not in the menu. 
*) echo I\'m sorry, The number you have entered was not an option. ;;

# close case
esac
#close while loop
done

