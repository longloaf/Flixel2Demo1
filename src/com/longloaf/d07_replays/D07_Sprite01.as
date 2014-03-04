package com.longloaf.d07_replays 
{
	import com.longloaf.util.Vec2D;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D07_Sprite01 extends FlxSprite
	{
		[Embed(source = "circle.png")]
		private static const Img:Class;
		
		private var canvas:FlxSprite;
		
		private var vel:Vec2D = new Vec2D();
		private var acc:Vec2D = new Vec2D();
		private var dr:Vec2D = new Vec2D();
		
		private const A:Number = 2;
		private const AD:Number = A * Math.SQRT1_2;
		
		private const AX:Vector.<Number> =
		Vector.<Number>([0, A, -A, 0, 0, AD, -AD, 0, 0, AD, -AD, 0, 0, A, -A, 0]);
		
		private const AY:Vector.<Number> =
		Vector.<Number>([0, 0, 0, 0, A, AD, AD, A, -A, -AD, -AD, -A, 0, 0, 0, 0]);
		
		private const DRAG:Number = 1;
		
		private const MAX_VEL:Number = 10;
		
		private var leftX:Number;
		private var rightX:Number;
		private var topY:Number;
		private var bottomY:Number;
		
		public function D07_Sprite01() 
		{
			loadGraphic(Img);
			x = (FlxG.width - width) / 2;
			y = (FlxG.height - height) / 2;
			
			var k:Number = 0.8;
			var p:Number = 1 - k;
			leftX = -k * width;
			rightX = FlxG.width - p * width;
			topY = -k * height;
			bottomY = FlxG.height - p * height;
		}
		
		override public function update():void 
		{
			var dir:int = 0;
			
			if (FlxG.keys.RIGHT) dir += 1;
			if (FlxG.keys.LEFT) dir += 2;
			if (FlxG.keys.DOWN) dir += 4;
			if (FlxG.keys.UP) dir += 8;
			
			if (dir == 0) {
				var m:Number = vel.mag();
				if (m > DRAG) {
					dr.assign(vel);
					dr.setMag(DRAG);
					vel.sub(dr);
				} else {
					vel.clear();
				}
			} else {
				acc.setxy(AX[dir], AY[dir]);
				vel.add(acc);
				vel.limit(MAX_VEL);
			}
			
			x += vel.x;
			y += vel.y;
			
			if (x < leftX) {
				x = leftX;
			} else if (x > rightX) {
				x = rightX;
			}
			
			if (y < topY) {
				y = topY;
			} else if (y > bottomY) {
				y = bottomY;
			}
		}
		
	}

}