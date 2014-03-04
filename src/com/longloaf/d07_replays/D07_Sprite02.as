package com.longloaf.d07_replays 
{
	import com.longloaf.util.Vec2D;
	import com.longloaf.util.Veh;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D07_Sprite02 extends FlxSprite
	{
		
		private var veh:Veh = new Veh;
		
		public function D07_Sprite02(sx:Number, sy:Number) 
		{
			makeGraphic(10, 10, 0x30FFFFFF);
			visible = false;
			veh.reset(new Vec2D(sx, sy));
			updXY();
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.pressed()) {
				veh.goal.setxy(FlxG.mouse.x, FlxG.mouse.y);
			}
			veh.update();
			updXY();
		}
		
		private function updXY():void
		{
			x = veh.loc.x - width / 2;
			y = veh.loc.y - height / 2;
		}
		
	}

}