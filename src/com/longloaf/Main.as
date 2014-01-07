package com.longloaf
{
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass="com.longloaf.Preloader")]
	
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Main extends FlxGame 
	{
		
		public function Main():void 
		{
			super(400, 300, MenuState, 2, 60, 60, true);
			forceDebugger = true;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			FlxG.stage.scaleMode = StageScaleMode.EXACT_FIT;
		}
		
	}
	
}