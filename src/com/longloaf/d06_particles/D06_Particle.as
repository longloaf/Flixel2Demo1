package com.longloaf.d06_particles 
{
	import org.flixel.FlxParticle;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D06_Particle extends FlxParticle
	{
		[Embed(source = "man_19x20.png")]
		private static const Img:Class;
		
		private var t:Number = 0;
		private const DT:Number = 0.3;
		private const TWO_PI:Number = 2 * Math.PI;
		
		public function D06_Particle() 
		{
			loadGraphic(Img);
		}
		
		override public function update():void 
		{
			super.update();
			t += DT;
			if (t > TWO_PI) t -= TWO_PI;
			scale.x = 2 + Math.sin(t);
			scale.y = 2 + Math.cos(t);
		}
		
	}

}