package com.longloaf.d07_replays 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import com.longloaf.MenuState;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
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
		
		private static const INIT:int = 0;
		private static const RECORD:int = 1;
		private static const REPLAY:int = 2;
		private static var status:int = INIT;
		
		private var statusText:FlxText;
		
		override public function create():void 
		{
			help = new DemoHelp();
			help.addText("[Mouse]");
			help.addText("[Arrows]");
			
			canvas = new FlxSprite();
			canvas.makeGraphic(FlxG.width, FlxG.height, 0, true);
			
			sprite = new FlxSprite();
			sprite.makeGraphic(30, 30, FlxU.makeColorFromHSB(30, 0.9, 0.9));
			sprite.x = (FlxG.width - sprite.width) / 2;
			sprite.y = (FlxG.height - sprite.height) / 2;
			
			statusText = new FlxText(0, 0, FlxG.width, "?");
			statusText.alignment = "center";
			statusText.shadow = FlxG.BLACK;
			statusText.y = FlxG.height - statusText.height;
			if (status == RECORD) {
				statusText.text = "RECORDING: [Enter] - replay, [Esc] - exit";
				statusText.color = FlxG.RED;
			} else if (status == REPLAY) {
				statusText.text = "REPLAYING: [Mouse button] - stop";
				statusText.color = FlxG.GREEN;
			}
			
			add(canvas);
			add(sprite);
			add(statusText);
			add(help);
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
			
			if (status == INIT) {
				recordReplay();
			} else if (status == RECORD) {
				if (FlxG.keys.justPressed("ESCAPE")) {
					status = INIT;
					FlxG.stopRecording();
					FlxG.switchState(new MenuState());
				} else if (FlxG.keys.justPressed("ENTER")) {
					loadReplay();
				}
			}
		}
		
		private function loadReplay():void
		{
			status = REPLAY;
			var rec:String = FlxG.stopRecording();
			FlxG.loadReplay(rec, new D07, ["MOUSE"], 0, recordReplay);
		}
		
		private function recordReplay():void
		{
			status = RECORD;
			FlxG.recordReplay(false);
		}
		
	}

}