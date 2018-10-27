package com.twiined.hungryHero.gameElements;

import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;

/**
	 * This class is the hero character.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class Hero extends Sprite
{
    public var state(get, set) : Int;

    /** Hero character animation. */
    private var heroArt : MovieClip;
    
    /** State of the hero. */
    private var _state : Int;
    
    public function new()
    {
        super();
        
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
        
        // Set the game state to idle.
        this.state = GameConstants.GAME_STATE_IDLE;
        
        // Initialize hero art and hit area.
        createHeroArt();
    }
    
    /**
		 * Create hero art/visuals. 
		 * 
		 */
    private function createHeroArt() : Void
    {
        heroArt = new MovieClip(Assets.instance.manager.getTextures("fly_"), 20);
        heroArt.x = Math.ceil(-heroArt.width / 2);
        heroArt.y = Math.ceil(-heroArt.height / 2);
        Starling.current.juggler.add(heroArt);
        this.addChild(heroArt);
    }
    
    /**
		 * State of the hero. 
		 * @return 
		 * 
		 */
    private function get_state() : Int
    {
        return _state;
    }
    private function set_state(value : Int) : Int
    {
        _state = value;
        return value;
    }
    
    /**
		 * Set hero animation speed. 
		 * @param speed
		 * 
		 */
    public function setHeroAnimationSpeed(speed : Int) : Void
    {
        if (speed == 0)
        {
            heroArt.fps = 20;
        }
        else
        {
            heroArt.fps = 60;
        }
    }
    
    override private function get_width() : Float
    {
        if (heroArt != null)
        {
            return heroArt.texture.width;
        }
        else
        {
            return Math.NaN;
        }
    }
    
    override private function get_height() : Float
    {
        if (heroArt != null)
        {
            return heroArt.texture.height;
        }
        else
        {
            return Math.NaN;
        }
    }
}
