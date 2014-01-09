package com.longloaf 
{
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * Текст, используемый в демонстрациях. Расширяет класс FlxText.
	 * Добавлен цвет тени - черный.
	 * Класс создан для того, чтобы текст во всех демонстрациях был в одном стиле.
	 * @author Maksim Soldatov
	 */
	public class DemoText extends FlxText
	{
		
		public function DemoText(X:Number, Y:Number, Width:uint, Text:String = null) 
		{
			super(X, Y, Width, Text);
			shadow = FlxG.BLACK;
		}
		
	}

}