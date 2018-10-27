package com.twiined.hungryHero.ui;

import flash.display.BitmapData;
import starling.display.Button;
import starling.display.Image;
import starling.events.Event;
import starling.textures.Texture;

/**
	 * This class is the pause button for the in-game screen.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class PauseButton extends Button
{
    /** Pause button image. */
    private var pauseImage : Image;
	private var pausebtn:Texture;
    
    public function new()
    {
		pausebtn = Assets.instance.manager.getTexture("pauseButton");
        super(Texture.fromBitmapData(new BitmapData(cast(pausebtn.width,Int), cast(pausebtn.height,Int), true, 0)));
        
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
        
        // Pause Image
        pauseImage = new Image(pausebtn);
        this.addChild(pauseImage);
    }
}
