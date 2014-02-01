package com.longloaf.d05_camera 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Player extends FlxSprite
	{
		public var accx:Number = 200;
		public var dragx:Number = 200;
		public var jmpv:Number = -80;
		
		public function D05_Player() 
		{
			makeGraphic(6, 7, 0xFF009000);
			height = 6;
			offset.y = 1;
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
			} else {
				drag.x = 0;
			}
			
			// Не работает. Неверно потому, что скорость после столкновения обнуляется.
			/*
			if (justTouched(CEILING)) {
				velocity.y *= -1;
			}
			*/
		}
		
	}

}