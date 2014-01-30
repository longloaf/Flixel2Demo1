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
		private const ACCX:Number = 100;
		private const DRAGX:Number = 100;
		private const JMPV:Number = -100;
		
		public function D05_Player() 
		{
			makeGraphic(6, 8, 0xFF009000);
			acceleration.y = 100;
			maxVelocity.x = maxVelocity.y = 100;
		}
		
		override public function update():void 
		{
			acceleration.x = 0;
			if (FlxG.keys.LEFT) acceleration.x -= ACCX;
			if (FlxG.keys.RIGHT) acceleration.x += ACCX;
			
			if (isTouching(FLOOR)) {
				drag.x = DRAGX;
				if (FlxG.keys.justPressed("UP")) {
					velocity.y += JMPV;
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