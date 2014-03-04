package com.longloaf.d07_replays 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D07_Mouse extends FlxSprite
	{
		[Embed(source = "mouse.png")]
		private static const Img:Class;
		
		public function D07_Mouse() 
		{
			loadGraphic(Img, true);
		}
		
		override public function update():void 
		{
			x = FlxG.mouse.x - width / 2;
			y = FlxG.mouse.y - height / 2;
			
			if (FlxG.mouse.pressed()) {
				//scale.x = scale.y = 2;
				frame = 1;
			} else {
				//scale.x = scale.y = 1;
				frame = 0;
			}
		}
		
	}

}