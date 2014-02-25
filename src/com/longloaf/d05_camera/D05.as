package com.longloaf.d05_camera 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxCamera;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05 extends FlxState
	{
		[Embed(source = "tiles_8x8_2.png")]
		private static const Tiles:Class;
		
		[Embed(source = "map.png")]
		private static const Map:Class;
		
		[Embed(source = "death.mp3")]
		private static const DeathSound:Class;
		
		[Embed(source = "pickup.mp3")]
		private static const PickUpSound:Class;
		
		private const TILE_SIZE:int = 8;
		private const HALF_TILE:Number = TILE_SIZE * 0.5;
		
		private var help:DemoHelp;
		
		private var tileMap:FlxTilemap;
		private var lavaGroup:FlxGroup;
		private var enemyGroup:FlxGroup;
		private var gold:D05_Gold;
		
		private var player:D05_Player;
		private var bloodEmitter:D05_BloodEmitter;
		private var point:FlxPoint;
		
		private var cam1:FlxCamera;
		private var cam2:FlxCamera;
		
		public static const GRAV:Number = 300;
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(0, 0, 0);
			
			help = new DemoHelp();
			help.addText("[ARROWS]");
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.imageToCSV(Map), Tiles, TILE_SIZE, TILE_SIZE, FlxTilemap.OFF, 0, 0);
			tileMap.x = (FlxG.width - tileMap.width) / 2;
			tileMap.y = 104 - tileMap.height;
			
			lavaGroup = new FlxGroup();
			
			enemyGroup = new FlxGroup();
			
			player = new D05_Player();
			player.x = tileMap.x + 4 * TILE_SIZE;
			player.y = tileMap.y + 3 * TILE_SIZE;
			moveSprite(player, 1, 0);
			
			bloodEmitter = new D05_BloodEmitter(player.width, player.height, 100);
			
			point = new FlxPoint();
			
			gold = new D05_Gold();
			
			cam1 = new FlxCamera(40, 236, 80, 80, 4);
			cam1.follow(player);
			tileMap.follow(cam1, 0, false);
			FlxG.addCamera(cam1);
			
			cam2 = new FlxCamera(440, 236, 80, 80, 4);
			FlxG.addCamera(cam2);
			
			add(tileMap);
			add(player);
			add(bloodEmitter);
			add(lavaGroup);
			add(enemyGroup);
			add(gold);
			add(help);
			add(new DemoPrompt("Camera"));
			
			makeLavaLiquid(2, 8, 6);
			makeLavaLiquid(11, 8, 6);
			
			makeLavaBall(2, 8, 2);
			makeLavaBall(3, 8, 2);
			makeLavaBall(6, 8, 2, 0.5);
			makeLavaBall(7, 8, 2, 1.5);
			
			makeLavaBall(11, 8, 2, 0.2);
			makeLavaBall(12, 8, 2, 0.4);
			makeLavaBall(14, 8, 2, 0.6);
			makeLavaBall(15, 8, 2, 0.8);
			makeLavaBall(16, 8, 2, 1.0);
			
			var path:FlxPath = new FlxPath();
			addPoint(path, 29, 2);
			addPoint(path, 33, 2);
			makeEnemy01(29, 2, 30, path);
			
			path = new FlxPath();
			addPoint(path, 30, 5);
			addPoint(path, 35, 5);
			makeEnemy01(35, 5, 30, path);
			
			path = new FlxPath();
			addPoint(path, 28, 8);
			addPoint(path, 35, 8);
			makeEnemy01(28, 8, 30, path);
			makeEnemy01(35, 8, 30, path);
			
			moveSprite(gold, 43, 5);
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(player, tileMap);
			FlxG.collide(bloodEmitter, tileMap);
			FlxG.collide(lavaGroup, tileMap);
			FlxG.collide(enemyGroup, tileMap);
			FlxG.collide(gold, tileMap);
			FlxG.overlap(player, lavaGroup, ovPlayer);
			FlxG.overlap(player, enemyGroup, ovPlayer);
			FlxG.overlap(player, gold, ovPlayerGold);
			
			var roomWidth:Number = cam2.width - TILE_SIZE;
			var x0:Number = tileMap.x + HALF_TILE;
			player.getMidpoint(point);
			point.x -= x0;
			point.x = x0 + (int(point.x / roomWidth) + 0.5) * roomWidth;
			point.y = tileMap.y + cam2.height * 0.5;
			cam2.focusOn(point);
		}
		
		private function ovPlayer(o1:FlxObject, o2:FlxObject):void
		{
			player.kill();
			FlxG.play(DeathSound);
			bloodEmitter.at(player);
			bloodEmitter.start(true);
			cam1.shake();
			cam2.shake();
		}
		
		private function ovPlayerGold(o1:FlxObject, o2:FlxObject):void
		{
			gold.kill();
			FlxG.play(PickUpSound);
			cam1.flash();
			cam2.flash();
		}
		
		private function moveSprite(s:FlxSprite, tx:int, ty:int):void
		{
			s.last.x = s.x = tileMap.x + tx * TILE_SIZE + (TILE_SIZE - s.width) * 0.5;
			s.last.y = s.y = tileMap.y + (ty + 1) * TILE_SIZE - s.height;
		}
		
		private function makeLavaLiquid(tx:int, ty:int, num:int):void
		{
			for (var i:int = 0; i < num; ++i) {
				var s:D05_LavaLiquid = new D05_LavaLiquid();
				moveSprite(s, tx, ty);
				lavaGroup.add(s);
				++tx;
			}
		}
		
		private function makeLavaBall(tx:int, ty:int, interval:Number, delay:Number = 0):void
		{
			var s:D05_LavaBall = new D05_LavaBall(interval, delay)
			moveSprite(s, tx, ty);
			lavaGroup.add(s);
		}
		
		private function makeEnemy01(tx:int, ty:int, v:Number, path:FlxPath):void
		{
			var s:D05_Enemy01 = new D05_Enemy01();
			moveSprite(s, tx, ty);
			s.followPath(path, v, FlxObject.PATH_LOOP_FORWARD | FlxObject.PATH_HORIZONTAL_ONLY);
			enemyGroup.add(s);
		}
		
		private function addPoint(path:FlxPath, tx:int, ty:int):void
		{
			path.add(tileMap.x + (tx + 0.5) * TILE_SIZE, tileMap.y + (ty + 0.5) * TILE_SIZE);
		}
		
	}

}