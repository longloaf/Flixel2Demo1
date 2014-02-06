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
		
		private var edges:FlxSprite;
		private var pointGroup:FlxGroup;
		
		private var mouse:FlxPoint;
		private var mouseOffset:FlxPoint;
		private var drag:Boolean;
		
		public function D03_PointGroup() 
		{
			edges = new FlxSprite();
			edges.makeGraphic(FlxG.width, FlxG.height, 0, true);
			add(edges);
			
			pointGroup = new FlxGroup();
			add(pointGroup);
			
			path = new FlxPath();
			
			selected = new D03_Point();
			selected.prev = selected.next = selected;
			selected.move(FlxG.width / 2, FlxG.height / 2);
			selected.frame = D03_Point.SELECTED;
			pointGroup.add(selected);
			
			path.addPoint(selected.point, true);
			
			mouse = new FlxPoint();
			mouseOffset = new FlxPoint();
			drag = false;
		}
		
		override public function update():void 
		{
			mouse.make(FlxG.mouse.x, FlxG.mouse.y);
			
			if (FlxG.mouse.justPressed()) {
				var s:D03_Point = null;
				for (var i:int = pointGroup.length - 1; i >= 0; --i) {
					var p:D03_Point = pointGroup.members[i] as D03_Point;
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
			} else {
				if (FlxG.keys.justPressed("N")) {
					addPoint(mouse.x, mouse.y);
				} else if (FlxG.keys.justPressed("R")) {
					removeSelected();
				}
			}
			
			super.update();
			
			edges.fill(0);
			var temp:D03_Point = selected;
			do {
				edges.drawLine(temp.point.x, temp.point.y, temp.next.point.x, temp.next.point.y, 0x30FFFFFF, 1);
				temp = temp.next;
			} while (temp != selected);
		}
		
		private function setSelected(p:D03_Point):void
		{
			selected.prev.frame = D03_Point.UNSELECTED;
			selected.next.frame = D03_Point.UNSELECTED;
			selected.frame = D03_Point.UNSELECTED;
			selected = p;
			selected.prev.frame = D03_Point.PREV;
			selected.next.frame = D03_Point.NEXT;
			selected.frame = D03_Point.SELECTED;
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
			pointGroup.add(p);
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
		
		private function at(s1:FlxSprite, s2:FlxSprite):void {
			s1.x = s2.x + (s2.width - s1.width) / 2;
			s1.y = s2.y + (s2.height - s1.height) / 2;
		}
		
	}

}