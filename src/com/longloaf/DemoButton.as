package com.longloaf 
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	/**
	 * Кнопка показа демонстрации. Используется в главном меню.
	 * @author Maksim Soldatov
	 */
	public class DemoButton extends FlxButton
	{
		
		private var stateClass:Class;
		
		public function DemoButton(X:Number = 0, Y:Number = 0, Label:String = null, sc:Class = null) 
		{
			stateClass = sc;
			super(X, Y, Label, onClick);
		}
		
		private function onClick():void
		{
			if (stateClass != null) FlxG.switchState(new stateClass);
		}
		
	}

}