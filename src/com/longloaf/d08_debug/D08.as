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
		
		private var buttonGroup:FlxGroup;
		private var button01:D08_Button;
		private var button02:D08_Button;
		
		private var doorGroup:FlxGroup;
		private var door01:D08_Door;
		private var door02:D08_Door;
		private var door03:D08_Door;
		
		private var spikeGroup:FlxGroup;
		
		private var itemGroup:FlxGroup;
		
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
			
			buttonGroup = new FlxGroup();
			
			button01 = new D08_Button();
			button01.time = 10;
			button01.onButtonDown = button01Callback;
			button01.onButtonUp = button01Callback;
			moveToTile(button01, 22, 16, CENTER, BOTTOM);
			buttonGroup.add(button01);
			
			button02 = new D08_Button();
			button02.time = 7;
			button02.onButtonDown = button02Callback;
			button02.onButtonUp  = button02Callback;
			moveToTile(button02, 17, 7, CENTER, BOTTOM);
			buttonGroup.add(button02);
			
			doorGroup = new FlxGroup();
			
			door01 = new D08_Door(3);
			moveToTile(door01, 16, 5);
			doorGroup.add(door01);
			
			door02 = new D08_Door(3);
			moveToTile(door02, 21, 5);
			door02.exists = false;
			doorGroup.add(door02);
			
			door03 = new D08_Door(2);
			moveToTile(door03, 16, 14);
			doorGroup.add(door03);
			
			spikeGroup = new FlxGroup();
			addSpikes(8, 12, 6);
			
			itemGroup = new FlxGroup();
			addItems(8, 10, 9);
			addItems(3, 4);
			addItems(1, 7);
			addItems(3, 10);
			addItems(1, 13);
			addItems(18, 13);
			addItems(13, 4);
			addItems(20, 4, 1);
			addItems(12, 16);
			addItems(19, 16);
			
			FlxG.watch(player, "maxVelX", "maxVelX");
			FlxG.watch(player, "jumpVel", "jumpVel");
			
			add(map);
			add(player);
			add(buttonGroup);
			add(doorGroup);
			add(spikeGroup);
			add(itemGroup);
			add(player.emitter);
			add(help);
			add(new DemoPrompt("Debug"));
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(player, map);
			FlxG.collide(player, doorGroup);
			FlxG.overlap(player, buttonGroup, ovPlayerButton);
			FlxG.overlap(player, spikeGroup, ovPlayerSpike);
			FlxG.overlap(player, itemGroup, ovPlayerItem);
		}
		
		private function ovPlayerButton(o1:FlxObject, o2:FlxObject):void
		{
			(o2 as D08_Button).press();
		}
		
		private function ovPlayerSpike(o1:FlxObject, o2:FlxObject):void
		{
			player.kill();
		}
		
		private function ovPlayerItem(o1:FlxObject, o2:FlxObject):void
		{
			(o2 as D08_Item).pickUp();
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
		
		private function addSpikes(tx:int, ty:int, w:int = 1):void
		{
			for (var x:int = 0; x < w; ++x) {
				var s:D08_Spike = new D08_Spike();
				moveToTile(s, tx + x, ty, CENTER, TOP);
				spikeGroup.add(s);
			}
		}
		
		private function addItems(tx:int, ty:int, w:int = 1):void
		{
			for (var x:int = 0; x < w; ++x) {
				var item:D08_Item = new D08_Item();
				moveToTile(item, tx + x, ty, CENTER, BOTTOM);
				itemGroup.add(item);
			}
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