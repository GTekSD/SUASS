# Bash Environment and Scripting
#### OBJECTIVE 
- Review the basic concepts of BASH
- Explore scripts specific to pen testing
- Create and test BASH scripts

## BASH - Bourne-Again SHell
- One of the best things is that most Linux machines will almost certainly have BASH.
- Multiple methods can be used to extract data as well as cover the pen tester’s tracks.
- Use the following to display the default shell: `echo $SHELL`

Bash is a command language interpreter. It is widely available on various operating systems and is a default command interpreter on most GNU/Linux systems. The name is an acronym for the “Bourne-Again SHell.”

To see your default interpreter, execute command `echo $SHELL`
```zsh
┌──(gteksd㉿kali)-[~]
└─$ echo $SHELL
/usr/bin/bash
```

## Shebang
- All BASH script files start with the Shebang.
  - `#!/bin/bash`
- Created scripts must be executable.
  - `chmod +x FILENAME`
  - Can also use the `bash test.sh`
- The file command can be used to identify the BASH script.

As a review, all BASH scripts must be made executable, and they start with a shebang and this is how they are identified. As discussed earlier, the file command can identify the file type as a shell script.  
Another way to execute bash scripts is to call the bash interpreter explicitly, e.g. `$ bash date.sh`; hence, the script can be executed without making the shell script executable and without declaring shebang directly within a shell script.
```zsh
┌──(kali㉿kali)-[~]
└─$ echo "#\!/bin/bash" > test.sh
                                                                                                                       
┌──(kali㉿kali)-[~]
└─$ file test.sh
test.sh: Bourne-Again shell script, ASCII text executable
```

## Variables 
- Allow for storing data
- Variables can also be used directly on the terminal's command line.

Variables are the essence of programming. Variables allow a programmer to store data, alter, and reuse them throughout the script.

We have declared a variable **greeting** and assigned a string value **Welcome** to it. The next variable **user** contains a value of the user name running a shell session. This is done through a technique called command substitution. This means that the output of the whoami command will be directly assigned to the user variable. The same applies for our next variable **day**, which holds the name of today's day produced by the **date +%A** command.

The second part of the script uses the echo command to print a message while substituting variable names now prefixed by $ sign with their relevant values. Regarding the last variable used, **$BASH_VERSION**, this so-called internal variable is defined as part of your shell.

```zsh
#!/bin/bash

greeting="Welcome"
user=$(whoami)
day=$(date +%A)
echo "$greeting back $user! Today is $day, which is the best day of the entire week!"
echo "Your Bash shell version is: $BASH_VERSION. Enjoy!"
```
```console
┌──(gteksd㉿kali)-[~]
└─$ bash greetings.sh    
Welcome back gteksd! Today is Wednesday, which is the best day of the entire week!
Your Bash shell version is: 5.2.37(1)-release. Enjoy!
```

## Parameter Expansion
- Allows for additional data to be used and stored in the following:
  ```
  output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz
  ```
```zsh
#!/bin/bash
# This bash script is used to backup a user's home directory to /tmp/.

user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

tar -czf $output $input
echo "Backup of $input completed! Details about the output backup file:"
ls -l $output
```
```console
┌──(kali㉿kali)-[~]
└─$ ./backup.sh                              
tar: Removing leading `/' from member names
Backup of /home/kali completed! Details about the output backup file:
-rw-rw-r-- 1 kali kali 31882932 Jan 22 02:09 /tmp/kali_home_2025-01-22_020947.tar.gz
```

The script contains the comment line. Every line starting with # sign except the shebang will not be interpreted by bash and will only serve as a programmer's internal note.  
The “$” character introduces parameter expansion, command substitution, or arithmetic expansion. The parameter name or symbol to be expanded may be enclosed in braces, which are optional but serve to protect the variable to be expanded from characters immediately following it, which could be interpreted as part of the name.  
When braces are used, the matching ending brace is the first ‘}’ not escaped by a backslash or within a quoted string and not within an embedded arithmetic expansion, command substitution, or parameter expansion.  
The basic form of parameter expansion is **${parameter}**. The value of the parameter is substituted. The parameter is a shell parameter as described above. The braces are required when the parameter is a positional parameter with more than one digit, or when the parameter is followed by a character that is not to be interpreted as part of its name.  
The curly braces {} are required because our variable **$user** is followed by characters that are not part of its variable name.

## Input, Output, and Error Redirections
- As a review, all programs usually output to one of three places:
- stdin
- stdout
- stderr
  - `tar -czf $output $input`
    - Outputs to the screen (stdin)
  - `tar -czf $output $input 2> /dev/null`
    - Outputs to the stderr redirected to /dev/null

Normally, commands executed on GNU/Linux command line either produce output, require input, or throw an error message. This is a fundamental concept for shell scripting as well as for working with GNU/Linux's command line in general. These three file descriptors are the same across most languages.  
The difference between stdout and stderr output is an important concept as it allows us to redirect each output separately. The > notation is used to redirect stdout to a file, whereas 2> notation is used to redirect stderr, and &> is used to redirect both stdout and stderr.  
Again, these are standard items for all languages.

## Functions 
- Same as other languages
- Not mandatory
  - Can be with or without
- Makes the code cleaner
  - Easier to troubleshoot
```
# The function total files reports a total number of files for a given directory.
  function total files {
                 find $1 -type f | wc -l
                 }
```
Functions allow a programmer to organize and reuse code, thus increasing the efficiency, execution speed, as well as readability of the entire script.  
It is possible to avoid using functions and write a script without including a single function in it. However, the outcome is likely to be a chunky, inefficient, and hard-to-troubleshoot code.  
The function can be understood as a way to group a number of different commands into a single command. This can be extremely useful if the required output or calculation consists of multiple commands, and is expected multiple times throughout the script execution. Functions are defined by using the function keyword and followed by the function body enclosed in curly brackets. This is the same across languages.  
We have defined a new function called **total_files**. The function utilized the **find** and **wc** commands to determine the number of files located within a directory supplied to it during the function call.
