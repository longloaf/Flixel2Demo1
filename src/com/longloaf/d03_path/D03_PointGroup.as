package com.longloaf.d03_path 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03_PointGroup extends FlxGroup
	{
		public var path:FlxPath;
		
		private var selected:D03_Point;
		
		private var mouse:FlxPoint;
		
		public function D03_PointGroup() 
		{
			path = new FlxPath();
			
			selected = new D03_Point();
			selected.move(FlxG.width / 2, FlxG.height / 2);
			add(selected);
			
			path.addPoint(selected.point, true);
			
			mouse = new FlxPoint();
		}
		
		override public function update():void 
		{
			mouse.make(FlxG.mouse.x, FlxG.mouse.y);
			if (FlxG.mouse.justPressed()) {
				/*
				var p:D03_Point = new D03_Point();
				p.move(FlxG.mouse.x, FlxG.mouse.y);
				add(p);
				path.addPoint(p.point, true);
				*/
				var s:D03_Point = null;
				for (var i:int = length - 1; i >= 0; --i) {
					var p:D03_Point = members[i] as D03_Point;
					if ((p != null) && p.overlapsPoint(mouse)) {
						s = p;
						break;
					}
				}
				if (s != null) setSelected(s);
			} else if (FlxG.keys.justPressed("N")) {
				var n:D03_Point = new D03_Point();
				n.move(mouse.x, mouse.y);
				add(n);
				path.addPoint(n.point, true);
				setSelected(n);
			}
			super.update();
		}
		
		private function setSelected(p:D03_Point):void
		{
			selected.frame = D03_Point.UNSELECTED;
			selected = p;
			selected.frame = D03_Point.SELECTED;
		}
		
	}

}