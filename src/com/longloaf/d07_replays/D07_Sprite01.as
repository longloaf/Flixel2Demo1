package com.longloaf.d07_replays 
{
	import com.longloaf.util.Vec2D;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D07_Sprite01 extends FlxSprite
	{
		
		private var canvas:FlxSprite;
		
		private var vel:Vec2D = new Vec2D();
		private var acc:Vec2D = new Vec2D();
		private var drag:Vec2D = new Vec2D();
		
		public function D07_Sprite01() 
		{
			makeGraphic(20, 20, FlxU.makeColorFromHSB(200, 0.9, 0.9))
		}
		
		override public function update():void 
		{
		}
		
	}

}