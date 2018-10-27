package com.twiined.hungryHero.events;

import starling.events.Event;

/**
	 * This class defines custom events for navigation in the game. 
	 * @author Galib Imtiaz
	 * 
	 */
class NavigationEvent extends Event
{
    /** Change of a screen. */
    public static inline var CHANGE_SCREEN : String = "changeScreen";
    
    /** Custom object to pass parameters to the screens. */
    public var params : Dynamic;
    
    public function new(type : String, _params : Dynamic, bubbles : Bool = false)
    {
        super(type, bubbles);
        params = _params;
    }
}
