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
		
		//[Embed(source = "spikes_8x8.png")] private static const Img:Class;
		
		//[Embed(source = "acid2_8x8_8.png")]
		//private static const Img:Class;
		
		public function D05_Spikes() 
		{
			//loadGraphic(Img, true, false, 8, 8);
			makeGraphic(8, 8, 0xFFFF0000);
			//loadGraphic(Img);
			height = 2;
			offset.y = 6;
			
			//addAnimation("1", [0, 1, 2, 3, 4, 5, 6, 7], 20);
			//play("1");
		}
		
	}

}