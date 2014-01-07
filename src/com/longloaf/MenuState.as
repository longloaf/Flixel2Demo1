package com.longloaf 
{
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
			var pButton:DemoButton = new DemoButton(100, 100, "PlayState", PlayState);
			add(pButton);
		}
		
	}

}