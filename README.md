# Sapphire Butler

Sapphire Butler is an extensible task executor that aims to make certain tasks easier to do or simply more user friendly. 

## Installation

Simply run `sudo make install` to install Sapphire Butler.

## Usage

Like real life butler work, *Tasks* are organized into *Departments*. There are *Administrative (admin)*, *Fun (fun)*, *Network/Internet (net)*, *Package Management (pkg)*, and *Productivity (prod)* tasks. You can view all tasks in a department by simply typing the department.

```bash
> butler admin
Available tasks in the admin department:
admin/homebackup
admin/ntpon
admin/updategrub
admin/zramswapenable
admin/ntpoff
admin/zramswapuninstall
admin/localegen
admin/zramswapdisable
admin/zramswapinstall
```

To run any task, specify the department followed by the task, separated by a forwards slash.

```bash
> butler net/neton
[❖ BUTLER] Running task "Turn on networking"...
[❖ BUTLER] I successfully turned on networking.
[❖ BUTLER] Task "Turn on networking" completed.
```

A yad-powered GUI interface is available by executing `butler prod/butleryad`.

## Contributing / Adding Tasks

Adding a task to Sapphire Butler is easy and only requires a bit of shell scripting knowledge (or more, if you are doing something more complicated). 

First go into the i18n directory of the source tree, choose what department you want to use, and then change into that directory in the source tree and make another directory with your task name. Then change into that directory.

```bash
cd i18n/fun
mkdir lofihiphopradio
cd lofihiphopradio
```

Create a file that is named whatever language you speak. If you use the `$TASK` environment variable here, the language is automatically chosen based on your current language.

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
