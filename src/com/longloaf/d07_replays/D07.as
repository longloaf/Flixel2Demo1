package com.longloaf.d07_replays 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import com.longloaf.MenuState;
	import com.longloaf.util.Rnd;
	import com.longloaf.util.SprTrace;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
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
		
		private var sprTrace:SprTrace;
		
		private var spr02Group:FlxGroup;
		
		private const V:Number = 200;
		private var sprite:FlxSprite;
		
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
			help.addVSpace();
			help.addText("[C] - clear");
			
			sprTrace = new SprTrace(0);
			
			spr02Group = new FlxGroup();
			
			for (var i:int = 0; i < 10; ++i) {
				var s02:D07_Sprite02 = new D07_Sprite02(Rnd.rnd(FlxG.width), Rnd.rnd(FlxG.height));
				spr02Group.add(s02);
				sprTrace.addSpr(s02);
			}
			
			sprite = new FlxSprite();
			sprite.makeGraphic(30, 30, FlxU.makeColorFromHSB(30, 0.9, 0.9));
			sprite.x = (FlxG.width - sprite.width) / 2;
			sprite.y = (FlxG.height - sprite.height) / 2;
			sprTrace.addSpr(sprite);
			
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
			
			add(sprTrace);
			add(spr02Group);
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
			
			if (FlxG.keys.justPressed("C")) {
				sprTrace.clear();
			}
			
			super.update();
			
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