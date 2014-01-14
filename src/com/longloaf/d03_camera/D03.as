package com.longloaf.d03_camera 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxCamera;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03 extends FlxState
	{
		private var help:DemoHelp;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			add(help);
			add(new DemoPrompt("03"));
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}