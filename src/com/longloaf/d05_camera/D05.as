package com.longloaf.d05_camera 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05 extends FlxState
	{
		[Embed(source = "../d04_pathfinding/map.png")]
		private static const Map:Class;
		
		[Embed(source = "../d04_pathfinding/tiles.png")]
		private static const Tiles:Class;
		
		private var help:DemoHelp;
		
		private var tileMap:FlxTilemap;
		
		private var sprite:D05_Sprite;
		
		private var camera:FlxCamera;
		
		override public function create():void 
		{
			help = new DemoHelp();
			help.addText("[ARROWS] - move");
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.imageToCSV(Map), Tiles, 10, 10, FlxTilemap.OFF, 0, 0);
			
			sprite = new D05_Sprite();
			sprite.x = 12;
			sprite.y = 22;
			
			camera = new FlxCamera(380, 120, 70, 85, 4);
			camera.follow(sprite, FlxCamera.STYLE_LOCKON);
			tileMap.follow(camera);
			FlxG.addCamera(camera);
			
			add(tileMap);
			add(sprite);
			add(help);
			add(help);
			add(new DemoPrompt("Camera"));
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.justPressed()) {
				camera.shake();
			}
			super.update();
			FlxG.collide(sprite, tileMap);
		}
		
	}

}