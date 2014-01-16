package com.longloaf.d05_camera 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05 extends FlxState
	{
		private var help:DemoHelp;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			add(help);
			add(new DemoPrompt("Camera"));
		}
		
	}

}