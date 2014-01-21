package com.longloaf.d07_replays 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D07 extends FlxState
	{
		private var help:DemoHelp;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			add(help);
			add(new DemoPrompt("Replays"));
		}
		
		override public function update():void 
		{
			super.update();
			
			//FlxG.rec
		}
		
	}

}