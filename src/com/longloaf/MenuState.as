package com.longloaf 
{
	import com.longloaf.d01_sprite.D01;
	import com.longloaf.d02_collision.D02;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * Главное меню. Содержит список демонстраций.
	 * @author Maksim Soldatov
	 */
	public class MenuState extends FlxState
	{
		
		private var demos:Vector.<DemoData> = Vector.<DemoData>([
		new DemoData("SPRITE", D01),
		new DemoData("COLLISION", D02)]);
		
		override public function create():void 
		{
			for (var i:int = 0; i < demos.length; ++i) {
				var d:DemoData = demos[i];
				var b:DemoButton = new DemoButton(10, 10 + i * 20, d.name, d.demoClass);
				add(b);
			}
		}
		
	}

}