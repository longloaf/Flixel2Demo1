package com.longloaf.d08_debug 
{
	import org.flixel.FlxTileblock;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class D08_Door extends FlxTileblock
	{
		[Embed(source = "door_16x16.png")]
		private static const Img:Class;
		
		public function D08_Door(w:int) 
		{
			super(0, 0, D08.TILE_SIZE * w, D08.TILE_SIZE);
			loadTiles(Img, D08.TILE_SIZE, D08.TILE_SIZE);
		}
		
	}

}