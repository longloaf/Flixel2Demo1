package com.longloaf.d01_sprite 
{
	import com.longloaf.DemoHelp;
	import com.longloaf.DemoPrompt;
	import com.longloaf.DemoText;
	import flash.display.BlendMode;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D01 extends FlxState
	{
		
		private var group:FlxGroup;
		
		private var demoHelp:DemoHelp;
		
		private var numText:DemoText;
		
		private const COLORS:Vector.<uint> = Vector.<uint>([FlxG.WHITE, FlxG.RED, FlxG.GREEN, FlxG.BLUE]);
		private const BLEND_MODES:Vector.<String> = Vector.<String>([
		null,
		BlendMode.ADD,
		BlendMode.ALPHA,
		BlendMode.DARKEN,
		BlendMode.DIFFERENCE,
		BlendMode.ERASE,
		BlendMode.HARDLIGHT,
		BlendMode.INVERT,
		BlendMode.LAYER,
		BlendMode.LIGHTEN,
		BlendMode.MULTIPLY,
		BlendMode.NORMAL,
		BlendMode.OVERLAY,
		BlendMode.SCREEN,
		BlendMode.SHADER,
		BlendMode.SUBTRACT]);
		
		public var scale:Boolean = false;
		public var rotation:Boolean = false;
		public var antialiasing:Boolean = false;
		public var colorID:int = 0;
		public var blendModeID:int = 0;
		
		private var scaleText:DemoText;
		private var rotationText:DemoText;
		private var antialiasingText:DemoText;
		private var colorText:DemoText;
		private var blendModeText:DemoText;
		
		override public function create():void 
		{
			group = new FlxGroup();
			add(group);
			
			demoHelp = new DemoHelp();
			demoHelp.addText("K(1..3) - add 10^(K-1) sprites");
			numText = demoHelp.addText();
			demoHelp.addVSpace();
			scaleText = demoHelp.addText();
			rotationText = demoHelp.addText();
			antialiasingText = demoHelp.addText();
			colorText = demoHelp.addText();
			blendModeText = demoHelp.addText();
			add(demoHelp);
			updateText();
			
			add(new DemoPrompt("01"));
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
				updateNumText();
			}
			if (FlxG.keys.justPressed("S")) {
				scale = !scale;
				updateScaleText();
			}
			if (FlxG.keys.justPressed("A")) {
				antialiasing = !antialiasing;
				updateAntialiasingText();
			}
			if (FlxG.keys.justPressed("R")) {
				rotation = !rotation;
				updateRotationText();
			}
			if (FlxG.keys.justPressed("C")) {
				colorID = (colorID + 1) % COLORS.length;
				updateColorText();
			}
			if (FlxG.keys.justPressed("B")) {
				blendModeID = (blendModeID + 1) % BLEND_MODES.length;
				updateBlendModeText();
			}
			
			super.update();
		}
		
		private function addSprites(n:int):void
		{
			for (var i:int = 0; i < n; ++i) {
				var s:D01_Sprite = new D01_Sprite(this);
				s.reset(FlxG.random() * FlxG.width, FlxG.random() * FlxG.height);
				group.add(s);
			}
		}
		
		private function updateNumText():void
		{
			numText.text = "Num: " + group.length;
		}
		
		private function updateScaleText():void
		{
			scaleText.text = "[S] Scale: " + scale;
		}
		
		private function updateRotationText():void
		{
			rotationText.text = "[R] Rotation: " + rotation;
		}
		
		private function updateAntialiasingText():void
		{
			antialiasingText.text = "[A] Antialiasing: " + antialiasing;
		}
		
		private function updateColorText():void
		{
			colorText.text = "[C] Color: " + COLORS[colorID].toString(16);
		}
		
		private function updateBlendModeText():void
		{
			blendModeText.text = "[B] Blend mode: " + BLEND_MODES[blendModeID];
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