package com.longloaf.d08_debug 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Door01 extends FlxSprite
	{
		
		public function D08_Door01() 
		{
			makeGraphic(32, 16, FlxG.BLUE);
			immovable = true;
		}
		
	}

}