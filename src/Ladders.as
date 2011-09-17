package
{
	import org.flixel.*;
	
	public class Ladders extends FlxSprite
	{
				
		public function Ladders(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._ladder,false,false,20,20);
		}
	}
}