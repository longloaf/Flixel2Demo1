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
		[Embed(source = "arrow_5x5.png")]
		private static const ArrowImg:Class;
		
		private var help:DemoHelp;
		
		private var sprite:FlxSprite;
		
		private var pointGroup:D03_PointGroup;
		
		//private var path:FlxPath;
		//private var p:FlxPoint = null;
		
		private var visualDebugOld:Boolean;
		
		override public function create():void 
		{
			help = new DemoHelp();
			
			sprite = new FlxSprite();
			sprite.x = (FlxG.width - sprite.width) / 2;
			sprite.y = FlxG.height * 0.1;
			sprite.loadGraphic(ArrowImg);
			sprite.scale.x = sprite.scale.y = 4;
			sprite.drag.make(1000, 1000);
			
			pointGroup = new D03_PointGroup();
			sprite.followPath(pointGroup.path, 50, FlxObject.PATH_LOOP_FORWARD, true);
			
			/*
			var point1:FlxPoint = new FlxPoint(50, 150);
			var point2:FlxPoint = new FlxPoint(200, 150);
			var point3:FlxPoint = new FlxPoint(200, 50);
			var point4:FlxPoint = new FlxPoint(350, 50);
			var point5:FlxPoint = new FlxPoint(350, 250);
			var point6:FlxPoint = new FlxPoint(50, 250);
			path = new FlxPath([point1]);
			//path = new FlxPath([point1, point2, point3, point4, point5, point6]);
			//path = new FlxPath([point1]);
			//sprite.followPath(path, 200, FlxObject.PATH_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_HORIZONTAL_ONLY);
			//sprite.followPath(path, 200, FlxObject.PATH_LOOP_BACKWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_LOOP_FORWARD);
			//sprite.followPath(path, 200, FlxObject.PATH_VERTICAL_ONLY);
			//sprite.followPath(path, 200, FlxObject.PATH_YOYO);
			sprite.followPath(path, 50, FlxObject.PATH_LOOP_FORWARD, true);
			*/
			
			add(sprite);
			add(pointGroup);
			add(help);
			add(new DemoPrompt("Path"));
			
			visualDebugOld = FlxG.visualDebug;
			FlxG.visualDebug = true;
		}
		
		override public function update():void 
		{
			/*
			if (FlxG.mouse.justPressed()) {
				p = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
				path.addPoint(p, true);
			} else if (FlxG.mouse.pressed()) {
				p.make(FlxG.mouse.x, FlxG.mouse.y);
			}
			*/
			super.update();
		}
		
		override public function destroy():void 
		{
			super.destroy();
			FlxG.visualDebug = visualDebugOld;
		}
		
	}

}