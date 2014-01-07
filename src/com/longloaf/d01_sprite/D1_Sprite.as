package com.longloaf.d01_sprite 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D1_Sprite extends FlxSprite
	{
		[Embed(source = "img_20x20_5.png")]
		private static const Img:Class;
		
		private const V:Number = 200;
		
		private var lx:Number;
		private var rx:Number;
		private var ty:Number;
		private var by:Number;
		
		public function D1_Sprite() 
		{
			loadGraphic(Img, true, true, 20, 20);
			
			lx = 0;
			rx = FlxG.width - width;
			ty = 0;
			by = FlxG.height - height;
		}
		
		override public function reset(X:Number, Y:Number):void
		{
			super.reset(X, Y);
			var a:Number = FlxG.random() * Math.PI * 2;
			velocity.x = V * Math.cos(a);
			velocity.y = V * Math.sin(a);
			scale.x = 1 + 2 * FlxG.random();
			scale.y = 1 + 2 * FlxG.random();
			facing = FlxG.random() > 0.5 ? FlxObject.LEFT : FlxObject.RIGHT;
			frame = int(FlxG.random() * frames);
		}
		
		override public function update():void
		{
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