package com.longloaf.d01_sprite 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D01 extends FlxState
	{
		
		private var group:FlxGroup;
		
		private var demoHelp:DemoHelp;
		
		private var numText:DemoText;
		
		override public function create():void 
		{
			group = new FlxGroup();
			add(group);
			
			demoHelp = new DemoHelp();
			demoHelp.addText("K(1..3) - add 10^(K-1) sprites");
			numText = demoHelp.addText();
			add(demoHelp);
			
			add(new DemoPrompt("01"));
		}
		
		override public function update():void
		{
			var n:int = 0;
			if (FlxG.keys.justPressed("ONE")) {
				n = 1;
			} else if (FlxG.keys.justPressed("TWO")) {
				n = 10;
			} else if (FlxG.keys.justPressed("THREE")) {
				n = 100;
			}
			numText.text = "NUM: " + group.length;
			addSprites(n);
			super.update();
		}
		
		private function addSprites(n:int):void
		{
			for (var i:int = 0; i < n; ++i) {
				var s:D01_Sprite = new D01_Sprite();
				s.reset(FlxG.random() * FlxG.width, FlxG.random() * FlxG.height);
				group.add(s);
			}
		}
		
	}

}