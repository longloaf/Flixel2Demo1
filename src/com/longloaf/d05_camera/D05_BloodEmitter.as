package com.longloaf.d05_camera 
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D05_BloodEmitter extends FlxEmitter
	{
		
		private const V:Number = 100;
		
		public function D05_BloodEmitter(w:int, h:int, MaxSize:int) 
		{
			super(0, 0, MaxSize);
			gravity = D05.GRAV;
			bounce = 0.5;
			setRotation(0, 0);
			setXSpeed(-V, V);
			setYSpeed(-V, V);
			setSize(w, h);
			
			var particle:D05_BloodParticle;
			for (var i:int = 0; i < maxSize; ++i) {
				particle = new D05_BloodParticle();
				particle.exists = false;
				add(particle);
			}
		}
		
	}

}