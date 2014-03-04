package com.longloaf.util 
{
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Veh 
	{
		public var loc:Vec2D = new Vec2D();
		public var vel:Vec2D = new Vec2D();
		public var goal:Vec2D = new Vec2D();
		
		private var tmpGoal:Vec2D = new Vec2D();
		private var v:Vec2D = new Vec2D();
		
		private var stop:Boolean = false;
		
		public var maxVel:Number = 10;// 20;
		public var minVel:Number = 2;
		
		public var maxDist:Number = 200;
		public var minDist:Number = 30;
		
		// Ускорение, с которым Veh движется к цели.
		public var moveAcc:Number = 2;
		// Ускорение, с которым Veh кружит вокруг цели.
		public var stopAcc:Number = 0.2;
		
		// Если Veh приблизился к цели на расстряние stopDist,
		// то считается, что он достиг ее и остановился.
		// Достигнув цели, Veh кружит вокруг нее,
		// двигаясь к случано выбранным не далеко от цели точкам.
		// Расстояние от этих точек до цели не более stopR.
		// Когда кружащий вокруг цели Veh приближается к случайной точке
		// на расстояние stopGoalDist, выбирается новая случайная точка.
		public var stopDist:Number = 30;
		public var stopR:Number = 10; // < stopDist
		public var stopGoalDist:Number = 5;
		
		private var ang:Number = 0;
		public var dang:Number = 0.3;
		public var moveK:Number = 0.2;// 0.3;
		
		public function reset(l:Vec2D):void
		{
			loc.assign(l);
			resetGoal(l);
			vel.clear();
		}
		
		public function resetGoal(g:Vec2D = null):void
		{
			if (g != null) goal.assign(g);
			stop = false;
		}
		
		public function update():void
		{
			var acc:Number;
			var vmag:Number;
			v.diff(loc, goal);
			var m:Number = v.mag();
			if (m <= stopDist) {
				if (!stop) {
					findStopGoal();
					stop = true;
				} else if (Vec2D.distSq(loc, tmpGoal) <= stopGoalDist * stopGoalDist) {
					findStopGoal();
				}
				acc = stopAcc;
			} else {
				stop = false;
				ang += Rnd.signum() * dang;
				tmpGoal.fromAngle(ang);
				tmpGoal.mult(m * moveK);
				tmpGoal.add(goal);
				acc = moveAcc;
			}
			
			v.diff(loc, tmpGoal);
			m = v.mag();
			if (m >= maxDist) {
				vmag = maxVel;
			} else if (m <= minDist) {
				vmag = minVel;
			} else {
				vmag = minVel + (maxVel - minVel) * (m - minDist) / (maxDist - minDist);
			}
			v.setMag(vmag);
			v.sub(vel);
			v.limit(acc);
			vel.add(v);
			loc.add(vel);
		}
		
		private function findStopGoal():void
		{
			tmpGoal.fromAngle(Rnd.angleRad());
			tmpGoal.mult(Rnd.rnd(stopR));
			tmpGoal.add(goal);
		}
		
		public function stopped():Boolean
		{
			return stop;
		}
		
	}

}