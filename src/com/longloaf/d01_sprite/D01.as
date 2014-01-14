package com.longloaf.d01_sprite 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import flash.display.BlendMode;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * Демонстрация возможностей класса FlxSprite.
	 * @author Maksim Soldatov
	 */
	public class D01 extends FlxState
	{
		[Embed(source = "bg.png")]
		private static const BG:Class;
		
		private var bg:FlxSprite;
		
		private var group:FlxGroup;
		
		private var help:DemoHelp;
		
		private var colorID:int;
		private const COLORS:Vector.<uint> = Vector.<uint>([
		FlxG.WHITE,
		FlxG.RED,
		FlxG.GREEN,
		FlxG.BLUE,
		FlxG.PINK]);
		
		private var blendModeID:int;
		private const BLEND_MODES:Vector.<String> = Vector.<String>([
		null,
		BlendMode.ADD,
		BlendMode.DARKEN,
		BlendMode.DIFFERENCE,
		BlendMode.HARDLIGHT,
		BlendMode.INVERT,
		BlendMode.LIGHTEN,
		BlendMode.MULTIPLY,
		BlendMode.OVERLAY,
		BlendMode.SCREEN,
		BlendMode.SUBTRACT]);
		
		private var spriteSettings:D01_SpriteSettings;
		
		private var numText:DemoText;
		private var scaleText:DemoText;
		private var rotationText:DemoText;
		private var antialiasingText:DemoText;
		private var colorText:DemoText;
		private var blendModeText:DemoText;
		
		override public function create():void 
		{
			bg = new FlxSprite(0, 0, BG);
			
			spriteSettings = new D01_SpriteSettings();
			spriteSettings.scale = false;
			spriteSettings.rotation = false;
			spriteSettings.antialiasing = false;
			colorID = 0;
			spriteSettings.color = COLORS[colorID];
			blendModeID = 0;
			spriteSettings.blendMode = BLEND_MODES[blendModeID];
			
			group = new FlxGroup();
			
			help = new DemoHelp();
			help.addText("K[1..3] - add 10^(K-1) sprites");
			numText = help.addText();
			help.addVSpace();
			scaleText = help.addText();
			rotationText = help.addText();
			antialiasingText = help.addText();
			colorText = help.addText();
			blendModeText = help.addText();
			help.addVSpace();
			help.addText("[X] - clear");
			updateText();
			
			add(bg);
			add(group);
			add(help);
			add(new DemoPrompt("01"));
			
			addSprites(100);
		}
		
		override public function update():void
		{
			var n:int = 0;
			if (FlxG.keys.justPressed("ONE")) {
				n = 1;
			} else if (FlxG.keys.justPressed("TWO")) {
				n = 10;
			} else if (FlxG.keys.justPressed("THREE")) {
				n = 100;
			}
			if (n > 0) {
				addSprites(n);
			}
			if (FlxG.keys.justPressed("S")) {
				spriteSettings.scale = !spriteSettings.scale;
				updateScaleText();
			}
			if (FlxG.keys.justPressed("A")) {
				spriteSettings.antialiasing = !spriteSettings.antialiasing;
				updateAntialiasingText();
			}
			if (FlxG.keys.justPressed("R")) {
				spriteSettings.rotation = !spriteSettings.rotation;
				updateRotationText();
			}
			if (FlxG.keys.justPressed("C")) {
				colorID = (colorID + 1) % COLORS.length;
				spriteSettings.color = COLORS[colorID];
				updateColorText();
			}
			if (FlxG.keys.justPressed("B")) {
				blendModeID = (blendModeID + 1) % BLEND_MODES.length;
				spriteSettings.blendMode = BLEND_MODES[blendModeID];
				updateBlendModeText();
			}
			if (FlxG.keys.justPressed("X")) {
				group.clear();
				updateNumText();
			}
			
			super.update();
		}
		
		private function addSprites(n:int):void
		{
			for (var i:int = 0; i < n; ++i) {
				group.add(new D01_Sprite(spriteSettings));
			}
			updateNumText();
		}
		
		private function updateNumText():void
		{
			numText.text = "Num: " + group.length;
		}
		
		private function updateScaleText():void
		{
			scaleText.text = "[S] Scale: " + spriteSettings.scale;
		}
		
		private function updateRotationText():void
		{
			rotationText.text = "[R] Rotation: " + spriteSettings.rotation;
		}
		
		private function updateAntialiasingText():void
		{
			antialiasingText.text = "[A] Antialiasing: " + spriteSettings.antialiasing;
		}
		
		private function updateColorText():void
		{
			colorText.text = "[C] Color: 0x" + spriteSettings.color.toString(16);
		}
		
		private function updateBlendModeText():void
		{
			blendModeText.text = "[B] Blend mode: " + spriteSettings.blendMode;;
		}
		
		private function updateText():void
		{
			updateNumText();
			updateScaleText();
			updateRotationText();
			updateAntialiasingText();
			updateColorText();
			updateBlendModeText();
		}
		
	}

}