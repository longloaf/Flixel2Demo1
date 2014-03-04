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
		
		public function D07_Sprite01() 
		{
			makeGraphic(20, 20, FlxU.makeColorFromHSB(200, 0.9, 0.9))
			x = (FlxG.width - width) / 2;
			y = (FlxG.height - height) / 2;
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
			
		}
		
	}

}