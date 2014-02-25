package com.longloaf.d08_debug 
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxParticle;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Player extends FlxSprite
	{
		[Embed(source = "player_16x16_5.png")]
		private static const Img:Class;
		
		[Embed(source = "particle_10x10_3.png")]
		private static const ParticleImg:Class;
		
		[Embed(source = "death.mp3")]
		private static const DeathSound:Class;
		
		private var acc:Number = 500;
		private var floorDrag:Number = 500;
		private var _jumpVel:Number;
		
		private const STOP_ANIM:String = "stop";
		private const RUN_ANIM:String = "run";
		private const JUMP_ANIM:String = "jump";
		
		public var emitter:FlxEmitter;
		
		public function D08_Player() 
		{	
			loadGraphic(Img, true, true, 16, 16);
			addAnimation(STOP_ANIM, [0, 0, 1], 5);
			addAnimation(RUN_ANIM, [2, 3], 5);
			addAnimation(JUMP_ANIM, [4]);
			width = 8;
			offset.x = 4;
			height = 15;
			
			play(STOP_ANIM);
			
			maxVelX = 50;
			jumpVel = 150;
			maxVelocity.y = 300;
			acceleration.y = 500;
			
			emitter = new FlxEmitter(0, 0, 20);
			emitter.setSize(width, height);
			emitter.gravity = 300;
			emitter.setRotation(0, 0);
			var particleSpeed:Number = 150;
			emitter.setXSpeed( -particleSpeed, particleSpeed);
			emitter.setYSpeed( -particleSpeed, particleSpeed);
			for (var i:int = 0; i < emitter.maxSize; ++i) {
				var p:FlxParticle = new FlxParticle();
				//p.makeGraphic(10, 10, FlxU.makeColorFromHSB(0, 0, 0.9));;
				p.loadGraphic(ParticleImg, true, false, 10, 10);
				p.addAnimation("1", [0, 1, 2], 10);
				p.play("1");
				p.exists = false;
				emitter.add(p);
			}
		}
		
		override public function update():void 
		{
			acceleration.x = 0;
			if (FlxG.keys.LEFT) {
				acceleration.x -= acc;
				facing = LEFT;
			}
			if (FlxG.keys.RIGHT) {
				acceleration.x += acc;
				facing = RIGHT;
			}
			
			if (isTouching(FLOOR)) {
				drag.x = floorDrag;
				if (FlxG.keys.justPressed("UP")) {
					velocity.y -= _jumpVel;
				}
				if (acceleration.x != 0) {
					play(RUN_ANIM);
				} else {
					play(STOP_ANIM);
				}
			} else {
				drag.x = 0;
				play(JUMP_ANIM);
			}
		}
		
		public function set maxVelX(v:Number):void
		{
			maxVelocity.x = FlxU.bound(v, 10, 100);
		}
		
		public function get maxVelX():Number
		{
			return maxVelocity.x;
		}
		
		public function set jumpVel(v:Number):void
		{
			_jumpVel = FlxU.bound(v, 50, 300);
		}
		
		public function get jumpVel():Number
		{
			return _jumpVel;
		}
		
		override public function kill():void 
		{
			super.kill();
			
			FlxG.play(DeathSound);
			
			emitter.at(this);
			emitter.start(true, 5);
		}
	}

}