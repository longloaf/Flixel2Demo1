package com.longloaf.d09_sort 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D09 extends FlxState
	{
		private var help:DemoHelp;
		private var numText:FlxText;
		
		private var group:FlxGroup;
		
		override public function create():void 
		{
			help = new DemoHelp();
			help.addText("[1] - add 10 sprites");
			help.addText("[2] - add 100 sprites");
			numText = help.addText();
			help.addVSpace();
			help.addText("[X] - clear");
			
			group = new FlxGroup();
			
			add(group);
			add(help);
			add(new DemoPrompt("Sort"));
			
			addSprites(100);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				addSprites(10);
			} else if (FlxG.keys.justPressed("TWO")) {
				addSprites(100);
			} else if (FlxG.keys.justPressed("X")) {
				group.clear();
				updateNumText();
			}
			super.update();
			group.sort("posY");
		}
		
		private function updateNumText():void
		{
			numText.text = "Num: " + group.length;
		}
		
		private function addSprites(n:int):void
		{
			for (var i:int = 0; i < n; ++i) {
				group.add(new D09_Sprite());
			}
			updateNumText();
		}
		
	}

}