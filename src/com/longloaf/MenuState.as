package com.longloaf 
{
	import com.longloaf.d01_sprite.D1;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class MenuState extends FlxState
	{
		
		override public function create():void 
		{
			var pButton:DemoButton = new DemoButton(10, 10, "SPRITE", D1);
			add(pButton);
		}
		
	}

}