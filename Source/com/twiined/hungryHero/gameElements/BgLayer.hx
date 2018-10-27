package com.twiined.hungryHero.gameElements;
import starling.textures.Texture;
import starling.display.BlendMode;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

/**
	 * This class defines each of background layers used in the InGame screen.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class BgLayer extends Sprite
{
    public var parallaxDepth(get, set) : Float;

    /** Layer identification. */
    private var _layer : Int;
    
    /** Primary image. */
    private var image1 : Image;
    
    /** Secondary image. */
    private var image2 : Image;
    
    /** Parallax depth - used to decide speed of the animation. */
    private var _parallaxDepth : Float;
	
	private var texture:Texture;
    
    public function new(_layer : Int)
    {
        super();
        
        this._layer = _layer;
		texture = Assets.instance.manager.getTexture("bgLayer"+_layer);
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }
    
    /**
		 * On added to stage. 
		 * @param event
		 * 
		 */
    private function onAddedToStage(event : Event) : Void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        
        if (_layer == 1)
        {
            image1 = new Image(texture);
            image1.blendMode = BlendMode.NONE;
            image2 = new Image(texture);
            image2.blendMode = BlendMode.NONE;
        }
        else
        {
            image1 = new Image(texture);
            image2 = new Image(texture);
        }
        
        image1.x = 0;
        image1.y = stage.stageHeight - image1.height;
        
        image2.x = image2.width;
        image2.y = image1.y;
        
        this.addChild(image1);
        this.addChild(image2);
    }
    
    /**
		 * Parallax depth. 
		 * 
		 */
    private function get_parallaxDepth() : Float
    {
        return _parallaxDepth;
    }
    private function set_parallaxDepth(value : Float) : Float
    {
        _parallaxDepth = value;
        return value;
    }
}
