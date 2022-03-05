# Sapphire Butler

<p align="center">
  <img src="art/butler.svg" />
</p>

Sapphire Butler is an extensible task executor and shell script codebase that aims to make certain tasks easier to do or simply more user friendly. 

It is designed to work perfectly on Sapphire GLS and it's parent distributions Arch and Parabola as well as their children, but there is only a little support for other distributions and the use of Sapphire Butler on those systems is cautioned against until proper support can be given for them.

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

If a task name is unique, it is also possible to issue only the task name and run the task.

A yad-powered GUI interface is available by executing `butler prod/butleryad`.

## Developer Todo

* Code 50 Tasks.
* Translate all tasks into at least two non-English languages.

## Contributing / Adding Tasks

Adding a task to Sapphire Butler is easy and only requires a bit of shell scripting knowledge (or more, if you are doing something more complicated). 

If you want to make this process more simple, there is a Task Editor included with Sapphire Butler. If you want to make edits to the source tree, you can run the `taskeditor.sh` script with `bash taskeditor.sh` command. 

If you have Sapphire Butler installed, you can use it's `admin/taskeditor` task to make edits or add to your Sapphire Butler installation. Just remember that once you upgrade, your changes might be overwritten.

In this tutorial, we will manually create a task to play a Lofi Hip Hop Radio Station by working directly from the source tree. You can obtain the source tree by running `butler prod/butlersrc`, and then you can enter it by running `cd sapphire-butler`.

### Creating the Language File

We need to create a language file so that your task has a name and description and is translatable.

First go into the i18n directory of the source tree, choose what department you want to use, and then change into that directory in the source tree and make another directory with your task name. Then change into that directory.

```bash
cd i18n/fun
mkdir lofihiphopradio
cd lofihiphopradio
```

Create a file that is named the language code of whatever language you making the language file for. For example, English is en, Spanish is es, Chinese is zh, French is fr, German is de, Italian is it, Japanese is ja, Russian is ru. Check [here](https://saimana.com/list-of-country-locale-code/) for a larger list.

In this file, we need to define variables that will contain text in our spoken language. The required variables are `name` and `description`. We should also define variables here that will contain text for our task later, but this is optional if there are none needed.

```bash
name="Play LoFi Hip Hop Radio"
description="Plays a LoFi Hip Hop Icecast Radio Station."
```

Write that file and then go back to the root of the source tree.

### Creating the Task Script

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
* There shouldn't be any plaintext in this file unless it is being translated in the script. Use the variables you should have set in the language file in the `i18n` directory as that file is sourced before this script is run.

The contents of our `task.sh` will contain the following:

```bash
clementine -pl http://hyades.shoutca.st:8043/stream
```

Feel free to use this directory for any files that your task needs such as images or configuration files.

### Creating the Dependency List

We have now written a task that uses the `clementine` music player. But we cannot just make a guess as to if the user has clementine installed. We have to add `clementine` to our `dependencies.list`, a file containing the required packages for running your task.

While in our same directory we have the `task.sh` file, we need to make a `dependencies.list` file. This file will contain each package that our task needs on it's own line.

For our task, we simply have `clementine` on it's own line:

```
clementine
```

Say if we had a seperate package that the task needed, we would add it like this:

```
clementine
otherpackage
```

### Finishing Off

We have now created a task. Go back to the root of the source tree and then run `sudo make install` to install Sapphire Butler, then run your task to test it.

There are infinite possibilities of what you can put into a task. Check out some of the preexisting tasks to learn more tips and tricks.
