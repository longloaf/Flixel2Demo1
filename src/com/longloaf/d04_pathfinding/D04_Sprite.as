package com.longloaf.d04_pathfinding 
{
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D04_Sprite extends FlxSprite
	{
		private var tileMap:FlxTilemap;
		
		public function D04_Sprite(map:FlxTilemap) 
		{
			makeGraphic(D04.TILE_SIZE, D04.TILE_SIZE, FlxU.makeColorFromHSB(100, 0.5, 0.5));
			
			tileMap = map;
		}
		
		override public function update():void 
		{
			if (path == null) {
				var point:FlxPoint = Rnd.point(FlxG.width, FlxG.height);
				var newPath:FlxPath = tileMap.findPath(getMidpoint(), point);
				if (newPath != null) followPath(newPath);
			} else {
				if (pathSpeed == 0) {
					velocity.x = velocity.y = 0;
					stopFollowingPath(true);
				}
			}
			/*
			if (pathSpeed == 0) {
				velocity.x = velocity.y = 0;
				stopFollowingPath(true);
			}
			if (FlxG.mouse.justPressed()) {
				if (path != null) stopFollowingPath(true);
				var mousePoint:FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
				var p:FlxPath = tileMap.findPath(getMidpoint(), mousePoint);
				if (p != null) {
					followPath(p);
				}
			}
			*/
		}
		
	}

}