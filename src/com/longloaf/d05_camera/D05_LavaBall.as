package com.longloaf.d05_camera 
{
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_LavaBall extends D05_Lava
	{
		private var interval:Number;
		
		public function D05_LavaBall(t:Number, d:Number) 
		{
			makeGraphic(4, 4, 0xff000000);
			interval = t;
			var timer:FlxTimer = new FlxTimer();
			timer.start(d, 1, startJump);
		}
		
		private function startJump(timer:FlxTimer):void
		{
			timer.start(interval, 0, jump);
		}
		
		private function jump(timer:FlxTimer):void
		{
			velocity.y -= 150;
		}
		
	}

}