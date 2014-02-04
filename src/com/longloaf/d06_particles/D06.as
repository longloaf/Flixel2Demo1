package com.longloaf.d06_particles 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D06 extends FlxState
	{
		[Embed(source = "particles_20x20_5.png")]
		private static const ParticlesImg:Class;
		
		private var help:DemoHelp;
		private var numText:FlxText;
		
		private var emitter:FlxEmitter;
		
		override public function create():void 
		{
			help = new DemoHelp();
			numText = help.addText();
			
			emitter = new FlxEmitter(FlxG.width / 2, FlxG.height / 2);
			emitter.makeParticles(ParticlesImg, 20, 0, true, 0);
			//emitter.setSize(100, 100);
			emitter.lifespan = 0;
			emitter.gravity = -1000;
			emitter.setRotation(0, 0);
			emitter.setXSpeed(150, 250);
			
			add(emitter);
			add(help);
			add(new DemoPrompt("Particles"));
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.pressed()) {
				emitter.emitParticle();
			}
			super.update();
			numText.text = emitter.length.toString();
		}
		
	}

}