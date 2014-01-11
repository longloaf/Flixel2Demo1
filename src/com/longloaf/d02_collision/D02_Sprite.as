package com.longloaf.d02_collision 
{
	import com.longloaf.Rnd;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D02_Sprite extends FlxSprite
	{
		
		public function D02_Sprite() 
		{
			makeGraphic(20, 40, 0xFF808080);
			color = FlxU.makeColorFromHSB(Rnd.range(0, 360), 0.8, 0.8);
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			var v:Number = 20;
			var a:Number = Rnd.angle();
			velocity.x = v * Math.cos(a);
			velocity.y = v * Math.sin(a);
		}
		
	}

}