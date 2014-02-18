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
		[Embed(source = "player_16x16_5.png")]
		private static const Img:Class;
		
		public var grav:Number = 500;
		public var acc:Number = 50;// 300;
		public var floorDrag:Number = 10;// 300;
		public var jumpVel:Number = -250;// -300;
		
		private const STOP_ANIM:String = "stop";
		private const RUN_ANIM:String = "run";
		private const JUMP_ANIM:String = "jump";
		
		public function D08_Player() 
		{	
			loadGraphic(Img, true, true, 16, 16);
			addAnimation(STOP_ANIM, [0, 0, 1], 5);
			addAnimation(RUN_ANIM, [2, 3], 5);
			addAnimation(JUMP_ANIM, [4]);
			width = 8;
			offset.x = 4;
			height = 15;
			
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
				if (acceleration.x != 0) {
					play(RUN_ANIM);
				} else {
					play(STOP_ANIM);
				}
			} else {
				drag.x = 0;
				play(JUMP_ANIM);
			}
		}
		
	}

}