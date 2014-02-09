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
		[Embed(source = "player_10x10_3.png")]
		private static const Img:Class;
		
		public var grav:Number = 500;
		public var acc:Number = 400;
		public var floorDrag:Number = 200;
		public var jumpVel:Number = -220;
		
		private const STOP_ANIM:String = "stop";
		private const RUN_ANIM:String = "run";
		private const JUMP_ANIM:String = "jump";
		
		public function D08_Player() 
		{
			//makeGraphic(8, 10, 0xFF000000);
			
			loadGraphic(Img, true, true, 10, 10);
			width = 8;
			offset.x = 1;
			
			addAnimation(STOP_ANIM, [0]);
			addAnimation(RUN_ANIM, [0, 1, 2, 1], 10);
			addAnimation(JUMP_ANIM, [2]);
			
			play(STOP_ANIM);
			
			maxVelocity.x = 100;
			maxVelocity.y = 300;
		}
		
		override public function update():void 
		{
			acceleration.x = 0;
			if (FlxG.keys.LEFT) {
				acceleration.x -= acc;
				facing = LEFT;
			}
			if (FlxG.keys.RIGHT) {
				acceleration.x += acc;
				facing = RIGHT;
			}
			
			acceleration.y = grav;
			
			if (isTouching(FLOOR)) {
				drag.x = floorDrag;
				if (FlxG.keys.justPressed("UP")) {
					velocity.y += jumpVel;
				}
				if (acceleration.x == 0) {
					play(STOP_ANIM);
				} else {
					play(RUN_ANIM);
				}
			} else {
				drag.x = 0;
				play(JUMP_ANIM);
			}
		}
		
	}

}