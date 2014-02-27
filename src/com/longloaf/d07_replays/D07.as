package com.longloaf.d07_replays 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.MenuState;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D07 extends FlxState
	{
		private var help:DemoHelp;
		
		private const V:Number = 200;
		private var sprite:FlxSprite;
		
		private var canvas:FlxSprite;
		private var h:Number = 0;
		private const DH:Number = 0.5;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			canvas = new FlxSprite();
			canvas.makeGraphic(FlxG.width, FlxG.height, 0, true);
			
			sprite = new FlxSprite();
			sprite.makeGraphic(30, 30, FlxU.makeColorFromHSB(30, 0.9, 0.9));
			sprite.x = (FlxG.width - sprite.width) / 2;
			sprite.y = (FlxG.height - sprite.height) / 2;
			
			add(canvas);
			add(sprite);
			//add(help);
			//add(new DemoPrompt("Replays"));
		}
		
		override public function update():void 
		{
			sprite.velocity.x = 0;
			if (FlxG.keys.LEFT) sprite.velocity.x -= V;
			if (FlxG.keys.RIGHT) sprite.velocity.x += V;
			
			sprite.velocity.y = 0;
			if (FlxG.keys.UP) sprite.velocity.y -= V;
			if (FlxG.keys.DOWN) sprite.velocity.y += V;
			
			super.update();
			
			canvas.drawLine(sprite.last.x, sprite.last.y, sprite.x, sprite.y, FlxU.makeColorFromHSB(h, 0.9, 0.9, 0.5), 3);
			h += DH;
			if (h > 360) {
				h -= 360;
			}
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new MenuState());
			}
		}
		
	}

}