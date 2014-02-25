package com.longloaf.d08_debug 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Item extends FlxSprite
	{
		[Embed(source = "bottle.png")]
		private static const Img:Class;
		
		[Embed(source = "pickup.mp3")]
		private static const PickUpSound:Class;
		
		public function D08_Item() 
		{
			loadGraphic(Img);
			width = 8;
			height = 10;
			offset.x = 4;
			offset.y = 6;
		}
		
		public function pickUp():void
		{
			FlxG.play(PickUpSound);
			kill();
		}
		
	}

}