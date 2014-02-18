package com.longloaf.d08_debug 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Door02 extends FlxSprite
	{
		
		public function D08_Door02() 
		{
			makeGraphic(48, 16, FlxG.BLUE);
			immovable = true;
		}
		
	}

}