package com.longloaf.d03_path 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03 extends FlxState
	{
		private var help:DemoHelp;
		
		
		private var tileMap:FlxTilemap;
		private var sprite:FlxSprite;
		private var sprite2:FlxSprite;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			sprite = new FlxSprite(50, 50);
			sprite.makeGraphic(20, 20, 0xFF006000);
			sprite.drag.make(1000, 1000);
			
			var point1:FlxPoint = new FlxPoint(50, 150);
			var point2:FlxPoint = new FlxPoint(200, 150);
			var point3:FlxPoint = new FlxPoint(200, 50);
			var point4:FlxPoint = new FlxPoint(350, 50);
			var point5:FlxPoint = new FlxPoint(350, 250);
			var point6:FlxPoint = new FlxPoint(50, 250);
			
			var path:FlxPath = new FlxPath([point1, point2, point3, point4, point5, point6]);
			//sprite.followPath(path, 200, FlxObject.PATH_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_HORIZONTAL_ONLY);
			//sprite.followPath(path, 200, FlxObject.PATH_LOOP_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_LOOP_FORWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_VERTICAL_ONLY);
			sprite.followPath(path, 200, FlxObject.PATH_YOYO);
			
			sprite2 = new FlxSprite();
			sprite2.makeGraphic(20, 20, 0xFF600000);
			sprite2.x = point3.x - sprite2.width / 2;
			sprite2.y = point3.y - sprite2.height / 2;
			sprite2.immovable = true;
			
			FlxG.log(FlxG.visualDebug);
			FlxG.visualDebug = true;
			
			add(sprite);
			add(sprite2);
			add(help);
			add(new DemoPrompt("03"));
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(sprite, sprite2);
		}
		
	}

}