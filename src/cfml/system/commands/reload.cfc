/**
 * Reload CLI
 * This is a maintenance operation to recreate the shell and reload all commands in the command folder.
 * Use this if developing commands to quickly reload your changes after modifying the command's CFC file.
 **/
component extends="commandbox.system.BaseCommand" aliases="r" excludeFromHelp=true {

	/**
	 * @clearScreen.hint Clears the screen after reload
  	 **/
	function run( Boolean clearScreen=true )  {
		print.boldLine( 'Reloading shell...' );
		shell.reload( arguments.clearScreen );
	}

}