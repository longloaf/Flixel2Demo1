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
		private const PATH_SPEED:Number = 50;
		private const MOUSE_PATH_SPEED:Number = 200;
		
		private var tileMap:FlxTilemap;
		private var mouseSprite:FlxSprite;
		
		public function D04_Sprite(map:FlxTilemap, mSpr:FlxSprite) 
		{
			var h:Number = 100 + Rnd.range( -70, 70);
			makeGraphic(4, 4, FlxU.makeColorFromHSB(h, 0.5, 0.5));
			
			tileMap = map;
			mouseSprite = mSpr;
		}
		
		override public function update():void 
		{
			var point:FlxPoint;
			var newPath:FlxPath;
			if (FlxG.mouse.justPressed()) {
				point = mouseSprite.getMidpoint();
				newPath = tileMap.findPath(getMidpoint(), point);
				if (newPath != null) {
					stopFollowingPath(true);
					followPath(newPath, MOUSE_PATH_SPEED);
				}
			} else {
				if (path == null) {
					point = new FlxPoint();
					point.x = (int(Rnd.rnd(tileMap.widthInTiles)) + 0.5) * D04.TILE_SIZE;
					point.y = (int(Rnd.rnd(tileMap.heightInTiles)) + 0.5) * D04.TILE_SIZE;
					newPath = tileMap.findPath(getMidpoint(), point);
					if (newPath != null) followPath(newPath, PATH_SPEED);
				} else {
					if (pathSpeed == 0) {
						velocity.x = velocity.y = 0;
						stopFollowingPath(true);
					}
				}
			}
		}
		
	}

}