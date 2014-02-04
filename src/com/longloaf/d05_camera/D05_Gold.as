package com.longloaf.d05_camera 
{
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Gold extends D05_Sprite
	{
		[Embed(source = "gold_8x8.png")]
		private static const Img:Class;
		
		public function D05_Gold() 
		{
			loadGraphic(Img);
		}
		
	}

}