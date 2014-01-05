package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class PlayState extends FlxState
	{
		
		override public function create():void 
		{
			var t:FlxText = new FlxText(0, 0, FlxG.width, "FLIXEL DEMO");
			t.size = 32;
			t.color = FlxG.WHITE;
			t.shadow = FlxG.BLUE;
			t.alignment = "center";
			t.y = (FlxG.height - t.height) / 2;
			add(t);
		}
		
	}

}