package com.longloaf.d08_debug 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08 extends FlxState
	{
		[Embed(source = "map.png")]
		private static const Map:Class;
		
		[Embed(source = "tiles_16x16_auto.png")]
		private static const Tiles:Class;
		
		public static const TILE_SIZE:int = 16;
		
		public const CENTER:int = 0;
		public const LEFT:int = -1;
		public const RIGHT:int = 1;
		public const TOP:int = -1;
		public const BOTTOM:int = 1;
		
		private var help:DemoHelp;
		
		private var map:FlxTilemap;
		
		private var player:D08_Player;
		
		private var button01:D08_Button;
		private var button02:D08_Button;
		
		private var doorGroup:FlxGroup;
		private var door01:D08_Door;
		private var door02:D08_Door;
		private var door03:D08_Door;
		
		private var debugLayoutOld:uint;
		
		override public function create():void 
		{
			FlxG.bgColor = 0xFFF0BE4C;
			
			help = new DemoHelp();
			help.addText("[ARROWS]");
			
			map = new FlxTilemap();
			map.loadMap(FlxTilemap.imageToCSV(Map), Tiles, 0, 0, FlxTilemap.AUTO);
			
			player = new D08_Player();
			player.x = player.y = 100;
			moveToTile(player, 9, 3, CENTER, BOTTOM);
			
			button01 = new D08_Button();
			button01.time = 8;
			button01.onButtonDown = button01Callback;
			button01.onButtonUp = button01Callback;
			moveToTile(button01, 22, 16, CENTER, BOTTOM);
			
			button02 = new D08_Button();
			button02.time = 5;
			button02.onButtonDown = button02Callback;
			button02.onButtonUp  = button02Callback;
			moveToTile(button02, 17, 6, CENTER, BOTTOM);
			
			doorGroup = new FlxGroup();
			
			door01 = new D08_Door(3);
			moveToTile(door01, 16, 4);
			doorGroup.add(door01);
			
			door02 = new D08_Door(3);
			moveToTile(door02, 21, 4);
			door02.exists = false;
			doorGroup.add(door02);
			
			door03 = new D08_Door(3);
			moveToTile(door03, 16, 14);
			doorGroup.add(door03);
			
			FlxG.watch(player, "maxVelX", "maxVelX");
			FlxG.watch(player, "jumpVel", "jumpVel");
			
			add(map);
			add(player);
			add(button01);
			add(button02);
			add(doorGroup);
			add(help);
			add(new DemoPrompt("Debug"));
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(player, map);
			FlxG.collide(player, doorGroup);
			FlxG.overlap(player, button01, ovPlayerButton);
			FlxG.overlap(player, button02, ovPlayerButton);
		}
		
		private function ovPlayerButton(o1:FlxObject, o2:FlxObject):void
		{
			(o2 as D08_Button).press();
		}
		
		private function button01Callback():void
		{
			door01.exists = !door01.exists;
		}
		
		private function button02Callback():void
		{
			door02.exists = !door02.exists;
			door03.exists = !door03.exists;
		}
		
		private function moveToTile(s:FlxSprite, tx:int, ty:int, hAlign:int = LEFT, vAlign:int = TOP):void
		{
			s.last.x = s.x = tx * TILE_SIZE;
			if (hAlign == CENTER) {
				s.x += (TILE_SIZE - s.width) * 0.5;
			} else if (hAlign == RIGHT) {
				s.x += TILE_SIZE - s.width;
			}
			
			s.last.y = s.y = ty * TILE_SIZE;
			if (vAlign == CENTER) {
				s.y += (TILE_SIZE - s.height) * 0.5;
			} else if (vAlign == BOTTOM) {
				s.y += TILE_SIZE - s.height;
			}
		}
		
	}

}