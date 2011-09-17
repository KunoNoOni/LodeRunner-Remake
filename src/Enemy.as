package
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		
		public function Enemy(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._enemy,true,true,20,20);
			addAnimation("estanding",[0],15);
			addAnimation("erunning",[0,1,2],15,true);
			addAnimation("erope",[3,4,5],15,true);
			addAnimation("eFalling",[6],15);
			addAnimation("eClimbing",[7,8],15,true);
		}
		
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
			this.play("estanding");
			
			super.update();
		}
	}
}