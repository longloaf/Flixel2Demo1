package com.longloaf.d09_sort 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D09 extends FlxState
	{
		private var help:DemoHelp;
		
		private var group:FlxGroup;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			group = new FlxGroup();
			
			add(group);
			add(help);
			add(new DemoPrompt("Sort"));
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.pressed()) {
				group.add(new D09_Sprite());
			}
			super.update();
			group.sort("posY");
		}
		
	}

}