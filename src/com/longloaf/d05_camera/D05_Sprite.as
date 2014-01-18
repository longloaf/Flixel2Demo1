package com.longloaf.d05_camera 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_Sprite extends FlxSprite
	{
		
		public function D05_Sprite() 
		{
			makeGraphic(4, 4, FlxU.makeColorFromHSB(120, 0.5, 0.5));
		}
		
		override public function update():void 
		{
			var vel:Number = 50;
			velocity.x = velocity.y = 0;
			if (FlxG.keys.LEFT) velocity.x -= vel;
			if (FlxG.keys.RIGHT) velocity.x += vel;
			if (FlxG.keys.UP) velocity.y -= vel;
			if (FlxG.keys.DOWN) velocity.y += vel;
		}
		
	}

}