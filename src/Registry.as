package
{
	import org.flixel.*;

	public class Registry
	{
		public static var exit:Array = new Array();
		public static var goldBags:int = 0;
		public static var goldBagsGotten:int = 0;
		public static var score:int = 0;
		public static var lives:int = 5;
		public static var currLvl:int = 1;
		public static var startX:int = 0;
		public static var startY:int = 0;
		public static var startFacing:int = 0;
		public static var onLadder:Boolean = false;
		public static var inAir:Boolean = false;
		public static var onRope:Boolean = false;
		public static var theTile:Number = 0;
		
		[Embed(source = 'Sprites/buildtile.png')] static public var _buildTile:Class;
		[Embed(source = 'Sprites/block.png')] static public var _brick:Class;
		[Embed(source = 'Sprites/solidBlock.png')] static public var _solidBrick:Class;
		[Embed(source = 'Sprites/player.png')] static public var _player:Class;
		[Embed(source = 'Sprites/enemy.png')] static public var _enemy:Class;
		[Embed(source = 'Sprites/ladder.png')] static public var _ladder:Class;
		[Embed(source = 'Sprites/rope.png')] static public var _rope:Class;
		[Embed(source = 'Sprites/exitLadder.png')] static public var _exitLadder:Class;
		[Embed(source = 'Sprites/goldBag.png')] static public var _goldBag:Class;
		
		
		
		
		public function Registry()
		{
		}
	}
}