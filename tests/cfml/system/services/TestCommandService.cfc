component extends="mxunit.framework.TestCase" {
//component extends="testbox.system.testing.TestBox" {

	public void function setUp()  {
		//application.wirebox.clearSingletons();
		shell = application.wirebox.getInstance( 'Shell' );
		commandService = application.wirebox.getInstance( 'CommandService' );
	}

	public void function testInitCommands()  {
		var commands = commandService.getCommands();
		assertTrue(structKeyExists(commands,"quit"));
	}

	public void function testHelpCommands()  {
		commandChain = commandService.resolveCommand( "coldbox help" );
		assertTrue(commandChain[1].commandString == 'help');
	}
	
	public void function testResolveCommand()  {
		commandChain = commandService.resolveCommand( "help | more" );
		assertTrue(commandChain.len() == 2);
	}
		
	public void function testRunCommandLine()  {
		result = commandService.runCommandLine( "help" );
	}
		
	public void function parsePositionalParams()  {
		result = commandService.resolveCommand( "info test foobar 
													""goo"" 
													'doo' 
													 ""this is a test"" 
													 test\""er 
													 12\=34" );
		params = result[ 1 ].parameters;
		
		assertEquals( params[ 1 ], 'test' );
		assertEquals( params[ 2 ], 'foobar' );
		assertEquals( params[ 3 ], '"goo"' );
		assertEquals( params[ 4 ], "'doo'" );
		assertEquals( params[ 5 ], '"this is a test"' );
		assertEquals( params[ 6 ], 'test\"er' );
		assertEquals( params[ 7 ], '12\=34' );
	}
		
	public void function escapePositionalParams()  {
		result = commandService.resolveCommand( "info test foobar 
													""goo"" 
													'doo' 
													 ""this is a test"" 
													 test\""er 
													 12\=34" );
		params = result[ 1 ].parameters;
		result = commandService.parseParameters( params );
													 
		params = result.positionalParameters;
													 
		assertEquals( params[ 1 ], 'test' );
		assertEquals( params[ 2 ], 'foobar' );
		assertEquals( params[ 3 ], 'goo' );
		assertEquals( params[ 4 ], "doo" );
		assertEquals( params[ 5 ], 'this is a test' );
		assertEquals( params[ 6 ], 'test"er' );
		assertEquals( params[ 7 ], '12=34' );
								
	}
	
		
	public void function parsePositionalParams()  {
		result = commandService.resolveCommand( "info 
												param=1 
												arg=""no""
												me='you' 
												arg1=""brad wood"" 
												arg2=""Luis \""The Dev\"" Majano"" 
												test  =  		 mine 	 
												tester   	=  	 'YOU' 	
												tester2   	=  	 ""YOU2""" );
		params = result[ 1 ].parameters;
						
		assertEquals( params[ 1 ], 'param=1' );
		assertEquals( params[ 2 ], 'arg="no"' );
		assertEquals( params[ 3 ], "me='you'" );
		assertEquals( params[ 4 ], 'arg1="brad wood"' );
		assertEquals( params[ 5 ], 'arg2="Luis \"The Dev\" Majano"' );
		assertEquals( params[ 6 ], 'test=mine' );
		assertEquals( params[ 7 ], "tester='YOU'" );
		assertEquals( params[ 8 ], 'tester2="YOU2"' );
	}
		
	public void function escapePositionalParams()  {
		result = commandService.resolveCommand( "info 
												param=1 
												arg=""no""
												me='you' 
												arg1=""brad wood"" 
												arg2=""Luis \""The Dev\"" Majano"" 
												test  =  		 mine 	 
												tester   	=  	 'YOU' 	
												tester2   	=  	 ""YOU2""" );
		params = result[ 1 ].parameters;
		result = commandService.parseParameters( params );
													 
		params = result.namedParameters;

		assertTrue( structKeyExists( params, 'param' ) );	 
		assertEquals( params.param, '1' );
		
		assertTrue( structKeyExists( params, 'arg' ) );
		assertEquals( params.arg, 'no' );
		
		assertTrue( structKeyExists( params, 'me' ) );
		assertEquals( params.me, 'you' );
		
		assertTrue( structKeyExists( params, 'arg1' ) );
		assertEquals( params.arg1, 'brad wood' );
		
		assertTrue( structKeyExists( params, 'arg2' ) );
		assertEquals( params.arg2, 'Luis "The Dev" Majano' );
		
		assertTrue( structKeyExists( params, 'test' ) );
		assertEquals( params.test, 'mine' );
		
		assertTrue( structKeyExists( params, 'tester' ) );
		assertEquals( params.tester, 'YOU' );
		
		assertTrue( structKeyExists( params, 'tester2' ) );
		assertEquals( params.tester2, 'YOU2' );
								
	}
	
}