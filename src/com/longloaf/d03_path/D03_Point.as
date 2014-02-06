package com.longloaf.d03_path 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03_Point extends FlxSprite
	{
		[Embed(source = "point_10x10_4.png")]
		private static const Img:Class;
		
		public static const UNSELECTED:int = 0;
		public static const PREV:int = 1;
		public static const SELECTED:int = 2;
		public static const NEXT:int = 3;
		
		public var point:FlxPoint;
		
		public var prev:D03_Point = null;
		public var next:D03_Point = null;
		
		public function D03_Point() 
		{
			loadGraphic(Img, true, false, 10, 10);
			
			frame = UNSELECTED;
			
			point = new FlxPoint();
			
			move(0, 0);
		}
		
		public function move(px:Number, py:Number):void
		{
			point.make(px, py);
			x = px - width / 2;
			y = py - height / 2;
		}
		
	}

}