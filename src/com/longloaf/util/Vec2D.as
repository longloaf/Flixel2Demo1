package com.longloaf.util 
{
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Vec2D 
	{
		private static var tmp:Vec2D = new Vec2D();
		
		public static function dist(v1:Vec2D, v2:Vec2D):Number
		{
			tmp.diff(v1, v2);
			return tmp.mag();
		}
		
		public static function distSq(v1:Vec2D, v2:Vec2D):Number
		{
			tmp.diff(v1, v2);
			return tmp.magSq();
		}
		
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function Vec2D(x_:Number = 0, y_:Number = 0) 
		{
			setxy(x_, y_);
		}
		
		public function copy():Vec2D
		{
			return new Vec2D(x, y);
		}
		
		public function setxy(x_:Number, y_:Number):void
		{
			x = x_;
			y = y_;
		}
		
		// Устанавливает угол и длину вектора.
		public function setam(a:Number, m:Number):void
		{
			fromAngle(a);
			mult(m);
		}
		
		public function clear():void
		{
			setxy(0, 0);
		}
		
		public function assign(v:Vec2D):void
		{
			setxy(v.x, v.y)
		}
		
		public function diff(v1:Vec2D, v2:Vec2D):void
		{
			assign(v2);
			sub(v1);
		}
		
		public function mag():Number
		{
			return Math.sqrt(magSq());
		}
		
		public function magSq():Number
		{
			return x * x + y * y;
		}
		
		public function add(v:Vec2D):void
		{
			x += v.x;
			y += v.y;
		}
		
		public function sub(v:Vec2D):void
		{
			x -= v.x;
			y -= v.y;
		}
		
		public function mult(n:Number):void
		{
			x *= n;
			y *= n;
		}
		
		public function div(n:Number):void
		{
			x /= n;
			y /= n;
		}
		
		public function normalize():void
		{
			var m:Number = mag();
			if ((m != 0) && (m != 1)) {
				div(m);
			}
		}
		
		public function limit(max:Number):void {
			if (magSq() > (max * max)) {
				setMag(max);
			}
		}
		
		public function setMag(len:Number):void
		{
			normalize();
			mult(len);
		}
		
		public function fromAngle(ang:Number):void
		{
			x = Math.cos(ang);
			y = Math.sin(ang);
		}
		
		public function angle():Number
		{
			return Math.atan2(y, x);
		}
		
		public function rotate(ang:Number):void
		{
			var c:Number = Math.cos(ang);
			var s:Number = Math.sin(ang);
			var tmpx:Number = x;
			x = x * c - y * s;
			y = tmpx * s + y * c;
		}
		
	}

}