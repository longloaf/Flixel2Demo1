package 
{
	import flash.display.StageScaleMode;
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Main extends FlxGame 
	{
		
		public function Main():void 
		{
			super(400, 300, PlayState, 2, 60, 60, true);
			forceDebugger = true;
		}
		
	}
	
}