package com.longloaf.d03_path 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.Rnd;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03 extends FlxState
	{
		private var help:DemoHelp;
		
		private var pointGroup:D03_PointGroup;
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(60, 0.5, 0.9);
			
			help = new DemoHelp();
			help.addText("[Mouse] - select and drag points");
			help.addText("[N] - add new point");
			help.addText("[R] - remove selected point");
			
			pointGroup = new D03_PointGroup();
			
			var sprite:D03_Sprite;
			for (var i:int = 0; i < D03_Sprite.FRAME_NUM; ++i) {
				sprite = new D03_Sprite();
				sprite.setFrame(i);
				sprite.x = Rnd.rnd(FlxG.width - sprite.width);
				sprite.y = Rnd.rnd(FlxG.height - sprite.height);
				sprite.drag.make(1000, 1000);
				sprite.followPath(pointGroup.path, 50 * (i + 1), FlxObject.PATH_LOOP_FORWARD, true);
				add(sprite);
			}
			
			add(sprite);
			add(pointGroup);
			add(help);
			add(new DemoPrompt("Path"));
		}
		
	}

}