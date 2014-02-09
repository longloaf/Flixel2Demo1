package com.longloaf.d03_path 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03_Sprite extends FlxSprite
	{
		//[Embed(source = "imgs_20x20_5.png")] private static const Img:Class;
		
		[Embed(source = "imgs_5x4_5.png")] private static const Img:Class;
		
		
		
		public static const FRAME_NUM:int = 5;
		
		public function D03_Sprite() 
		{
			//loadGraphic(Img, true, false, 20, 20);
			loadGraphic(Img, true, false, 5, 4);
			scale.x = 3;
			scale.y = 6;
		}
		
		public function setFrame(f:int):void
		{
			if (f < 0 || f >= FRAME_NUM) throw new Error();
			frame = f;
		}
		
	}

}