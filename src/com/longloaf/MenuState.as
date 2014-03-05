package com.longloaf 
{
	import com.longloaf.d01_sprite.D01;
	import com.longloaf.d02_collision.D02;
	import com.longloaf.d03_path.D03;
	import com.longloaf.d04_pathfinding.D04;
	import com.longloaf.d05_camera.D05;
	import com.longloaf.d06_particles.D06;
	import com.longloaf.d07_replays.D07;
	import com.longloaf.d08_debug.D08;
	import com.longloaf.d09_sort.D09;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	/**
	 * Главное меню. Содержит список демонстраций.
	 * @author Maksim Soldatov
	 */
	public class MenuState extends FlxState
	{
		
		private var demos:Vector.<DemoData> = Vector.<DemoData>([
		new DemoData("Sprite", D01),
		new DemoData("Collision", D02),
		new DemoData("Path", D03),
		new DemoData("Pathfinding", D04),
		new DemoData("Camera", D05),
		new DemoData("Particles", D06),
		new DemoData("Replays", D07),
		new DemoData("Debug", D08),
		new DemoData("Sort", D09)]);
		
		override public function create():void 
		{
			FlxG.bgColor = FlxU.makeColorFromHSB(0, 0, 0.1);
			
			var title:DemoText = new DemoText(0, 20, FlxG.width, "FLIXEL DEMO");
			title.size = 16;
			title.alignment = "center";
			add(title);
			
			var flixelVersion:DemoText = new DemoText(0, 0, FlxG.width, "Flixel 2.55");
			flixelVersion.alignment = "center";
			flixelVersion.y = FlxG.height - flixelVersion.height;
			add(flixelVersion);
			
			var y0:Number = title.y + title.height + 20;
			var colNum:int = 4;
			var rowNum:int = 7;
			var colWidth:Number = FlxG.width / colNum;
			var rowHeight:Number = 30;
			for (var i:int = 0; i < demos.length; ++i) {
				var d:DemoData = demos[i];
				var b:DemoButton = new DemoButton(0, 0, d.name, d.demoClass);
				var row:int = i % rowNum;
				var col:int = i / rowNum;
				b.x = col * colWidth + (colWidth - b.width) * 0.5;
				b.y = y0 + row * rowHeight;
				add(b);
			}
		}
		
	}

}