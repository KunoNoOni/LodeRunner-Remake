package
{
	import org.flixel.*;
	import org.flixel.system.FlxTile;
		
	public class PlayState extends FlxState
	{
		private var data:Array;
		public var level:FlxTilemap;
		private var Hero:Player;
		private var ladders:FlxGroup = new FlxGroup();
		private var ladder:Ladders;
		private var goldBags:FlxGroup = new FlxGroup();
		private var goldBag:GoldBags;
		private var ropes:FlxGroup = new FlxGroup();
		private var rope:Rope;
		private var enemies:FlxGroup= new FlxGroup();
		private var enemy:Enemy;
		private var assetX:Number = 0;
		private var assetY:Number = 0;
		private var score:FlxText;
		private var men:FlxText;		
		private var lvl:FlxText;
		private var gridX:Number;
		private var gridY:Number;
		
		override public function create():void
		{
				data = new Array(
					1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
					1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
					1,8,0,0,0,0,0,0,0,0,0,0,5,0,0,0,9,9,9,9,9,9,9,0,0,5,0,9,9,9,9,9,9,9,9,9,9,9,9,1,
					1,8,0,0,0,0,8,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,8,1,
					1,8,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,8,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,8,0,7,0,0,8,0,0,0,0,0,0,0,0,0,7,0,0,7,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,0,5,7,9,9,9,9,9,9,9,9,9,9,7,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,8,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,8,1,1,1,8,0,0,0,0,0,0,0,0,0,8,1,
					1,0,0,8,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,8,1,1,1,1,8,0,0,0,0,0,0,0,0,8,1,
					1,0,7,8,1,1,1,0,0,0,0,0,0,0,0,1,1,1,7,0,7,0,0,1,8,1,1,1,1,1,1,1,1,1,1,8,0,0,8,1,
					1,8,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,8,1,0,7,7,0,7,0,7,0,1,1,8,0,8,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,0,1,1,8,1,8,1,8,1,1,8,0,8,1,
					1,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,0,0,0,8,0,8,0,8,0,0,8,0,8,1,
					1,8,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,8,1,0,0,0,8,0,8,0,8,0,0,8,0,8,1,
					1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
			
			//Create a new tilemap using our level data
			level = new FlxTilemap();
			removeExit(); //remove exit ladder
			removePlayer(); //remove player from field
			removeLadders();
			removeRope();
			removeEnemies();
			removeGold(); //remove and count how many gold bags there are
			level.loadMap(FlxTilemap.arrayToCSV(data,40),Registry._buildTile,20,20);
			add(level);
			showHud(); //display text at bottom of screen
			
			//add the player to the field
			Hero = new Player;
			add(Hero);
		}

		private function removeExit():void
		{
			for(var i:int=0;i<data.length;i++)
				if(data[i]==10)
				{
					Registry.exit[i]=10;
					data[i]=0;
				}
		}
		
		private function removePlayer():void
		{
			for(var l:int=0;l<data.length;l++)
				if(data[l]==3)
				{
					Registry.startX = l%40;
					Registry.startY = Math.floor(l/40);
					Registry.startFacing = data[l];
					data[l]=0;
				}
				else if(data[l]==4)
				{
					Registry.startX = l%40;
					Registry.startY = Math.floor(l/40);
					Registry.startFacing = data[l];
					data[l]=0;
				}
		}
		
		private function removeLadders():void
		{
			for(var m:int=0;m<data.length;m++)
				if(data[m]==8)
				{
					assetX = m%40;
					assetY = Math.floor(m/40);
					ladder = new Ladders(assetX,assetY);
					ladders.add(ladder);
					add(ladder);
					data[m]=0;
				}	
			//level.setTileProperties(8,FlxObject.NONE);
			//level.setTileProperties(8,FlxObject.LEFT,canClimb,Player,1);

		}
		
		private function removeRope():void
		{
			for(var n:int=0;n<data.length;n++)
				if(data[n]==9)
				{
					assetX = n%40;
					assetY = Math.floor(n/40);
					rope = new Rope(assetX,assetY);
					ropes.add(rope);
					add(rope);
					data[n]=0;
				}	
		}
		
		private function removeEnemies():void
		{
			for(var o:int=0;o<data.length;o++)
				if(data[o]==5)
				{
					data[o]=0;
					/*assetX = o%40;
					assetY = Math.floor(o/40);
					enemy = new Enemy(assetX,assetY);
					enemies.add(enemy);
					add(enemy)*/
					//Registry.startFacing = data[o];
				}
				else if(data[o]==6)
				{
					data[o]=0;					
					/*assetX = o%40;
					assetY = Math.floor(o/40);
					enemy = new Enemy(assetX,assetY);
					enemies.add(enemy);
					add(enemy)*/
					//Registry.startFacing = data[o];
				}
		}
		
		private function removeGold():void
		{
			for(var j:int=0;j<data.length;j++)
				if(data[j]==7)
				{
					Registry.goldBags +=1;
					assetX = j%40;
					assetY = Math.floor(j/40);
					goldBag = new GoldBags(assetX,assetY);
					goldBags.add(goldBag);
					add(goldBag);
					data[j]=0;
				}
		}
		
		private function showHud():void
		{
			score = new FlxText(0,610,300,"SCORE: "+Registry.score);
			score.setFormat(null,25,0xFFFFFF);
			add(score);
			
			men = new FlxText(350,610,300,"MEN: "+Registry.lives);
			men.setFormat(null,25,0xFFFFFF);
			add(men)
			
			lvl = new FlxText(600,610,300,"LEVEL: "+Registry.currLvl);
			lvl.setFormat(null,25,0xFFFFFF);
			add(lvl)
		}
		
		private function addExit():void
		{			
			if(Registry.goldBagsGotten == Registry.goldBags)
			{
				for(var k:int=0;k<data.length;k++)
					if(Registry.exit[k]==10)
					{
						assetX = k%40;
						assetY = Math.floor(k/40);;
						level.setTile(assetX,assetY,10,true);
					}
			}
		}
	
		override public function update():void
		{
			/*if(FlxG.keys.justPressed("C"))
			{
				Registry.goldBagsGotten = Registry.goldBags;
				addExit();
			}*/
			Registry.onLadder = false;
			Registry.onRope = false;
			gridX = FlxU.floor(Hero.x/20);
			gridY = FlxU.floor(Hero.y/20);
			FlxG.overlap(Hero,ladders,canClimb);
			//trace("gridX = "+gridX+" gridY = "+gridY+" Tile = "+level.getTile(gridX,gridY));
			FlxG.overlap(Hero,goldBags,getGold);
			FlxG.overlap(Hero,ropes,useRope);
			FlxG.overlap(Hero,enemies,captured);
			if(Hero.isTouching(FlxObject.DOWN)) //&& !Registry.onLadder && !Registry.onRope)  
			{
				Hero.velocity.y = 50;
				//Hero.play("pFalling");
			}			
			super.update();
			
			FlxG.collide(level, Hero);
		}
		
		private function canClimb(p:FlxSprite, l:FlxSprite):void //t:FlxTile, o:FlxObject 
		{
			Registry.onLadder = true;
		}
		
		private function getGold(p:FlxSprite, g:FlxSprite):void
		{
			Registry.score += 100;
			g.kill();
			score.text = "SCORE: "+Registry.score;
		}
		
		private function useRope(p:FlxSprite, r:FlxSprite):void
		{
			Registry.onRope = true;
		}
		
		private function captured(p:FlxSprite, e:FlxSprite):void
		{
			Registry.lives -= 1;
			p.kill();
			men.text = "MEN: "+Registry.lives
		}
	}
}