package com.longloaf.util 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class SprTrace extends FlxSprite
	{
		private var v:Vector.<SprTraceData> = new Vector.<SprTraceData>();
		
		private const DH:Number = 0.1;
		private const S:Number = 1;
		private const B:Number = 0.8;
		private const A:Number = 1;
		
		private var bgColor:uint;
		
		public function SprTrace(bgCol:uint = 0xFF000000)
		{
			bgColor = bgCol;
			makeGraphic(FlxG.width, FlxG.height, bgColor, true);
		}
		
		public function addSpr(s:FlxSprite, lCol:uint = 0):void
		{
			v.push(new SprTraceData(s, lCol));
		}
		
		override public function update():void 
		{
			var col:uint;
			for each (var d:SprTraceData in v) {
				d.spr.getMidpoint(d.p1);
				if (d.p2 == null) {
					d.p2 = new FlxPoint();
					d.p2.copyFrom(d.p1);
				}
				if (d.lineCol == 0) {
					col = FlxU.makeColorFromHSB(d.h, S, B, A);
					d.h += DH;
					d.h %= 360;
				} else {
					col = d.lineCol;
				}
				drawLine(d.p1.x, d.p1.y, d.p2.x, d.p2.y, col, 1);
				d.p2.copyFrom(d.p1);
			}
		}
		
		public function clear():void
		{
			fill(bgColor);
		}
		
	}

}