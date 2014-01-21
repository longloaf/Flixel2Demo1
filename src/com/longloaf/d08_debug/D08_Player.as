package com.longloaf.d08_debug 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Player extends FlxSprite
	{
		public var grav:Number = 500;
		public var acc:Number = 400;
		public var floorDrag:Number = 200;
		public var jumpVel:Number = -220;
		public var wallJumpVelX:Number = 100;
		public var wallJumpVelY:Number = -150;
		public var wallVel:Number = 50;
		
		public function D08_Player() 
		{
			makeGraphic(8, 10, 0xFF000000);
			
			maxVelocity.x = 100;
			maxVelocity.y = 300;
		}
		
		override public function update():void 
		{
			acceleration.x = 0;
			if (FlxG.keys.LEFT) acceleration.x -= acc;
			if (FlxG.keys.RIGHT) acceleration.x += acc;
			
			acceleration.y = grav;
			
			if (isTouching(FLOOR)) {
				drag.x = floorDrag;
				if (FlxG.keys.justPressed("Z")) {
					velocity.y += jumpVel;
				}
			} else {
				drag.x = 0;
				if (isTouching(WALL)) {
					if (velocity.y >= 0) {
						acceleration.y = 0;
						velocity.y = wallVel;
					}
					if (FlxG.keys.justPressed("Z")) {
						velocity.y += wallJumpVelY;
						var k:int = isTouching(LEFT) ? 1 : -1;
						velocity.x += k * wallJumpVelX;
					}
				}
			}
		}
		
	}

}