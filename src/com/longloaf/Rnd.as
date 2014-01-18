package com.longloaf 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	/**
	 * Функции для работы со случайными числами.
	 * @author Maksim Soldatov
	 */
	public class Rnd 
	{
		public static function rnd(x:Number):Number
		{
			return x * FlxG.random();
		}
		
		public static function range(min:Number, max:Number):Number
		{
			return min + rnd(max - min);
		}
		
		public static function signum():Number
		{
			return FlxG.random() > 0.5 ? 1 : -1;
		}
		
		public static function angleDeg():Number
		{
			return rnd(360);
		}
		
		public static function angleRad():Number
		{
			return rnd(2 * Math.PI);
		}
		
		public static function point(x:Number, y:Number, p:FlxPoint = null):FlxPoint
		{
			if (p == null) p = new FlxPoint();
			p.make(rnd(x), rnd(y));
			return p;
		}
		
	}

}