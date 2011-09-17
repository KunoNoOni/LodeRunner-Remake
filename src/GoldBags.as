package
{
	import org.flixel.*;
	
	public class GoldBags extends FlxSprite
	{
		
		public function GoldBags(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._goldBag,false,false,6,20);
		}
	}
}