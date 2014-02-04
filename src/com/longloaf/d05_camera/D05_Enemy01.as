package com.longloaf.d05_camera 
{
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Enemy01 extends D05_Sprite
	{
		[Embed(source = "enemy01_8x8_2.png")]
		private static const Img:Class;
		
		public function D05_Enemy01() 
		{
			//makeGraphic(4, 4, 0xFFFF0000);
			loadGraphic(Img, true, false, 8, 8);
			width = height = 4;
			offset.x = 2;
			offset.y = 4;
			
			addAnimation("1", [0, 1], 5);
			play("1");
		}
		
	}

}