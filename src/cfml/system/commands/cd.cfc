/**
 * The command will change the current working directory
 *
 * cd /tests
 *
 **/
component extends="commandbox.system.BaseCommand" aliases="" excludeFromHelp=false {

	/**
	 * @directory.hint The directory to change to
	 **/
	function run( directory="" )  {
		
		// This will make each directory canonical and absolute		
		arguments.directory = fileSystemUtil.resolvePath( arguments.directory );
		
		return shell.cd( arguments.directory );
	}


}