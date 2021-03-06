

import openfl.display.Sprite;
import openfl.display3D.Context3DRenderMode;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import starling.core.Starling;
import starling.events.ResizeEvent;
import utils.StageUtil;

/**
	 * This is the main class of the project.
	 *
	 * @author Galib Imtiaz
	 *
	 */
class HungryHero extends Sprite
{
	
	
	private var starling:Starling;
	public var stageUtil:StageUtil;
	
	
	public function new () {
		
		super ();
		
		stageUtil = new StageUtil(stage);
		starling = new Starling (Game, stage,null,null,Context3DRenderMode.AUTO);
		
		
		starling.stage.addEventListener(ResizeEvent.RESIZE, onResize);
		starling.showStats = true;

        var w:Int = stage.stageWidth;
        var h:Int = stage.stageHeight;
        starling.viewPort = new Rectangle(0, 0, w, h);
        var size:Point = stageUtil.getScaledStageSize(w, h);

        starling.stage.stageWidth = cast size.x;
        starling.stage.stageHeight = cast size.y;

        starling.start();
    }

    private function onResize(event:ResizeEvent):Void
    {
        starling.viewPort = new Rectangle(0, 0, event.width, event.height);

        var size:Point = stageUtil.getScaledStageSize(event.width, event.height);

        starling.stage.stageWidth = cast size.x;
        starling.stage.stageHeight = cast size.y;
    }
}
