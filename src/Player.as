package 
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{	
		public function Player()
		{
			super(Registry.startX*20, Registry.startY*20);
			loadGraphic(Registry._player,true,true,20,20);
			addAnimation("standing",[0],15);
			addAnimation("running",[0,1,2],15,true);
			addAnimation("rope",[3,4,5],15,true);
			addAnimation("ropeIdle",[3],15);
			addAnimation("pFalling",[6],15);
			addAnimation("pClimbing",[7,8],15,true);
			addAnimation("ladderIdle",[7],15);
			
			//this.maxVelocity.x = 50;
			//this.maxVelocity.y = 50;
			this.acceleration.y = 1000;
			//this.drag.x = this.maxVelocity.x*4;

		}
		
		override public function update():void
		{
			//this.acceleration.x = 0;
			//this.velocity.y = 0;
			this.velocity.x = 0;
			this.velocity.y = 0;
			
		 	if(FlxG.keys.A || FlxG.keys.LEFT)
			{
				if(Registry.onRope)
				{
					this.facing = LEFT;
					this.play("rope");
					//this.acceleration.x = -this.maxVelocity.x*4;
					this.velocity.x -= 50
				}
				else
				{
					this.facing = LEFT;
					this.play("running");
					//this.acceleration.x = -this.maxVelocity.x*4;
					this.velocity.x -= 50
				}
				
				//Registry.onRope = false;
			}
			else if(FlxG.keys.D || FlxG.keys.RIGHT)
			{
				if(Registry.onRope)
				{
					this.facing = RIGHT;
					this.play("rope");
					//this.acceleration.x = this.maxVelocity.x*4;
					this.velocity.x += 50
				}
				else
				{
					this.facing = RIGHT;
					this.play("running");
					//this.acceleration.x = this.maxVelocity.x*4;
					this.velocity.x += 50
				}
				
				//Registry.onRope = false;

			}
			else if(FlxG.keys.W || FlxG.keys.UP  && Registry.onLadder)
			{
				Registry.onLadder = false;
				this.play("pClimbing");
				this.acceleration.y = 0;
				this.velocity.y -= 50
				
			}
			else if(FlxG.keys.D || FlxG.keys.DOWN)
			{
				if(Registry.onLadder)
				{
					this.play("pClimbing");
					this.velocity.y += 50
					this.acceleration.y = 0;
					Registry.onLadder = false;			
				}
				
				if(Registry.onRope)
				{
					Registry.onRope = false;
					//this.play("pFalling");
					this.velocity.y += 500;
				}
			}
			else if(Registry.onLadder)
				this.play("ladderIdle");
			else if(Registry.onRope)
				this.play("ropeIdle");
			else			
				this.play("standing");

			super.update();
		}
		
	}
}