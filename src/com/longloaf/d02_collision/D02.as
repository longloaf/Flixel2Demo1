package com.longloaf.d02_collision 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D02 extends FlxState
	{
		[Embed(source = "tiles_20x20_4.png")]
		private static const Tiles:Class;
		
		[Embed(source = "map.txt", mimeType = "application/octet-stream")]
		private static const Map:Class;
		
		private const BORDER_WIDTH:Number = 50;
		
		private var map:FlxTilemap;
		
		private var group:FlxGroup;
		
		private var help:DemoHelp;
		
		override public function create():void 
		{
			map = new FlxTilemap();
			map.loadMap(new Map(), Tiles, 20, 20, FlxTilemap.OFF, 0, 0, 2);
			
			group = new FlxGroup();
			
			help = new DemoHelp();
			
			add(map);
			add(group);
			add(help);
			add(new DemoPrompt("02"));
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.justPressed()) {
				var s:D02_Sprite = new D02_Sprite();
				s.reset(FlxG.mouse.x, FlxG.mouse.y);
				group.add(s);
			}
			super.update();
			FlxG.collide(group);
			FlxG.collide(map, group);
			group.sort();
		}
		
		private function makeWall(x:Number, y:Number, w:Number, h:Number):void
		{
			
		}
		
	}

}