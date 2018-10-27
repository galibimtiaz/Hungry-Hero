package com.twiined.hungryHero.gameElements;

import starling.display.Sprite;
import starling.events.Event;

/**
	 * This class defines the whole InGame background containing multiple background layers.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class GameBackground extends Sprite
{
    public var gamePaused(get, set) : Bool;
    public var state(get, set) : Int;
    public var speed(get, set) : Float;

    /**
		 * Different layers of the background. 
		 */
    
    private var bgLayer1 : BgLayer;
    private var bgLayer2 : BgLayer;
    private var bgLayer3 : BgLayer;
    private var bgLayer4 : BgLayer;
    
    /** Current speed of animation of the background. */
    private var _speed : Float = 0;
    
    /** State of the game. */
    private var _state : Int;
    
    /** Game paused? */
    private var _gamePaused : Bool = false;
    
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
        
        bgLayer1 = new BgLayer(1);
        bgLayer1.parallaxDepth = 0.02;
        this.addChild(bgLayer1);
        
        bgLayer2 = new BgLayer(2);
        bgLayer2.parallaxDepth = 0.2;
        this.addChild(bgLayer2);
        
        bgLayer3 = new BgLayer(3);
        bgLayer3.parallaxDepth = 0.5;
        this.addChild(bgLayer3);
        
        bgLayer4 = new BgLayer(4);
        bgLayer4.parallaxDepth = 1;
        this.addChild(bgLayer4);
        
        // Start animating the background.
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }
    
    /**
		 * On every frame, animate each layer based on its parallax depth and hero's speed. 
		 * @param event
		 * 
		 */
    private function onEnterFrame(event : Event) : Void
    {
        if (!gamePaused)
        {
            // Background 1 - Sky
            bgLayer1.x -= Math.ceil(_speed * bgLayer1.parallaxDepth);
            // Hero flying left
            if (bgLayer1.x > 0)
            {
                bgLayer1.x = -stage.stageWidth;
            }
            // Hero flying right
            if (bgLayer1.x < -stage.stageWidth)
            {
                bgLayer1.x = 0;
            }
            
            // Background 2 - Hills
            bgLayer2.x -= Math.ceil(_speed * bgLayer2.parallaxDepth);
            // Hero flying left
            if (bgLayer2.x > 0)
            {
                bgLayer2.x = -stage.stageWidth;
            }
            // Hero flying right
            if (bgLayer2.x < -stage.stageWidth)
            {
                bgLayer2.x = 0;
            }
            
            // Background 3 - Buildings
            bgLayer3.x -= Math.ceil(_speed * bgLayer3.parallaxDepth);
            // Hero flying left
            if (bgLayer3.x > 0)
            {
                bgLayer3.x = -stage.stageWidth;
            }
            // Hero flying right
            if (bgLayer3.x < -stage.stageWidth)
            {
                bgLayer3.x = 0;
            }
            
            // Background 4 - Trees
            bgLayer4.x -= Math.ceil(_speed * bgLayer4.parallaxDepth);
            // Hero flying left
            if (bgLayer4.x > 0)
            {
                bgLayer4.x = -stage.stageWidth;
            }
            // Hero flying right
            if (bgLayer4.x < -stage.stageWidth)
            {
                bgLayer4.x = 0;
            }
        }
    }
    
    /**
		 * Game paused? 
		 * @return 
		 * 
		 */
    private function get_gamePaused() : Bool
    {
        return _gamePaused;
    }
    private function set_gamePaused(value : Bool) : Bool
    {
        _gamePaused = value;
        return value;
    }
    
    /**
		 *  
		 * State of the game.
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
		 * Speed of the hero.
		 * 
		 */
    private function get_speed() : Float
    {
        return _speed;
    }
    private function set_speed(value : Float) : Float
    {
        _speed = value;
        return value;
    }
}
