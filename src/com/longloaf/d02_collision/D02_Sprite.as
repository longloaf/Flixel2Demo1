package com.longloaf.d02_collision 
{
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D02_Sprite extends FlxSprite
	{
		private const MAX_VEL:Number = 500;
		
		private const MIN_SIZE:int = 4;
		private const MAX_SIZE:int = 20;
		
		public function D02_Sprite() 
		{
			var w:int = int(Rnd.range(MIN_SIZE, MAX_SIZE)) + 1;
			var h:int = int(Rnd.range(MIN_SIZE, MAX_SIZE)) + 1;
			makeGraphic(w, h, 0xFFFFFFFF);
			var hue:int = Rnd.range( -100, 100);
			if (hue < 0) hue += 360;
			color = FlxU.makeColorFromHSB(uint(hue), 0.8, 0.8);
			
			var v:Number = Rnd.rnd(MAX_VEL);
			var a:Number = Rnd.angleRad();
			velocity.x = v * Math.cos(a);
			velocity.y = v * Math.sin(a);
			
			acceleration.y = 500;
			
			maxVelocity.make(MAX_VEL, MAX_VEL);
			
			elasticity = 0.5;
		}
		
		override public function update():void 
		{
			var nx:Number = x;
			var ny:Number = y;
			if ((x + width) < 0) {
				nx = FlxG.width;
			} else if (x > FlxG.width) {
				nx = 0;
			}
			if ((y + height) < 0) {
				ny = FlxG.height;
			} else if (y > FlxG.height) {
				ny = 0;
			}
			if ((nx != x) || (ny != y)) {
				move(nx, ny);
			}
		}
		
		public function move(xv:Number, yv:Number):void
		{
			last.x = x = xv;
			last.y = y = yv;
		}
		
	}

}