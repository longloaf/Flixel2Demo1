package com.longloaf.d08_debug 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Spike extends FlxSprite
	{
		[Embed(source = "spike.png")]
		private static const Img:Class;
		
		public function D08_Spike() 
		{
			loadGraphic(Img);
			width = 10;
			offset.x = 3;
			height = 10;
		}
		
	}

}