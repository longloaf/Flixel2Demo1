package com.longloaf.d08_debug 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
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
		
		[Embed(source = "tiles.png")]
		private static const Tiles:Class;
		
		public const TILE_SIZE:int = 16;
		
		private var help:DemoHelp;
		
		private var map:FlxTilemap;
		
		private var player:D08_Player;
		
		private var debugLayoutOld:uint;
		
		override public function create():void 
		{
			FlxG.bgColor = 0xFF32383F;
			
			help = new DemoHelp();
			
			map = new FlxTilemap();
			map.loadMap(FlxTilemap.imageToCSV(Map), Tiles, 0, 0, FlxTilemap.AUTO);
			
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