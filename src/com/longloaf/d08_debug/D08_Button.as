package com.longloaf.d08_debug 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Button extends FlxSprite
	{
		[Embed(source = "button_16x16_3.png")]
		private static const Img:Class;
		
		public var onButtonDown:Function = null;
		public var onButtonUp:Function = null;
		
		public var time:Number = 1;
		
		private var isPressed:Boolean;
		
		private const UP_ANIM:String = "up";
		private const DOWN_ANIM:String = "down";
		
		public function D08_Button() 
		{
			loadGraphic(Img, true, false, 16, 16);
			width = 12;
			offset.x = 2;
			height = 7;
			offset.y = 9;
			
			addAnimation(UP_ANIM, [0]);
			addAnimation(DOWN_ANIM, [1, 2], 3);
			
			play(UP_ANIM);
			
			isPressed = false;
		}
		
		public function press():void
		{
			if (isPressed) return;
			isPressed = true;
			play(DOWN_ANIM);
			if (onButtonDown != null) onButtonDown();
			var timer:FlxTimer = new FlxTimer();
			timer.start(time, 1, timerCallback);
		}
		
		private function timerCallback(t:FlxTimer):void
		{
			isPressed = false;
			play(UP_ANIM);
			if (onButtonUp != null) onButtonUp();
		}
		
	}

}