#!/bin/bash
#this is a modification done by me.

#To find the sub-directories and look for html and pdf files in them and copying them to another file-system.

read -p "Enter the location to find the file(s) in " location                 #asking location to check for sub-directories & files.(To check in root please press ENTER!)
read -p "Enter the location to save the file(s) " to_save                     #asking location to copy the files found


if [ "$(ls -A $HOME/$location)" ]     #Checking for all the directories present including the hidden files.
then
	cd $location                  #moving to the location entered
       	tree                          #Checking for and printing the Sub-directories
	echo " "
	echo "All the Directories and Sub-Directories are Listed above."
	echo "----------------------------------------------------------- "
	echo ""
     	find $HOME/$location -name "*.html" && find $HOME/$location -name "*.pdf"         #Searching for HTML and PDF files in the location entered and printing if found.
	echo " "
	
        #saving the HTML and PDF files to "list.txt" file and copying to the desired location.
	find $HOME/$location -name "*.html" > $HOME/$to_save/list.txt && find $HOME/$location -name "*.pdf" >> $HOME/$to_save/list.txt   
	

	words=$(wc -l < $HOME/$to_save/list.txt)              #Counting the number of lines in "list.txt"
	if [ $words -le 0 ]                                   #if count <= 0-->No HTML and PDF files found.
	then
		    	
			
			echo "----------------------------------------"
			echo "No HTML or PDF files in $location "
			echo ""
		else					      #if count > 0--> Listing them.
			
			echo "----------------------------------------"
			echo "The HTML and PDF files exist and are listed above."
			echo "All the .html and .pdf files have been saved in list.txt and copied to $to_save location successfully!!!"
			echo "----------------------------------------"
			
		fi
else
	echo "----------------------------------------"
	echo "Sub-directories or files do not exist in $location..."
	echo "----------------------------------------"
fi

