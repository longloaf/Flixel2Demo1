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
		[Embed(source = "lava_ball_4x4_3.png")]
		private static const Img:Class;
		
		private var interval:Number;
		private var delay:Number;
		private var delayFlag:Boolean;
		
		private var time:Number;
		
		public function D05_LavaBall(t:Number, d:Number) 
		{
			//makeGraphic(4, 4);
			loadGraphic(Img, true, false, 4, 4);
			width = 2;
			offset.x = 1;
			
			addAnimation("1", [0, 1, 2, 1], 10);
			play("1");
			
			interval = t;
			delay = d;
			delayFlag = true;
			time = 0;
		}
		
		override public function update():void 
		{
			super.update();
			time += FlxG.elapsed;
			if (delayFlag) {
				if (time > delay) {
					time -= delay;
					delayFlag = false;
					jump();
				}
			} else {
				if (time > interval) {
					time -= interval;
					jump();
				}
			}
		}
		
		private function jump():void
		{
			velocity.y -= 150;
		}
		
	}

}