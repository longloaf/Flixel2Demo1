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
		
		public function D02_Sprite() 
		{
			makeGraphic(10, 10, 0xFFFFFFFF);
			var c:int = Rnd.range( -100, 100);
			if (c < 0) c += 360;
			color = FlxU.makeColorFromHSB(uint(c), 0.8, 0.8);
			
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