package com.longloaf.d06_particles 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D06 extends FlxState
	{
		private var help:DemoHelp;
		
		private var emitter:FlxEmitter;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			add(help);
			add(new DemoPrompt("Particles"));
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}