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
		private const PATH_VEL_MIN:Number = 20;
		private const PATH_VEL_MAX:Number = 50;
		
		private const MOUSE_PATH_VEL_MIN:Number = 100;
		private const MOUSE_PATH_VEL_MAX:Number = 150;
		
		private var pathVel:Number;
		private var mousePathVel:Number;
		
		private var tileMap:FlxTilemap;
		private var mouseSprite:FlxSprite;
		
		public function D04_Sprite(map:FlxTilemap, mSpr:FlxSprite) 
		{
			var h:Number = 100 + Rnd.range( -70, 70);
			makeGraphic(6, 6, FlxU.makeColorFromHSB(h, 0.5, 0.6));
			
			tileMap = map;
			mouseSprite = mSpr;
			
			pathVel = Rnd.range(PATH_VEL_MIN, PATH_VEL_MAX);
			mousePathVel = Rnd.range(MOUSE_PATH_VEL_MIN, MOUSE_PATH_VEL_MAX);
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
					followPath(newPath, mousePathVel);
				}
			} else {
				if (path == null) {
					point = new FlxPoint();
					point.x = (int(Rnd.rnd(tileMap.widthInTiles)) + 0.5) * D04.TILE_SIZE;
					point.y = (int(Rnd.rnd(tileMap.heightInTiles)) + 0.5) * D04.TILE_SIZE;
					newPath = tileMap.findPath(getMidpoint(), point);
					if (newPath != null) followPath(newPath, pathVel);
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