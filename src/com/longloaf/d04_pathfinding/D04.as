package com.longloaf.d04_pathfinding 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
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
		
		public static const TILE_SIZE:int = 10;
		private var tileMap:FlxTilemap;
		
		private var group:FlxGroup;
		
		private var sprite:D04_Sprite;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.imageToCSV(Map), Tiles, TILE_SIZE, TILE_SIZE, FlxTilemap.OFF, 0, 0);
			
			group = new FlxGroup();
			
			add(tileMap);
			add(group);
			add(sprite);
			add(help);
			add(new DemoPrompt("Pathfinding"));
			
			addSprites(100);
			
			FlxG.visualDebug = true;
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
				var s:D04_Sprite = new D04_Sprite(tileMap);
				s.x = x * TILE_SIZE;
				s.y = y * TILE_SIZE;
				group.add(s);
			}
		}
		
	}

}