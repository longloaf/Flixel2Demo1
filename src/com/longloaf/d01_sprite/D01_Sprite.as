package com.longloaf.d01_sprite 
{
	import com.longloaf.Rnd;
	import flash.display.BlendMode;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D01_Sprite extends FlxSprite
	{
		[Embed(source = "img_20x20_5.png")]
		private static const Img:Class;
		
		private const FRAME_NUM:int = 5;
		private const VEL_MIN:Number = 100;
		private const VEL_MAX:Number = 200;
		private const SCALE_MIN:Number = 0.5;
		private const SCALE_MAX:Number = 3;
		private const ANG_VEL_MIN:Number = 30;
		private const ANG_VEL_MAX:Number = 360;
		
		private var lx:Number;
		private var rx:Number;
		private var ty:Number;
		private var by:Number;
		
		private var spriteSettings:D01_SpriteSettings;
		
		private var sprScaleX:Number;
		private var sprScaleY:Number;
		private var sprAngVel:Number;
		
		public function D01_Sprite(ss:D01_SpriteSettings) 
		{
			loadGraphic(Img, true, true, 20, 20);
			
			lx = 0;
			rx = FlxG.width - width;
			ty = 0;
			by = FlxG.height - height;
			
			spriteSettings = ss;
			
			x = Rnd.rnd(FlxG.width);
			y = Rnd.rnd(FlxG.height);
			
			var a:Number = FlxG.random() * Math.PI * 2;
			var v:Number = Rnd.range(VEL_MIN, VEL_MAX);
			velocity.x = v * Math.cos(a);
			velocity.y = v * Math.sin(a);
			
			facing = FlxG.random() > 0.5 ? FlxObject.LEFT : FlxObject.RIGHT;
			frame = int(FlxG.random() * FRAME_NUM);
			
			sprScaleX = Rnd.range(SCALE_MIN, SCALE_MAX);
			sprScaleY = Rnd.range(SCALE_MIN, SCALE_MAX);
			
			sprAngVel = Rnd.signum() * Rnd.range(ANG_VEL_MIN, ANG_VEL_MAX);
		}
		
		override public function update():void
		{
			if (spriteSettings.scale) {
				scale.x = sprScaleX;
				scale.y = sprScaleY;
			} else {
				scale.x = scale.y = 1;
			}
			if (spriteSettings.rotation) {
				angularVelocity = sprAngVel;
			} else {
				angularVelocity = 0;
				angle = 0;
			}
			antialiasing = spriteSettings.antialiasing;
			color = spriteSettings.color;
			blend = spriteSettings.blendMode;
			
			if (x < lx) {
				x = lx;
				velocity.x *= -1;
			} else if (x > rx) {
				x = rx;
				velocity.x *= -1;
			}
			if (y < ty) {
				y = ty;
				velocity.y *= -1;
			} else if (y > by) {
				y = by;
				velocity.y *= -1;
			}
		}
		
	}

}