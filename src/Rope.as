package
{
	import org.flixel.*;
	
	public class Rope extends FlxSprite
	{
		
		public function Rope(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._rope,false,false,20,20);
		}
	}
}
