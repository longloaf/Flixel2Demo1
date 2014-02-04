package com.longloaf.d05_camera 
{
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_BloodParticle extends FlxParticle
	{
		private const COLOR:uint = 0xFFFF0030;
		
		public function D05_BloodParticle() 
		{
			if (FlxG.random() > 0.7) {
				makeGraphic(2, 2, COLOR);
			} else {
				makeGraphic(1, 1, COLOR);
			}
		}
		
		override public function update():void 
		{
			super.update();
			if (isTouching(ANY)) {
				velocity.make();
				acceleration.make();
			}
		}
		
	}

}