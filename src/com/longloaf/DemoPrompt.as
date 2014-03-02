package com.longloaf 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * Текстовое поле, которое должно быть добавлено в каждую демонстрацию.
	 * Содержит название демонстрации и напоминание о клавишах перезагрузки
	 * и выхода в меню. В методе update() проверяется нажатие этих клавиш.
	 * @author Maksim Soldatov
	 */
	public class DemoPrompt extends FlxGroup
	{
		private const TEXT_COLOR:uint = 0xFFFFFF90;
		
		private var bg:FlxSprite;
		private var text:DemoText;
		
		public function DemoPrompt(name:String) 
		{
			text = new DemoText(0, 0, FlxG.width, "\"" + name + "\" [Enter] - reset, [Esc] - menu");
			text.color = TEXT_COLOR;
			text.y = FlxG.height - text.height;
			
			bg = new FlxSprite();
			bg.makeGraphic(FlxG.width, text.height, 0xE0904000);
			bg.y = FlxG.height - bg.height;
			
			add(bg);
			add(text);
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.keys.justPressed("ENTER")) {
				FlxG.resetState();
			} else if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new MenuState());
			}
		}
		
	}

}