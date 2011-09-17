package
{
	import org.flixel.*;
	
	[SWF(width="800", height="640", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	
	public class LodeRunnerClone extends FlxGame
	{
		public function LodeRunnerClone()
		{
			super(800,640,MenuState,1);
		}
	}
}