package com.longloaf.d03_path 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D03_PointGroup extends FlxGroup
	{
		public var path:FlxPath;
		
		private var selected:D03_Point;
		
		private var prevSpr:FlxSprite;
		private var nextSpr:FlxSprite;
		
		private var mouse:FlxPoint;
		private var mouseOffset:FlxPoint;
		private var drag:Boolean;
		
		public function D03_PointGroup() 
		{
			path = new FlxPath();
			
			prevSpr = new FlxSprite();
			prevSpr.makeGraphic(30, 30, 0x40FF0000);
			add(prevSpr);
			
			nextSpr = new FlxSprite();
			nextSpr.makeGraphic(40, 40, 0x4000FF00);
			add(nextSpr);
			
			selected = new D03_Point();
			selected.prev = selected.next = selected;
			selected.move(FlxG.width / 2, FlxG.height / 2);
			add(selected);
			
			path.addPoint(selected.point, true);
			
			mouse = new FlxPoint();
			mouseOffset = new FlxPoint();
			drag = false;
			
			updatePrevNext();
		}
		
		override public function update():void 
		{
			mouse.make(FlxG.mouse.x, FlxG.mouse.y);
			var id:int;
			if (FlxG.mouse.justPressed()) {
				var s:D03_Point = null;
				for (var i:int = length - 1; i >= 0; --i) {
					var p:D03_Point = members[i] as D03_Point;
					if ((p != null) && p.overlapsPoint(mouse)) {
						s = p;
						break;
					}
				}
				if (s != null) {
					setSelected(s);
					mouseOffset.make(mouse.x - selected.point.x, mouse.y - selected.point.y);
					drag = true;
				}
			} else if (!FlxG.mouse.pressed()) {
				drag = false;
			}
			
			if (drag) {
				selected.move(mouse.x - mouseOffset.x, mouse.y - mouseOffset.y);
				updatePrevNext();
			} else {
				if (FlxG.keys.justPressed("N")) {
					addPoint(mouse.x, mouse.y);
				} else if (FlxG.keys.justPressed("R")) {
					removeSelected();
				}
			}
			
			super.update();
		}
		
		private function setSelected(p:D03_Point):void
		{
			selected.frame = D03_Point.UNSELECTED;
			selected = p;
			selected.frame = D03_Point.SELECTED;
			
			updatePrevNext();
		}
		
		private function selectedID():int
		{
			return path.nodes.indexOf(selected.point);
		}
		
		private function addPoint(px:Number, py:Number):void
		{
			var p:D03_Point = recycle(D03_Point) as D03_Point;
			p.reset(0, 0);
			p.move(px, py);
			p.prev = selected;
			p.next = selected.next;
			selected.next.prev = p;
			selected.next = p;
			path.addPointAt(p.point, selectedID() + 1, true);
			setSelected(p);
			add(p);
		}
		
		private function removeSelected():void
		{
			var p:D03_Point = selected.prev;
			var n:D03_Point = selected.next;
			if (n == selected) return;
			p.next = n;
			n.prev = p;
			path.remove(selected.point);
			selected.kill();
			setSelected(n);
		}
		
		private function updatePrevNext():void
		{
			at(prevSpr, selected.prev);
			at(nextSpr, selected.next);
		}
		
		private function at(s1:FlxSprite, s2:FlxSprite):void {
			s1.x = s2.x + (s2.width - s1.width) / 2;
			s1.y = s2.y + (s2.height - s1.height) / 2;
		}
		
	}

}