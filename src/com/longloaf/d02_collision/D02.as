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
	import org.flixel.FlxU;
	/**
	 * Демонстрация столкновений.
	 * @author Maksim Soldatov
	 */
	public class D02 extends FlxState
	{
		private const IMMOVABLE_COLOR:uint = FlxU.makeColorFromHSB(0, 0, 0.2);
		private const IMMOVABLE_WIDTH:Number = 15;
		
		private var immovableGroup:FlxGroup;
		
		private var group:FlxGroup;
		
		private var help:DemoHelp;
		
		private var numText:DemoText;
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(0, 0, 0.05);
			
			immovableGroup = new FlxGroup();
			
			var path:FlxPath;
			var point1:FlxPoint
			var point2:FlxPoint;
			
			var leftWall:FlxSprite = makeImmovableSprite(IMMOVABLE_WIDTH, FlxG.height);
			leftWall.x = 0;
			leftWall.y = 0;
			leftWall.allowCollisions = FlxObject.RIGHT;
			immovableGroup.add(leftWall);
			
			var rightWall:FlxSprite = makeImmovableSprite(IMMOVABLE_WIDTH, FlxG.height);
			rightWall.x = FlxG.width - rightWall.width;
			rightWall.y = 0;
			rightWall.allowCollisions = FlxObject.LEFT;
			immovableGroup.add(rightWall);
			
			var bottomPlatform:FlxSprite = makeImmovableSprite(FlxG.width, IMMOVABLE_WIDTH);
			bottomPlatform.x = 0;
			bottomPlatform.y = 0.8 * FlxG.height;
			bottomPlatform.allowCollisions = FlxObject.UP;
			immovableGroup.add(bottomPlatform);
			
			var topPlatform:FlxSprite = makeImmovableSprite(0.75 * FlxG.width, IMMOVABLE_WIDTH);
			topPlatform.x = FlxG.width - topPlatform.width;
			topPlatform.y = 0.3 * FlxG.height;
			topPlatform.allowCollisions = FlxObject.UP;
			immovableGroup.add(topPlatform);
			
			var elevator:FlxSprite = makeImmovableSprite(0.25 * FlxG.width, IMMOVABLE_WIDTH);
			elevator.x = FlxG.width - elevator.width;
			elevator.y = bottomPlatform.y + bottomPlatform.height;
			elevator.allowCollisions = FlxObject.UP;
			point1 = elevator.getMidpoint();
			point2 = topPlatform.getMidpoint();
			point2.x = point1.x;
			path = new FlxPath([point1, point2]);
			elevator.followPath(path, 200, FlxObject.PATH_YOYO);
			immovableGroup.add(elevator);
			
			var topPusher:FlxSprite = makeImmovableSprite(IMMOVABLE_WIDTH, 0.15 * FlxG.height);
			topPusher.x = FlxG.width + topPusher.width;
			topPusher.y = topPlatform.y - topPusher.height;
			topPusher.allowCollisions = FlxObject.LEFT;
			point1 = topPusher.getMidpoint();
			point2 = (new FlxPoint()).copyFrom(point1);
			point2.x = topPlatform.x + topPusher.width / 2;
			path = new FlxPath([point1, point2]);
			topPusher.followPath(path, 250, FlxObject.PATH_YOYO);
			immovableGroup.add(topPusher);
			
			var bottomPusher:FlxSprite = makeImmovableSprite(IMMOVABLE_WIDTH, IMMOVABLE_WIDTH);
			bottomPusher.x = -2 * bottomPusher.width;
			bottomPusher.y = bottomPlatform.y - bottomPusher.height;
			bottomPusher.allowCollisions = FlxObject.RIGHT | FlxObject.UP;
			point1 = bottomPusher.getMidpoint();
			point2 = (new FlxPoint()).copyFrom(point1);
			point2.x = elevator.x - bottomPusher.width / 2;
			path = new FlxPath([point1, point2]);
			bottomPusher.followPath(path, 150, FlxObject.PATH_YOYO);
			immovableGroup.add(bottomPusher);
			
			group = new FlxGroup();
			
			help = new DemoHelp();
			help.addText("[1] - add 10 sprites");
			help.addText("[2] - add 100 sprites");
			numText = help.addText();
			help.addVSpace();
			help.addText("[X] - clear");
			
			add(group);
			add(immovableGroup);
			add(help);
			add(new DemoPrompt("Collision"));
			
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
		
		private function makeImmovableSprite(width:Number, height:Number):FlxSprite
		{
			var s:FlxSprite = new FlxSprite();
			s.makeGraphic(width, height, IMMOVABLE_COLOR);
			s.immovable = true;
			return s;
		}
		
		private function updateNumText():void
		{
			numText.text = "Num: " + group.length;
		}
		
	}

}