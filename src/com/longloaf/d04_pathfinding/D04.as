package com.longloaf.d04_pathfinding 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D04 extends FlxState
	{
		[Embed(source = "tiles.png")]
		private static const Tiles:Class;
		
		[Embed(source = "map.png")]
		private static const Map:Class;
		
		private var help:DemoHelp;
		private var numText:DemoText;
		
		public static const TILE_SIZE:int = 10;
		private var tileMap:FlxTilemap;
		
		private var group:FlxGroup;
		
		private var mouseSprite:D04_MouseSprite;
		
		override public function create():void 
		{
			help = new DemoHelp();
			help.addText("Click to find path");
			help.addVSpace();
			help.addText("[1] - add 10 sprites");
			help.addText("[2] - add 100 sprites");
			numText = help.addText();
			help.addVSpace();
			help.addText("[X] - clear");
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.imageToCSV(Map), Tiles, TILE_SIZE, TILE_SIZE, FlxTilemap.OFF, 0, 0);
			
			group = new FlxGroup();
			
			mouseSprite = new D04_MouseSprite(tileMap);
			
			add(tileMap);
			add(group);
			add(mouseSprite);
			add(help);
			add(new DemoPrompt("Pathfinding"));
			
			addSprites(100);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				addSprites(10);
			} else if (FlxG.keys.justPressed("TWO")) {
				addSprites(100);
			} else if (FlxG.keys.justPressed("X")) {
				group.callAll("destroy");
				group.clear();
				updateNumText();
			}
			super.update();
		}
		
		private function addSprites(n:int):void
		{
			for (var i:int = 0; i < n; ++i) {
				var x:int;
				var y:int;
				while (true) {
					x = int(Rnd.rnd(tileMap.widthInTiles));
					y = int(Rnd.rnd(tileMap.heightInTiles));
					if (tileMap.getTile(x, y) == 0) break;
				}
				var s:D04_Sprite = new D04_Sprite(tileMap, mouseSprite);
				s.x = x * TILE_SIZE;
				s.y = y * TILE_SIZE;
				group.add(s);
			}
			updateNumText();
		}
		
		private function updateNumText():void
		{
			numText.text = "Num: " + group.length;
		}
		
	}

}