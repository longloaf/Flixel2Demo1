package com.longloaf.d06_particles 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.util.Rnd;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	import org.flixel.FlxSprite;
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
		[Embed(source = "face_20x24_8.png")]
		private static const Face:Class;
		
		private var spr:FlxSprite;
		private var emitter:FlxEmitter;
		
		private const particleFunctions:Vector.<Function> = Vector.<Function>([
		createParticle1,
		createParticle2,
		createParticle3,
		createParticle4
		]);
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(0, 0, 0.8);
			
			spr = new FlxSprite();
			spr.makeGraphic(200, 150, FlxU.makeColorFromHSB(0, 0, 0.6));
			spr.x = (FlxG.width - spr.width) / 2;
			spr.y = (FlxG.height - spr.height) / 2;
			
			emitter = new FlxEmitter(0, 0, 100);
			emitter.setSize(spr.width, spr.height);
			emitter.x = (FlxG.width - emitter.width) / 2;
			emitter.y = (FlxG.height - emitter.height) / 2;
			for (var i:int = 0; i < emitter.maxSize; ++i) {
				var id:int = int(Rnd.rnd(particleFunctions.length));
				var f:Function = particleFunctions[id];
				var p:FlxParticle = f();
				p.exists = false;
				emitter.add(p);
			}
			emitter.at(spr);
			emitter.start(false, 0, 0.05);
			
			add(spr);
			add(emitter);
			add(new DemoPrompt("Particles"));
		}
		
		private function createParticle1():FlxParticle
		{
			return new FlxParticle();
		}
		
		private function createParticle2():FlxParticle
		{
			var p:FlxParticle = new FlxParticle();
			p.makeGraphic(20, 15, FlxU.makeColorFromHSB(200, 0.9, 0.9));
			var x1:Number = 0;
			var x2:Number = p.width - 1;
			var y1:Number = 0;
			var y2:Number = p.height - 1;
			var c:uint = 0xFF000000;
			p.drawLine(x1, y1, x2, y1, c);
			p.drawLine(x1, y2, x2 + 1, y2, c);
			p.drawLine(x1, y1, x1, y2, c);
			p.drawLine(x2, y1, x2, y2, c);
			return p;
		}
		
		private function createParticle3():FlxParticle
		{
			var p:FlxParticle = new FlxParticle();
			p.loadGraphic(Face, true, false, 20, 24);
			p.scale.x = 2;
			p.scale.y = 2;
			p.addAnimation("1", [0, 1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1], 24);
			p.play("1");
			return p;
		}
		
		private function createParticle4():FlxParticle
		{
			return new D06_Particle();
		}
		
	}

}