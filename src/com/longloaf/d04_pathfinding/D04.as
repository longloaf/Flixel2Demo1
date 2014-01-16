package com.longloaf.d04_pathfinding 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D04 extends FlxState
	{
		private var help:DemoHelp;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			add(help);
			add(new DemoPrompt("Pathfinding"));
		}
		
	}

}