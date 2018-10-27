package com.twiined.hungryHero.ui;

import flash.display.BitmapData;
import starling.core.Starling;
import starling.display.Button;
import starling.display.Image;
import starling.display.MovieClip;
import starling.events.Event;
import starling.textures.Texture;

/**
	 * This class is the sound/mute button.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class SoundButton extends Button
{
    /** Animation shown when sound is playing.  */
    private var mcUnmuteState : MovieClip;
    
    /** Image shown when the sound is muted. */
    private var imageMuteState : Image;
	
	private var soundOff : Texture;
    
    public function new()
    {
		soundOff = Assets.instance.manager.getTexture("soundOff");
        super(Texture.fromBitmapData(new BitmapData(cast((soundOff.width),Int), cast((soundOff.height),Int), true, 0)));
        
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
        
        setButtonTextures();
        showUnmuteState();
    }
    
    /**
		 * Set textures for button states. 
		 * 
		 */
    private function setButtonTextures() : Void
    {
        // Normal state - image
        mcUnmuteState = new MovieClip(Assets.instance.manager.getTextures("soundOn"), 3);
        Starling.current.juggler.add(mcUnmuteState);
        this.addChild(mcUnmuteState);
        
        // Selected state - animation
        imageMuteState = new Image(soundOff);
        this.addChild(imageMuteState);
    }
    
    /**
		 * Show Off State - Show the mute symbol (sound is muted). 
		 * 
		 */
    public function showUnmuteState() : Void
    {
        mcUnmuteState.visible = true;
        imageMuteState.visible = false;
    }
    
    /**
		 * Show On State - Show the unmute animation (sound is playing). 
		 * 
		 */
    public function showMuteState() : Void
    {
        mcUnmuteState.visible = false;
        imageMuteState.visible = true;
    }
}
