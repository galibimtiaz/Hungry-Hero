package com.twiined.hungryHero.gameElements;

import starling.display.Image;
import starling.display.Sprite;

/**
	 * This class represents the particles that appear around hero for various power-ups.
	 * These particles use the Particle Systems extension for Starling Framework.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class Particle extends Sprite
{
    public var speedX(get, set) : Float;
    public var speedY(get, set) : Float;
    public var spin(get, set) : Float;

    /** Type of particle. */
    private var _type : Int;
    
    /** Speed X of the particle. */
    private var _speedX : Float;
    
    /** Speed Y of the particle. */
    private var _speedY : Float;
    
    /** Spin value of the particle. */
    private var _spin : Float;
    
    /** Texture of the particle. */
    private var particleImage : Image;
    
    public function new(_type : Int)
    {
        super();
        
        this._type = _type;
        
        switch (_type)
        {
            case GameConstants.PARTICLE_TYPE_1:
                particleImage = new Image(Assets.instance.manager.getTexture("particleEat"));
            case GameConstants.PARTICLE_TYPE_2:
                particleImage = new Image(Assets.instance.manager.getTexture("particleWindForce"));
        }
        
        particleImage.x = particleImage.width / 2;
        particleImage.y = particleImage.height / 2;
        this.addChild(particleImage);
    }
    
    /**
		 * Speed X of the particle. 
		 * 
		 */
    private function get_speedX() : Float
    {
        return _speedX;
    }
    private function set_speedX(value : Float) : Float
    {
        _speedX = value;
        return value;
    }
    
    /**
		 * Speed Y of the particle. 
		 * 
		 */
    private function get_speedY() : Float
    {
        return _speedY;
    }
    private function set_speedY(value : Float) : Float
    {
        _speedY = value;
        return value;
    }
    
    /**
		 * Spin value of the particle. 
		 * 
		 */
    private function get_spin() : Float
    {
        return _spin;
    }
    private function set_spin(value : Float) : Float
    {
        _spin = value;
        return value;
    }
}
