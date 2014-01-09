package com.longloaf
{
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass="com.longloaf.Preloader")]
	
	/**
	 * Демонстрация возможностей движка Flixel.
	 * Используется модифицированная версия 2.55.
	 * 
	 * Изменения
	 * =========
	 * 
	 * 1. В методе FlxGame.create() переменной stage.scaleMode вместо
	 * значения NO_SCALE присваивается значение EXACT_FIT.
	 * Теперь появилась возможность масштабирования игры.
	 * 
	 * 2. В методе FLxGame.onEnterFrame() сторока while(_accumulator >= _step)
	 * заменена на while(_accumulator > _step). На форуме пишут, что это помогает
	 * сгладить частоту кадров.
	 * 
	 * @author Maksim Soldatov
	 */
	public class Main extends FlxGame 
	{
		
		public function Main():void 
		{
			super(400, 300, MenuState, 2, 30, 30, true);
			forceDebugger = true;
		}
		
	}
	
}