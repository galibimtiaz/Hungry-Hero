/**
	 * This class holds all the constant values used during game play.
	 * Modifying certain properties of this class could result in
	 * slightly varied behavior in the game, e.g., hero's lives or speed. 
	 * 
	 * @author Galib Imtiaz
	 * 
	 */
class GameConstants
{
	
	public static var GameWidth:Int  = 1024;
    public static var GameHeight:Int = 768;
    
    public static var CenterX:Int = Std.int(GameWidth / 2);
    public static var CenterY:Int = Std.int(GameHeight / 2);
	
	public static var muted:Bool = false;
	
	
    // Player's states - what is the player doing? -------------
    
    public static inline var GAME_STATE_IDLE : Int = 0;
    public static inline var GAME_STATE_FLYING : Int = 1;
    public static inline var GAME_STATE_OVER : Int = 2;
    
    // Hero's graphic states - what is the position/animation of hero?
    
    public static inline var HERO_STATE_IDLE : Int = 0;
    public static inline var HERO_STATE_FLYING : Int = 1;
    public static inline var HERO_STATE_HIT : Int = 2;
    public static inline var HERO_STATE_FALL : Int = 3;
    
    // Food item types -----------------------------------------
    
    public static inline var ITEM_TYPE_1 : Int = 1;
    public static inline var ITEM_TYPE_2 : Int = 2;
    public static inline var ITEM_TYPE_3 : Int = 3;
    public static inline var ITEM_TYPE_4 : Int = 4;
    public static inline var ITEM_TYPE_5 : Int = 5;
    
    /** Special Item - Coffee. */
    public static inline var ITEM_TYPE_COFFEE : Int = 6;
    
    /** Special Item - Mushroom. */
    public static inline var ITEM_TYPE_MUSHROOM : Int = 7;
    
    // Obstacle types ------------------------------------------
    
    /** Obstacle - Aeroplane. */
    public static inline var OBSTACLE_TYPE_1 : Int = 1;
    
    /** Obstacle - Space Ship. */
    public static inline var OBSTACLE_TYPE_2 : Int = 2;
    
    /** Obstacle - Airship. */
    public static inline var OBSTACLE_TYPE_3 : Int = 3;
    
    /** Obstacle - Helicopter. */
    public static inline var OBSTACLE_TYPE_4 : Int = 4;
    
    // Particle types ------------------------------------------
    
    /** Particle - Sparkle. */
    public static inline var PARTICLE_TYPE_1 : Int = 1;
    
    /** Particle - Wind Force. */
    public static inline var PARTICLE_TYPE_2 : Int = 2;
    
    // Hero properties -----------------------------------------
    
    /** Hero's initial spare lives. */
    public static inline var HERO_LIVES : Int = 5;
    
    /** Hero's minimum speed. */
    public static inline var HERO_MIN_SPEED : Float = 650;
    
    /** Hero's maximum speed when had coffee. */
    public static inline var HERO_MAX_SPEED : Float = 1400;
    
    /** Movement speed - game/player/items/obstacles speed. */
    public static inline var GRAVITY : Float = 10;
    
    // Obstacle properties -------------------------------------
    
    /** Obstacle frequency. */
    public static inline var OBSTACLE_GAP : Float = 1200;
    
    /** Obstacle speed. */
    public static inline var OBSTACLE_SPEED : Float = 300;

    public function new()
    {
    }
}
