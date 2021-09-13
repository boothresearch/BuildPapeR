# Remote FTP Exercise
## Some Background: Why Remote FTP?
For some of your projects as an R.P. and beyond, you may find yourself having to develop and run code on remote servers instead of your own machine. Many researchers use proprietary datasets, and the owners of such data typically do not want all researchers to have a copy of the data on their personal computers. Instead, the owners of the data can set up a remote server which researchers can access using a secure log-in called an ssh connection. Some common examples of datasets that may require this type of connection are:
- medical or health records that are protected under HIPAA
- government datasets such as block-level census data that may not be public
- individual-level expenditure data from a private bank or credit card company

Depending on the setup offered by the server-providers, you may not be able to develop code in the ways that you're used to. Individual researchers often don't have the permissions to install applications on the server, so tools like RStudio and Jupyter Notebooks may not be available. If you are really comfortable working with just your shell, you can of course develop code using vim. For most of us, though, vim is a fairly steep learning curve. Luckily we have another option: the `ftp-simple` extension in VSCode!

## How Does `ftp_simple` Work?
The `ftp_simple` extension in vscode allows us to develop code on a remote server from the comfort of our local machine. Basically, we set up a config file that tells vscode how to connect to the server and then it creates local copies of the files that are in the remote directory. When we edit these files in vscode while connected to the server, vscode will then upload our edited files to the server, replacing the old versions with the new edits. Now that we have a basic understanding of why `ftp_simple` might be useful, let's try setting up an FTP connection in VSCode.

*Note: Although we will focus on a vscode example for today, know that similar extensions exist in other text editors (e.g. `remote_ftp` in Atom), so if you prefer another editor you can likely find an analog there.*

## `ftp_simple` Example in VSCode
### 1. Install the `ftp_simple` extension in VSCode
Go to the `Extensions` tab on the left side if your VSCode editor, search for `ftp_simple`, and click `Install`. It should install in a few seconds.
### 2. Set up the FTP config
Next use F1 or Cmd+Shift+P to bring up the command search bar and find `ftp_simple:Config`. This will open a .json file with the fields `name`, `host`, `port`, and several more. This is the file that will tell VSCode how to access our remote server. Usually, the only fields you'll want to edit are the following:
| Field | Meaning |
| ----- | ------- |
| name  | the name you would like to use to reference this server |
| host | the address for your remote host; this may look something like server_01.nber.org |
| username | the personal username you use to log into the server |
| password | your password |
| path | the project path relative to your home directory on the server |

For today, your config file should look like this:
```
[
	{
		"name": "booth_wcfr",
		"host": "SERVER_NAME",
		"port": 21,
		"type": "ftp",
		"username": "YOUR_USERNAME",
		"password": "PASSWORD?",
		"path": "USER_DIRECTORY",
		"autosave": true,
		"confirm": false
	}
]
```
### 3. Connect to the Remote Server
Now that we've told VSCode how to access the server, it's time to connect! First, open a new terminal within VSCode and go to the `OUTPUT` tab. This is where we'll see if our connection has worked successfully. Use F1 or Cmd+Shift+P to bring up the command search bar again, and this time find `remote_ftp:Remote`. Select `booth_wcfr` (or whatever you've named the server in your config file). Then it will ask you to enter a directory; you can just hit enter to go to the directory you specified in your config file.

### 4. Edit A Script Remotely From VSCode
Congratulations! You have now used VSCode to remotely connect to a server. This is useful, because now you can edit scripts on this server from the comfort of your beautiful, personally customized text editor. Let's practice this! In your directory on the server, you should already have the necessary files to build `paper.pdf`. The file list should appear on the left-hand side of your VSCode interface. Before we build our paper, let's make a change to the RMarkdown file from which the pdf is compiled. 
- Click on `paper.Rmd` to open it in the text editor
- Add yourself as a coauthor
- Save

### 5. Compile The Paper
WOW! You've edited a file on a faraway server without ever leaving your own machine! Now, all that's left to do is build the paper with the updated script. If you return to your terminal in VSCode, you should be able to interact with and run files on the server in the directory you specified in your config file. To build our paper, we simply need to run the command `make`. If it works, we should be able to refresh our file tree and see a new a file called `paper.pdf` If you click on this file, it may look funny in VSCode (since PDFs don't naturally play nicely with text editors), but opening it in VSCode will download a copy of the file to your computer. You should be able to open this copy outside of VSCode, wherever the local version of your project is stored, and see your name listed at the top of the page.
