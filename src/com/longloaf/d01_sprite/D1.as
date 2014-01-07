package com.longloaf.d01_sprite 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D1 extends FlxState
	{
		
		private var group:FlxGroup;
		
		override public function create():void 
		{
			group = new FlxGroup();
			add(group);
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justPressed()) {
				var s:D1_Sprite = new D1_Sprite();
				s.reset(FlxG.mouse.x, FlxG.mouse.y);
				group.add(s);
			}
			super.update();
		}
		
	}

}