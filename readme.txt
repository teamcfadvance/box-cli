   _____                                          _ ____            
  / ____|                                        | |  _ \           
 | |     ___  _ __ ___  _ __ ___   __ _ _ __   __| | |_) | _____  __
 | |    / _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` |  _ < / _ \ \/ /
 | |___| (_) | | | | | | | | | | | (_| | | | | (_| | |_) | (_) >  < 
  \_____\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|____/ \___/_/\_\ v1.0.0.@build.number@
     
********************************************************************************
Trademark + Copyright since 2014 by Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
HONOR GOES TO GOD ABOVE ALL
********************************************************************************
WELCOME TO COMMANDBOX
********************************************************************************
Welcome To The CommandBox CLI, Package Manager, REPL and much more!
CommandBox created & copyright & trademark by Ortus Solutions, Corp
www.ortussolutions.com/products/commandbox
********************************************************************************
COMMANDBOX INSTALLATION
********************************************************************************
IVY/Maven/cfdistro package managers or direct download (jar, bin, win32):

http://cfmlprojects.org/artifacts/com/ortussolutions/box.cli

Package repository for REDHAT based Linux:

Add the following to to: /etc/yum.repos.d/box.repo
[box]
name=Box $releasever - $basearch
failovermethod=priority
baseurl=http://cfmlprojects.org/artifacts/RPMS/noarch
enabled=1
metadata_expire=7d
gpgcheck=0

Then run "sudo yum update; sudo yum install box-cli"


Install repository for DEBIAN based Linux

Add the following to: /etc/apt/sources.list.d/box.list
deb http://cfmlprojects.org/artifacts/debs/ ./

Then run "sudo apt-get update; sudo apt-get install box-cli"

********************************************************************************
COMMANDBOX USAGE
********************************************************************************
CommandBox is either an EXE, a binary, or a JAR file, depending on preference.  They
all work the same, expanding the needed resources by default into your user home
directory under .CommandBox/ (if not there already).

You can run CommandBox in interactive CLI mode, or server mode.  To run in interactive
mode, simply type "box".  To run the server, type "box -server".

Type "box help", or "help" at the CommandBox> prompt to get a list of available commands.  
Type "help [command]" for in-depth descriptions.

********************************************************************************
COMMANDBOX COMMANDS
********************************************************************************
CommandBox is extensible via CFML by creating command CFCs.  Any CFC in the 
'${box.home}/commands' directory will be registered as a command as 
long as it extends 'commandbox.system.BaseCommand' and has a 'run()' method.
CFCs that are nested in subfolders, will create multi-part command names Ex:

${box.home}/commands/testbox/run.cfc

That would create a two-part command called "testbox run"
Everything after the command is considered parameters.

All CFC's are wired via WireBox, so dependency injection is available to them.

Tab completion and help are powered by metadata on these CFCs.  If you would like
to use a friendlier name for your command, add the attribute "aliases" to the component
which is a comma-delimited list of names:

dir.cfc
/**
 * List directories
 * 	ex: dir /my/path
 **/	 
component extends="commandbox.system.BaseCommand" aliases="ls,directory" {

	/**	
	 * @directory.hint directory
	 * @recurse.hint recursively list
	 **/
	function run( String directory="", Boolean recurse=false )  {
		...
	}

}
 

********************************************************************************
COMMANDBOX DEVELOPMENT
********************************************************************************
To hack on the sources, there are two main approaches.

The easiest is to install CommandBox, CD into the project root, and then run:

"box execute ./src/cfml/system/Bootstrap.cfm" (without quotes)

This will load the source version of the shell, instead of the included one.  
Make any changes you want to the sources, and then at the CommandBox> prompt 
run "reload", which will load your changes.

The second way is to build the test server and run the tests through the IDE or
the TestBox facade:

"box-cli build.testwar" (builds the test war)
"box-cli runwar.start.fg" (starts the test server)

Browse to:

"http://127.0.0.1:8088/tests/{path/to/test/cfc/to/run}"

********************************************************************************
VERSIONING
********************************************************************************
CommandBox is maintained under the Semantic Versioning guidelines as much as possible.

Releases will be numbered with the following format:

<major>.<minor>.<patch>

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

********************************************************************************
COMMANDBOX BUILD
********************************************************************************
CommandBox is built with cfdistro, which is a bunch of CFML specific Ant scripts.  Running 
the box-cli or box-cli.bat file should automatically download cfdistro to your
home directory (./cfdistro ~5M) from:

http://cfmlprojects.org/artifacts/cfdistro/latest/cfdistro.zip 

To build the box.jar for any platform:

box-cli build

To build the box.exe for Windows:

box-cli build.cli.exe

To build the box binary for Linux and OS X:

box-cli build.cli.bin

To build them all, run:

box-cli build.cli.all

If you'd like to run the tests (for CI, etc.), run:

box-cli build.test

If you've run "build.test" once, you just can run:

box-cli test

or if you'd like to run the test server continually (for IDE development), run:

box-cli runwar.start.fg

which will start a server on port 8088 and wait for a ctrl-c to terminate.

********************************************************************************
COMMANDBOX LICENSE
********************************************************************************
CommandBox is open source and bound to the LGPL v3
GNU LESSER GENERAL PUBLIC LICENSE
Copyright (C) TradeMark (TD) <since 2014> <Ortus Solutions, Corp>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

********************************************************************************
CREDITS & CONTRIBUTIONS
********************************************************************************
I have included some software from other open source projects and I have used
some code from open source projects in this framework. If I have forgotten
to name someone, please send me an email about it.

GOD	
	I THANK GOD FOR HIS WISDOM FOR THIS PROJECT

********************************************************************************
THE DAILY BREAD
********************************************************************************
"I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12
