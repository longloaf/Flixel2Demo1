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
		private var path:FlxPath;
		private var p:FlxPoint = null;
		
		private var visualDebugOld:Boolean;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			sprite = new FlxSprite();
			sprite.x = (FlxG.width - sprite.width) / 2;
			sprite.y = (FlxG.height - sprite.height) / 2;
			sprite.makeGraphic(20, 20, 0xFF006000);
			sprite.drag.make(1000, 1000);
			
			var point1:FlxPoint = new FlxPoint(50, 150);
			var point2:FlxPoint = new FlxPoint(200, 150);
			var point3:FlxPoint = new FlxPoint(200, 50);
			var point4:FlxPoint = new FlxPoint(350, 50);
			var point5:FlxPoint = new FlxPoint(350, 250);
			var point6:FlxPoint = new FlxPoint(50, 250);
			
			path = new FlxPath([point1, point2, point3, point4, point5, point6]);
			//path = new FlxPath([point1]);
			//sprite.followPath(path, 200, FlxObject.PATH_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_HORIZONTAL_ONLY);
			//sprite.followPath(path, 200, FlxObject.PATH_LOOP_BACKWARD);
			sprite.followPath(path, 200, FlxObject.PATH_LOOP_FORWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_VERTICAL_ONLY);
			//sprite.followPath(path, 200, FlxObject.PATH_YOYO);
			
			add(sprite);
			add(help);
			add(new DemoPrompt("Path"));
			
			visualDebugOld = FlxG.visualDebug;
			FlxG.visualDebug = true;
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.justPressed()) {
				p = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
				path.addPoint(p, true);
			} else if (FlxG.mouse.pressed()) {
				p.make(FlxG.mouse.x, FlxG.mouse.y);
			}
			super.update();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			FlxG.visualDebug = visualDebugOld;
		}
		
	}

}