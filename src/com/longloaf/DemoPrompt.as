package com.longloaf 
{
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * Текстовое поле, которое должно быть добавлено в каждую демонстрацию.
	 * Содержит название демонстрации и напоминание о клавишах перезагрузки
	 * и выхода в меню. В методе update() проверяется нажатие этих клавиш.
	 * @author Maksim Soldatov
	 */
	public class DemoPrompt extends DemoText
	{
		
		public function DemoPrompt(name:String) 
		{
			super(0, 0, FlxG.width, "[" + name + "] ENTER - RESET, ESC - MENU");
			color = 0xFFFFFF90;
			y = FlxG.height - height;
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ENTER")) {
				FlxG.resetState();
			} else if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new MenuState());
			}
		}
		
	}

}