package com.longloaf 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * Группа для вывода подсказок.
	 * @author Maksim Soldatov
	 */
	public class DemoHelp extends FlxGroup
	{
		private const TEXT_HEIGHT:Number = 14;
		private const VSPACE_HEIGHT:Number = 5;
		private var textY:Number = TEXT_HEIGHT + VSPACE_HEIGHT;
		
		private var bg:FlxSprite;
		private var bgMinScale:Number = TEXT_HEIGHT;
		private var bgMaxScale:Number = TEXT_HEIGHT;
		
		private var group:FlxGroup;
		
		private var helpText:FlxText;
		
		public function DemoHelp() 
		{
			bg = new FlxSprite();
			bg.makeGraphic(1, 1, 0xE0506080);
			bg.origin.x = bg.origin.y = 0;
			bg.scale.x = FlxG.width;
			bg.scale.y = bgMinScale;
			add(bg);
			
			group = new FlxGroup();
			group.visible = false;
			add(group);
			
			helpText = new DemoText(0, 0, FlxG.width, "F1 - HELP");
			helpText.color = 0xFFD8E0F0;//0xFF90FF90;
			add(helpText);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("F1")) {
				group.visible = !group.visible;
				updateBg();
			}
			super.update();
		}
		
		// Добавить текстовое поле.
		public function addText(s:String = "?"):DemoText
		{
			var text:DemoText = new DemoText(0, textY, FlxG.width, s);
			textY += TEXT_HEIGHT;
			bgMaxScale = textY;
			updateBg();
			group.add(text);
			return text;	
		}
		
		// Добавить вертикальный промежуток.
		public function addVSpace():void
		{
			textY += VSPACE_HEIGHT;
		}
		
		private function updateBg():void
		{
			if (group.visible) {
				bg.scale.y = bgMaxScale;
			} else {
				bg.scale.y = bgMinScale;
			}
		}
		
	}

}