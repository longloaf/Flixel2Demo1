package com.longloaf.d05_camera 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Player extends FlxSprite
	{
		[Embed(source = "player_8x8_4.png")]
		private static const Img:Class;
		
		public var accx:Number = 200;
		public var dragx:Number = 200;
		public var jmpv:Number = -80;
		
		private const STOP_ANIM:String = "stop";
		private const RUN_ANIM:String = "run";
		private const JUMP_ANIM:String = "jump";
		
		public function D05_Player() 
		{
			loadGraphic(Img, true, false, 8, 8);
			
			width = 4;
			offset.x = 2;
			height = 6;
			offset.y = 2;
			
			addAnimation(STOP_ANIM, [0]);
			addAnimation(RUN_ANIM, [0, 1, 0, 2], 10);
			addAnimation(JUMP_ANIM, [0, 3], 10);
			play(STOP_ANIM);
			
			acceleration.y = 300;
			maxVelocity.x = 40;
			maxVelocity.y = 100;
			
			/*
			FlxG.watch(acceleration, "y", "grav");
			FlxG.watch(this, "jmpv", "jmpv");
			FlxG.watch(this, "accx", "accx");
			FlxG.watch(this, "dragx", "dragx");
			FlxG.watch(maxVelocity, "x", "maxVelX");
			FlxG.watch(maxVelocity, "y", "maxVelY");
			*/
		}
		
		override public function update():void 
		{
			acceleration.x = 0;
			if (FlxG.keys.LEFT) acceleration.x -= accx;
			if (FlxG.keys.RIGHT) acceleration.x += accx;
			
			if (isTouching(FLOOR)) {
				drag.x = dragx;
				if (FlxG.keys.justPressed("UP")) {
					velocity.y += jmpv;
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