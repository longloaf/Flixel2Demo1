package com.longloaf.d09_sort 
{
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D09_Sprite extends FlxSprite
	{
		[Embed(source = "img01.png")]
		private static const Img01:Class;
		
		[Embed(source = "img02.png")]
		private static const Img02:Class;
		
		[Embed(source = "img03.png")]
		private static const Img03:Class;
		
		[Embed(source = "img04.png")]
		private static const Img04:Class;
		
		[Embed(source = "img05.png")]
		private static const Img05:Class;
		
		[Embed(source = "img06.png")]
		private static const Img06:Class;
		
		private const IMGS:Vector.<Class> = Vector.<Class>([Img01, Img02, Img03, Img04, Img05, Img06]);
		
		private const VEL_MIN:Number = 10;
		private const VEL_MAX:Number = 50;
		
		public var posX:Number;
		public var posY:Number;
		public var velX:Number;
		public var velY:Number;
		
		private var borderLeftX:Number;
		private var borderRightX:Number;
		private var borderTopY:Number;
		private var borderBottomY:Number;
		
		public function D09_Sprite()
		{
			loadGraphic(IMGS[int(Rnd.rnd(IMGS.length))]);
			
			borderLeftX = 0;
			borderRightX = FlxG.width - width;
			borderTopY = height;
			borderBottomY = FlxG.height;
			
			posX = Rnd.range(borderLeftX, borderRightX);
			posY = Rnd.range(borderTopY, borderBottomY);
			
			var ang:Number = Rnd.angleRad();
			var velMag:Number = Rnd.range(VEL_MIN, VEL_MAX);
			velX = velMag * Math.cos(ang);
			velY = velMag * Math.sin(ang);
		}
		
		override public function update():void 
		{
			posX += velX * FlxG.elapsed;
			posY += velY * FlxG.elapsed;
			
			if (posX < borderLeftX) {
				posX = borderLeftX;
				velX *= -1;
			} else if (posX > borderRightX) {
				posX = borderRightX;
				velX *= -1;
			}
			
			if (posY < borderTopY) {
				posY = borderTopY;
				velY *= -1;
			} else if (posY > borderBottomY) {
				posY = borderBottomY;
				velY *= -1;
			}
			
			x = posX;
			y = posY - height;
		}
		
	}

}