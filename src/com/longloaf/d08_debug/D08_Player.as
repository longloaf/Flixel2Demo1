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
		[Embed(source="player_16x16_8.png")]
		private static const Img:Class;
		
		public var grav:Number = 500;
		public var acc:Number = 400;
		public var floorDrag:Number = 200;
		public var jumpVel:Number = -220;
		
		private const MOVE_ANIM:String = "move";
		private const JUMP_ANIM:String = "jump";
		
		public function D08_Player() 
		{	
			loadGraphic(Img, true, true, 16, 16);
			//addAnimation(MOVE_ANIM, [0, 1, 2, 3, 2, 1], 10);
			addAnimation(MOVE_ANIM, [0, 1, 2, 3, 4, 5, 6, 7], 10);
			addAnimation(JUMP_ANIM, [4, 5, 6, 7, 6, 5, 4], 20);
			width = 8;
			offset.x = 4;
			
			play(MOVE_ANIM);
			
			maxVelocity.x = 100;
			maxVelocity.y = 300;
		}
		
		override public function update():void 
		{
			acceleration.x = 0;
			if (FlxG.keys.LEFT) {
				acceleration.x -= acc;
				facing = RIGHT;
			}
			if (FlxG.keys.RIGHT) {
				acceleration.x += acc;
				facing = LEFT;
			}
			
			acceleration.y = grav;
			
			if (isTouching(FLOOR)) {
				drag.x = floorDrag;
				if (FlxG.keys.justPressed("UP")) {
					velocity.y += jumpVel;
				}
				//play(MOVE_ANIM);
			} else {
				drag.x = 0;
				//play(JUMP_ANIM);
			}
		}
		
	}

}