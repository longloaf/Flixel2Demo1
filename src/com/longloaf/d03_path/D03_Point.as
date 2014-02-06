package com.longloaf.d03_path 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03_Point extends FlxSprite
	{
		[Embed(source = "point_10x10_2.png")]
		private static const Img:Class;
		
		public static const UNSELECTED:int = 0;
		public static const SELECTED:int = 1;
		
		public var point:FlxPoint;
		
		public var prev:D03_Point = null;
		public var next:D03_Point = null;
		
		public function D03_Point() 
		{
			loadGraphic(Img, true, false, 10, 10);
			
			frame = SELECTED;
			
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