package com.longloaf.d02_mouse 
{
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D02 extends FlxState
	{
		
		private var mouseXText:DemoText;
		private var mouseYText:DemoText;
		
		override public function create():void 
		{
			mouseXText = new DemoText(0, 0, FlxG.width, "?");
			mouseYText = new DemoText(0, 0, FlxG.width, "?");
			
			mouseXText.reset(0, 0);
			mouseYText.reset(0, mouseYText.y + mouseYText.height);
			add(mouseXText);
			add(mouseYText);
			
			add(new DemoPrompt("02"));
		}
		
		override public function update():void 
		{
			mouseXText.text = "X: " + FlxG.mouse.x;
			mouseYText.text = "Y: " + FlxG.mouse.y;
			super.update();
		}
		
	}

}