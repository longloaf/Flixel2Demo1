package com.longloaf.d02_collision 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D02 extends FlxState
	{
		private const IMMOVABLE_COLOR:uint = 0xFF505050;
		
		private var immovableGroup:FlxGroup;
		
		private var group:FlxGroup;
		
		private var help:DemoHelp;
		
		private var numText:DemoText;
		
		override public function create():void 
		{
			immovableGroup = new FlxGroup();
			
			var spr:FlxSprite;
			var path:FlxPath;
			var point:FlxPoint;
			
			spr = makeImmovableSprite(350, 15);
			spr.x = 25;
			spr.y = 250;
			spr.allowCollisions = FlxObject.UP;
			immovableGroup.add(spr);
			
			spr = makeImmovableSprite(250, 15);
			spr.x = 125;
			spr.y = 100;
			spr.allowCollisions = FlxObject.UP;
			immovableGroup.add(spr);
			
			spr = makeImmovableSprite(15, 150);
			spr.x = 25;
			spr.y = 100;
			spr.allowCollisions = FlxObject.RIGHT;
			immovableGroup.add(spr);
			
			spr = makeImmovableSprite(15, 150);
			spr.x = 360;
			spr.y = 100;
			spr.allowCollisions = FlxObject.LEFT;
			immovableGroup.add(spr);
			
			spr = makeImmovableSprite(100, 15);
			spr.x = 275;
			spr.y = 250;
			spr.allowCollisions = FlxObject.UP;
			point = spr.getMidpoint();
			point.y -= 150;
			path = new FlxPath([spr.getMidpoint(), point]);
			spr.followPath(path, 100, FlxObject.PATH_YOYO);
			immovableGroup.add(spr);
			
			spr = makeImmovableSprite(15, 50);
			spr.x = 360;
			spr.y = 50;
			spr.allowCollisions = FlxObject.LEFT;
			point = spr.getMidpoint();
			point.x -= 235;
			path = new FlxPath([spr.getMidpoint(), point]);
			spr.followPath(path, 100, FlxObject.PATH_YOYO);
			immovableGroup.add(spr);
			
			spr = makeImmovableSprite(15, 20);
			spr.x = 25;
			spr.y = 230;
			spr.allowCollisions = FlxObject.RIGHT | FlxObject.UP;
			point = spr.getMidpoint();
			point.x += 235;
			path = new FlxPath([spr.getMidpoint(), point]);
			spr.followPath(path, 100, FlxObject.PATH_YOYO);
			immovableGroup.add(spr);
			
			
			group = new FlxGroup();
			
			help = new DemoHelp();
			help.addText("[1] - add 10 sprites");
			help.addText("[2] - add 100 sprites");
			numText = help.addText();
			help.addVSpace();
			help.addText("[X] - clear");
			
			add(immovableGroup);
			add(group);
			add(help);
			add(new DemoPrompt("02"));
			
			addSprites(10);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				addSprites(10);
			} else if (FlxG.keys.justPressed("TWO")) {
				addSprites(100);
			} else if (FlxG.keys.justPressed("X")) {
				group.clear();
				updateNumText();
			}
			super.update();
			FlxG.collide(group);
			FlxG.collide(group, immovableGroup);
		}
		
		private function addSprites(n:int):void {
			for (var i:int = 0; i < n; ++i) {
				var s:D02_Sprite = new D02_Sprite();
				s.move(Rnd.rnd(FlxG.width), Rnd.rnd(FlxG.height));
				group.add(s);
			}
			updateNumText();
		}
		
		private function makeImmovableSprite(width:Number, height:Number, color:uint = IMMOVABLE_COLOR):FlxSprite
		{
			var s:FlxSprite = new FlxSprite();
			s.makeGraphic(width, height, color);
			s.immovable = true;
			return s;
		}
		
		private function updateNumText():void
		{
			numText.text = "Num: " + group.length;
		}
		
	}

}