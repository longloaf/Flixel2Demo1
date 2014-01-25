package com.longloaf.d09_sort 
{
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D09_Sprite extends FlxSprite
	{
		private const VEL_MIN:Number = 1;
		private const VEL_MAX:Number = 20;
		
		public var posX:Number;
		public var posY:Number;
		public var velX:Number;
		public var velY:Number;
		
		private var borderLeftX:Number;
		private var borderRightX:Number;
		private var borderTopY:Number;
		private var borderBottomY:Number;
		
		public function D09_Sprite() 
		{
			makeGraphic(Rnd.range(10, 20), Rnd.range(10, 100), FlxU.makeColorFromHSB(Rnd.rnd(100), 0.5, 0.5));
			
			borderLeftX = 0;
			borderRightX = FlxG.width - width;
			borderTopY = height;
			borderBottomY = FlxG.height;
			
			posX = Rnd.range(borderLeftX, borderRightX);
			posY = Rnd.range(borderTopY, borderBottomY);
			
			var ang:Number = Rnd.angleRad();
			var velMag:Number = Rnd.range(VEL_MIN, VEL_MAX);
			velX = velMag * Math.cos(ang);
			velY = velMag * Math.sin(ang);
		}
		
		override public function update():void 
		{
			posX += velX * FlxG.elapsed;
			posY += velY * FlxG.elapsed;
			
			if (posX < borderLeftX) {
				posX = borderLeftX;
				velX *= -1;
			} else if (posX > borderRightX) {
				posX = borderRightX;
				velX *= -1;
			}
			
			if (posY < borderTopY) {
				posY = borderTopY;
				velY *= -1;
			} else if (posY > borderBottomY) {
				posY = borderBottomY;
				velY *= -1;
			}
			
			x = posX;
			y = posY - height;
		}
		
	}

}