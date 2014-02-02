package com.longloaf.d05_camera 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Lava extends D05_Sprite
	{
		private var t:Number = 0;
		private const DT:Number = 0.1;
		private const TWO_PI:Number = 2 * Math.PI;
		
		override public function update():void 
		{
			t += DT;
			if (t > TWO_PI) t -= TWO_PI;
			var h:Number = (Math.cos(t) + 1) * 0.5 * 20 + 5;
			color = FlxU.makeColorFromHSB(h, 0.9, 1);
		}
	}

}