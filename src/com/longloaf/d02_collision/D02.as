package com.longloaf.d02_collision 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D02 extends FlxState
	{
		private var platformGroup:FlxGroup;
		
		private var group:FlxGroup;
		
		private var help:DemoHelp;
		
		override public function create():void 
		{
			platformGroup = new FlxGroup();
			var platform:FlxSprite = makePlatform(350);
			platform.reset((FlxG.width - platform.width) / 2, 250);
			platformGroup.add(platform);
			
			group = new FlxGroup();
			
			help = new DemoHelp();
			
			add(platformGroup);
			add(group);
			add(help);
			add(new DemoPrompt("02"));
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.justPressed()) {
				var s:D02_Sprite = new D02_Sprite();
				s.move(FlxG.mouse.x, FlxG.mouse.y);
				group.add(s);
			}
			super.update();
			FlxG.collide(group);
			FlxG.collide(group, platformGroup);
		}
		
		private function makePlatform(width:Number):FlxSprite
		{
			var s:FlxSprite = new FlxSprite();
			s.makeGraphic(width, 20, FlxG.WHITE);
			s.immovable = true;
			return s;
		}
		
	}

}