# Sapphire Butler

Sapphire Butler is an extensible task executor that aims to make certain tasks easier to do or simply more user friendly. 

It is designed to work perfectly on Sapphire GNU/Linux and it's parent distributions Arch and Parabola as well as their children, but there is only a little support for other distributions and the use of Sapphire Butler on those systems is cautioned against until proper support can be given for them.

## Installation

### Arch User Repository

Sapphire Butler is available in the Arch User Repository as `sapphire-butler`. Install it with your favorite AUR helper.

### Manual Install

Clone the Git repository with `git clone https://codeberg.org/Sapphire/sapphire-butler` run `sudo make install` in the source tree to install Sapphire Butler manually.

## Usage

Like real life butler work, *Tasks* are organized into *Departments*. There are *Administrative (admin)*, *Fun (fun)*, *Network/Internet (net)*, *Package Management (pkg)*, and *Productivity (prod)* tasks. You can view all tasks in a department by simply typing the department.

```bash
> butler admin
[❖ BUTLER] Available tasks in the admin department:
	Name                           Department/Task               
------------------------------------------------------------
Home Backup                    admin/homebackup              
Turn on NTP                    admin/ntpon                   
Install a LAMP Stack           admin/lampinstall             
Update GRUB Bootloader Config  admin/updategrub              
Enable zRAM for Swap Service   admin/zramswapenable          
Turn off NTP                   admin/ntpoff                  
Uninstall zRAM for Swap        admin/zramswapuninstall       
Generate Locales               admin/localegen               
Disable zRAM for Swap Service  admin/zramswapdisable         
Install zRAM for Swap          admin/zramswapinstall        
```

To run any task, specify the department followed by the task, separated by a forwards slash.

```bash
> butler net/neton
[❖ BUTLER] Running task "Turn on networking"...
[❖ BUTLER] I successfully turned on networking.
[❖ BUTLER] Task "Turn on networking" completed.
```

A yad-powered GUI interface is available by executing `butler prod/butleryad`.

## Developer Todo

* Either restrict platform support to Arch based Linux distros or get perfect cross-distro support.
* Translate all tasks into at least two non-English languages.
* Code 50 Tasks.
* Configuration File Support.

## Contributing / Adding Tasks

Adding a task to Sapphire Butler is easy and only requires a bit of shell scripting knowledge (or more, if you are doing something more complicated). 

First go into the i18n directory of the source tree, choose what department you want to use, and then change into that directory in the source tree and make another directory with your task name. Then change into that directory.

```bash
cd i18n/fun
mkdir lofihiphopradio
cd lofihiphopradio
```

Create a file that is named the language code of whatever language you speak. If you use the `$LANG` environment variable here, the language is automatically chosen based on your current language.

```bash
vim en_US.UTF8
```

OR

```bash
vim $LANG
```

Now we need to define variables that will contain text in our spoken language. The required variables are `name` and `description`. We should also define variables here that will contain text for our task later, but this is optional if there are none needed.

```bash
name="Play LoFi Hip Hop Radio"
description="Plays a LoFi Hip Hop Icecast Radio Station."
```

Write that file and then go back to the root of the source tree.

Next choose what department you want to use, and then change into that directory in the source tree and make another directory with your task name. Then change into that directory.

```bash
cd departments/fun
mkdir lofihiphopradio
cd lofihiphopradio
```

Create a file called `task.sh`. Here we write the script that will be executed when the user wants to use our task. Since our task right now is just playing an internet radio station, our task is very straight forward.

Things to note:
* There is no need to specify a shebang (ex. `#!/bin/bash`).
* Don't use `echo` or `notify-send`. Use `butlermsg` to send messages, if needed.
* There shouldn't be any plaintext in this file unless it is being translated in the script. Use the variables you should have set in the language file in the `i18n` directory.

```bash
xdg-open http://hyades.shoutca.st:8043/stream
```

Feel free to use this directory for any files that your task needs such as images or configuration files.

We have now created a task. Go back to the root of the source tree and then run `sudo make install` to install Sapphire Butler, then run your task to test it.

There are infinite possibilities of what you can put into a task. Check out some of the preexisting tasks to learn more tips and tricks.
