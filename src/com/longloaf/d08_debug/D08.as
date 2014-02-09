package com.longloaf.d08_debug 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08 extends FlxState
	{
		[Embed(source = "map.txt", mimeType = "application/octet-stream")]
		private static const Map:Class;
		
		[Embed(source = "tiles.png")]
		private static const Tiles:Class;
		
		private var help:DemoHelp;
		
		private var map:FlxTilemap;
		
		private var player:D08_Player;
		
		private var debugLayoutOld:uint;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			map = new FlxTilemap();
			map.loadMap(new Map(), Tiles, 10, 10, FlxTilemap.OFF, 0, 0);
			
			player = new D08_Player();
			player.x = player.y = 100;
			
			FlxG.watch(player, "grav", "grav");
			FlxG.watch(player, "acc", "acc");
			FlxG.watch(player.maxVelocity, "x", "maxVelX");
			FlxG.watch(player.maxVelocity, "y", "maxVelY");
			FlxG.watch(player, "jumpVel", "jumpVel");
			FlxG.watch(player, "floorDrag", "floorDrag");
			
			add(map);
			add(player);
			add(help);
			add(new DemoPrompt("Debug"));
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(player, map);
		}
		
	}

}