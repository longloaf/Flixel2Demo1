package com.longloaf.d04_pathfinding 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D04_MouseSprite extends FlxSprite
	{
		[Embed(source = "mouse.png")]
		private static const Img:Class;
		
		private var tileMap:FlxTilemap;
		
		public function D04_MouseSprite(map:FlxTilemap) 
		{
			loadGraphic(Img, true, false, D04.TILE_SIZE, D04.TILE_SIZE);
			alpha = 0.5;
			tileMap = map;
		}
		
		override public function update():void 
		{
			var tx:int = int(FlxG.mouse.x / D04.TILE_SIZE);
			var ty:int = int(FlxG.mouse.y / D04.TILE_SIZE);
			frame = tileMap.getTile(tx, ty);
			x = tx * D04.TILE_SIZE;
			y = ty * D04.TILE_SIZE;
		}
		
	}

}