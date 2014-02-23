package com.longloaf.d06_particles 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.Rnd;
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
		[Embed(source = "img01.png")]
		private static const Img01:Class;
		
		[Embed(source = "img02.png")]
		private static const Img02:Class;
		
		[Embed(source = "img03.png")]
		private static const Img03:Class;
		
		private static const IMGS:Vector.<Class> = Vector.<Class>([Img01, Img02, Img03]);
		
		private var help:DemoHelp;
		
		private var emitter:FlxEmitter;
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(0, 0, 0.1);
			
			help = new DemoHelp();
			
			emitter = new FlxEmitter(0, 0, 100);
			emitter.bounce = 0.9;
			//emitter.setRotation(-90, 90);
			emitter.setSize(100, 100);
			emitter.x = (FlxG.width - emitter.width) / 2;
			emitter.y = (FlxG.height - emitter.height) / 2;
			//emitter.setXSpeed( -200, 200);
			//emitter.setYSpeed( -200, 200);
			//emitter.gravity = 500;
			for (var i:int = 0; i < emitter.maxSize; ++i) {
				var p:FlxParticle = new FlxParticle();
				var img:Class = IMGS[int(Rnd.rnd(IMGS.length))];
				p.loadGraphic(img)
				p.exists = false;
				emitter.add(p);
			}
			emitter.start(false, 0, 0.02);// 0.001);
			
			add(emitter);
			add(help);
			add(new DemoPrompt("Particles"));
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}