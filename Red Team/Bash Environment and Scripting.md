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
