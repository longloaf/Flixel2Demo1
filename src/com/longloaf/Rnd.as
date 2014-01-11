package com.longloaf 
{
	import org.flixel.FlxG;
	/**
	 * Функции для работы со случайными числами.
	 * @author Maksim Soldatov
	 */
	public class Rnd 
	{
		
		public static function range(min:Number, max:Number):Number
		{
			return min + (max - min) * FlxG.random();
		}
		
		public static function signum():Number
		{
			return FlxG.random() > 0.5 ? 1 : -1;
		}
		
	}

}