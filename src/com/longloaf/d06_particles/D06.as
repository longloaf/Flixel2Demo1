package com.longloaf.d06_particles 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D06 extends FlxState
	{	
		[Embed(source = "map.png")]
		private static const Map:Class;
		
		[Embed(source = "tiles_16x16_2.png")]
		private static const Tiles:Class;
		
		public static const TILE_SIZE:int = 16;
		
		private var help:DemoHelp;
		
		private var tileMap:FlxTilemap;
		
		private var emitter:FlxEmitter;
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(0, 0, 0.1);
			
			help = new DemoHelp();
			
			tileMap = new FlxTilemap();
			tileMap.loadMap(FlxTilemap.imageToCSV(Map), Tiles, TILE_SIZE, TILE_SIZE);
			
			emitter = new FlxEmitter(30, 50, 1000);
			emitter.bounce = 0.9;
			emitter.setRotation(0, 0);
			emitter.setSize(TILE_SIZE, TILE_SIZE);
			emitter.gravity = 500;
			for (var i:int = 0; i < emitter.maxSize; ++i) {
				var p:FlxParticle = new FlxParticle();
				p.makeGraphic(1, 1, FlxU.makeColorFromHSB(30, 1, 1));
				p.exists = false;
				emitter.add(p);
			}
			emitter.start(false, 0, 0.001);
			
			add(tileMap);
			add(emitter);
			add(help);
			add(new DemoPrompt("Particles"));
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(emitter, tileMap);
		}
		
	}

}