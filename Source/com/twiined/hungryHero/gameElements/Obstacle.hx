package com.twiined.hungryHero.gameElements;

import starling.core.Starling;
import starling.display.Image;
import starling.display.MovieClip;
import starling.display.Sprite;
import com.twiined.hungryHero.utils.Utils;
import starling.utils.MathUtil;

/**
	 * This class defines the obstacles in the game.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class Obstacle extends Sprite
{
    public var type(get, set) : Int;
    public var lookOut(get, set) : Bool;
    public var alreadyHit(get, set) : Bool;
    public var speed(get, set) : Int;
    public var distance(get, set) : Int;
    public var position(get, set) : String;
    public var hitArea(get, never) : Image;

    /** Type of the obstacle. */
    private var _type : Int;
    
    /** Speed of the obstacle. */
    private var _speed : Int;
    
    /** Distance after which the obstacle should appear on screen. */
    private var _distance : Int;
    
    /** Look out sign status. */
    private var _showLookOut : Bool;
    
    /** Has the hero already collided with the obstacle? */
    private var _alreadyHit : Bool;
    
    /** Vertical position of the obstacle. */
    private var _position : String;
    
    /** Hit area of the obstacle. */
    private var _hitArea : Image;
    
    /** Visual art of the obstacle (static). */
    private var obstacleImage : Image;
    
    /** Visual art of the obstacle (animated). */
    private var obstacleAnimation : MovieClip;
    
    /** Visual art of the crashed obstacle. */
    private var obstacleCrashImage : Image;
    
    /** Look out sign animation. */
    private var lookOutAnimation : MovieClip;
    
    public function new(_type : Int, _distance : Int, _lookOut : Bool = true, _speed : Int = 0)
    {
        super();
        
        this.type = _type;
        this._distance = _distance;
        this._showLookOut = _lookOut;
        this._speed = _speed;
        
        _alreadyHit = false;
    }
    
    /**
		 * Create the art of the obstacle based on - animation/image and new/reused object. 
		 * 
		 */
    private function createObstacleArt() : Void
    {
        // Animated obstacle.
        if (_type == GameConstants.OBSTACLE_TYPE_4)
        {
            // If this is the first time the object is being used.
            if (obstacleAnimation == null)
            {
                obstacleAnimation = new MovieClip(Assets.instance.manager.getTextures("obstacle" + _type + "_0"), 10);
                this.addChild(obstacleAnimation);
                Starling.current.juggler.add(obstacleAnimation);
            }
            else
            {
                // If this object is being reused. (Last time also this object was an animation).
                obstacleAnimation.visible = true;
                Starling.current.juggler.add(obstacleAnimation);
            }
            
            obstacleAnimation.x = 0;
            obstacleAnimation.y = 0;
        }
        else
        {
            // Static obstacle.
            
            // If this is the first time the object is being used.
            if (obstacleImage == null)
            {
                obstacleImage = new Image(Assets.instance.manager.getTexture("obstacle" + _type));
                this.addChild(obstacleImage);
            }
            else
            {
                // If this object is being reused.
                obstacleImage.texture = Assets.instance.manager.getTexture("obstacle" + _type);
                obstacleImage.visible = true;
            }
            
            obstacleImage.readjustSize();
            obstacleImage.x = 0;
            obstacleImage.y = 0;
        }
    }
    
    /**
		 * Create the crash art of the obstacle based on - animation/image and new/reused object. 
		 * 
		 */
    private function createObstacleCrashArt() : Void
    {
        if (obstacleCrashImage == null)
        {
            // If this is the first time the object is being used.
            obstacleCrashImage = new Image(Assets.instance.manager.getTexture("obstacle" + _type + "_crash"));
            this.addChild(obstacleCrashImage);
        }
        else
        {
            // If this object is being reused.
            obstacleCrashImage.texture = Assets.instance.manager.getTexture("obstacle" + _type + "_crash");
        }
        
        // Hide the crash image by default.
        obstacleCrashImage.visible = false;
    }
    
    /**
		 * Create the look out animation. 
		 * 
		 */
    private function createLookOutAnimation() : Void
    {
        if (lookOutAnimation == null)
        {
            // If this is the first time the object is being used.
            lookOutAnimation = new MovieClip(Assets.instance.manager.getTextures("watchOut_"), 10);
            this.addChild(lookOutAnimation);
            Starling.current.juggler.add(lookOutAnimation);
        }
        else
        {
            // If this object is being reused.
            lookOutAnimation.visible = true;
            Starling.current.juggler.add(lookOutAnimation);
        }
        
        // Reset the positioning of look-out animation based on the new obstacle type.
        if (_type == GameConstants.OBSTACLE_TYPE_4)
        {
            lookOutAnimation.x = -lookOutAnimation.texture.width;
            lookOutAnimation.y = obstacleAnimation.y + (obstacleAnimation.texture.height * 0.5) - (obstacleAnimation.texture.height * 0.5);
        }
        else
        {
            lookOutAnimation.x = -lookOutAnimation.texture.width;
            lookOutAnimation.y = obstacleImage.y + (obstacleImage.texture.height * 0.5) - (lookOutAnimation.texture.height * 0.5);
        }
        
        lookOutAnimation.visible = false;
    }
    
    /**
		 * If reusing, hide previous animation/image, based on what is necessary this time. 
		 * 
		 */
    private function hidePreviousInstance() : Void
    {
        // If this item is being reused and was an animation the last time, remove it from juggler.
        // Only don't remove it if it is an animation this time as well.
        if (obstacleAnimation != null && _type != GameConstants.OBSTACLE_TYPE_4)
        {
            obstacleAnimation.visible = false;
            Starling.current.juggler.remove(obstacleAnimation);
        }
        
        // If this item is being reused and was an image the last time, hide it.
        if (obstacleImage != null)
        {
            obstacleImage.visible = false;
        }
    }
    
    /**
		 * Set the art, crash art, hit area and Look Out animation based on the new obstacle type. 
		 * @param value
		 * 
		 */
    private function get_type() : Int
    {
        return _type;
    }
    private function set_type(value : Int) : Int
    {
        _type = value;
        
        resetForReuse();
        
        // If reusing, hide previous animation/image, based on what is necessary this time.
        hidePreviousInstance();
        
        // Create Obstacle Art.
        createObstacleArt();
        
        // Create the Crash Art.
        createObstacleCrashArt();
        
        // Create look-out animation.
        createLookOutAnimation();
        return value;
    }
    
    /**
		 * Look out sign status. 
		 * 
		 */
    private function get_lookOut() : Bool
    {
        return _showLookOut;
    }
    private function set_lookOut(value : Bool) : Bool
    {
        _showLookOut = value;
        
        if (lookOutAnimation != null)
        {
            if (value)
            {
                lookOutAnimation.visible = true;
            }
            else
            {
                lookOutAnimation.visible = false;
                Starling.current.juggler.remove(lookOutAnimation);
            }
        }
        return value;
    }
    
    /**
		 * Has the hero collided with the obstacle? 
		 * 
		 */
    private function get_alreadyHit() : Bool
    {
        return _alreadyHit;
    }
    private function set_alreadyHit(value : Bool) : Bool
    {
        _alreadyHit = value;
        
        if (value)
        {
            obstacleCrashImage.visible = true;
            if (_type == GameConstants.OBSTACLE_TYPE_4)
            {
                obstacleAnimation.visible = false;
            }
            else
            {
                obstacleImage.visible = false;
                Starling.current.juggler.remove(obstacleAnimation);
            }
        }
        return value;
    }
    
    /**
		 * Speed of the obstacle. 
		 * 
		 */
    private function get_speed() : Int
    {
        return _speed;
    }
    private function set_speed(value : Int) : Int
    {
        _speed = value;
        return value;
    }
    
    /**
		 * Distance after which the obstacle should appear on screen. 
		 * 
		 */
    private function get_distance() : Int
    {
        return _distance;
    }
    private function set_distance(value : Int) : Int
    {
        _distance = value;
        return value;
    }
    
    /**
		 * Vertical position of the obstacle. 
		 * 
		 */
    private function get_position() : String
    {
        return _position;
    }
    private function set_position(value : String) : String
    {
        _position = value;
        return value;
    }
    
    private function get_hitArea() : Image
    {
        return _hitArea;
    }
    
    /**
		 * Width of the texture that defines the image of this Sprite. 
		 */
    override private function get_width() : Float
    {
        if (obstacleImage != null)
        {
            return obstacleImage.texture.width;
        }
        else
        {
            return 0;
        }
    }
    
    /**
		 * Height of the texture that defines the image of this Sprite. 
		 */
    override private function get_height() : Float
    {
        if (obstacleImage != null)
        {
            return obstacleImage.texture.height;
        }
        else
        {
            return 0;
        }
    }
    
    /**
		 * Reset the obstacle object for reuse. 
		 * 
		 */
    public function resetForReuse() : Void
    {
        this.alreadyHit = false;
        this.lookOut = true;
        this.rotation = MathUtil.deg2rad(0);
    }


    
}


