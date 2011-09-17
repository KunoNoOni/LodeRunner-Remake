package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			var logo:FlxText = new FlxText(FlxG.width*0.5-240,200, 500, "Lode Runner Clone");
			logo.setFormat(null,40,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-200,420, 400, "PRESS [x] TO START");
			instruct.setFormat(null,20,0xFF0000, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}