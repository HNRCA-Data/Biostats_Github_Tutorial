--Git Bash Steps--
https://docs.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line
Download git https://git-scm.com/download/win
Installing with the default options will be sufficient
Navigate to project directory in file explorer. 
Create a new file called '.gitignore' and open in a text editor
	Add all files that should not be uploaded to github (only upload code for now, ignore data and sensitive info)
	**/Archive will ignore all 'Archive' directories recursively
	*.csv will ignore all csv files
	https://www.atlassian.com/git/tutorials/saving-changes/gitignore#git-ignore-patterns
	
Right click and select 'Git Bash Here'
	$ git init
	$ git add .
	$ git commit -m "Commit message"
Go to github.com, create an account if you haven't already.
Click the top right icon, select 'Your Organizations', Click 'HNRCA-Data'
Click the 'New' button on the right to create your repository. Name the repo and be sure to keep it private
Copy the repo url. Eg https://github.com/HNRCA-Data/test.git
	$ git remote add origin https://github.com/HNRCA-Data/test.git
	$ git push origin master
	
Now that he repo is setup, simply commit and push new changes as you make them
This can be done via the terminal or GUIs provided by git, RStudio, or GitHub

--RStudio Git GUI--


--GitHub Desktop Steps--
GitHub has written a very clean, useable, and comprehensive GUI for git. 
This will generally be the recommended method for interfacing with git, 
however it is designed to initialize new repositories with an empty project 
directory and this causes issues that may result in files being overwritten or deleted.


Navigate to project directory in file explorer. 
Create a new file called '.gitignore' and open in a text editor
	Add all files that should not be uploaded to github (only upload code for now, ignore data and sensitive info)
	**/Archive will ignore all 'Archive' directories recursively
	*.csv will ignore all csv files
	https://www.atlassian.com/git/tutorials/saving-changes/gitignore#git-ignore-patterns

Download from https://desktop.github.com/
Install and open GitHub Desktop, create an account if needed
