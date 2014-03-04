package com.longloaf.util 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class SprTraceData 
	{
		public var spr:FlxSprite = null;
		
		public var p1:FlxPoint = new FlxPoint();
		public var p2:FlxPoint = null;
		
		public var h:Number = 0;
		
		public var lineCol:uint = 0;
		
		public function SprTraceData(s:FlxSprite, lCol:uint = 0)
		{
			spr = s;
			lineCol = lCol;
		}
	}

}