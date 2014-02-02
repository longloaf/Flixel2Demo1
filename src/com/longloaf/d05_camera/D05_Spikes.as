package com.longloaf.d05_camera 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Spikes extends FlxSprite
	{
		//[Embed(source = "spikes_8x8_6.png")] private static const Img:Class;
		
		[Embed(source = "spikes_8x8.png")] private static const Img:Class;
		
		public function D05_Spikes() 
		{
			//loadGraphic(Img, true, false, 8, 8);
			loadGraphic(Img);
			height = 2;
			offset.y = 6;
			
			//addAnimation("1", [0, 1, 2, 3, 4, 5, 4, 3, 2, 1], 10);
			//play("1");
		}
		
	}

}