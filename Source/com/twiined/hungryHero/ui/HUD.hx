package com.twiined.hungryHero.ui;

import com.twiined.hungryHero.customObjects.Font;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.text.TextFormat;
import starling.utils.Align;

/**
	 * This class handles the Heads Up Display for the game.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class HUD extends Sprite
{
    public var lives(get, set) : Int;
    public var distance(get, set) : Int;
    public var foodScore(get, set) : Int;

    /** Lives left. */
    private var _lives : Int;
    
    /** Distance travelled. */
    private var _distance : Int;
    
    /** Food items score. */
    private var _foodScore : Int;
    
    /** Lives icon.  */
    private var livesLabel : TextField;
    
    /** Lives TextField. */
    private var livesText : TextField;
    
    /** Distance icon. */
    private var distanceLabel : TextField;
    
    /** Distance TextField. */
    private var distanceText : TextField;
    
    /** Food Score icon. */
    private var foodScoreLabel : TextField;
    
    /** Food Score TextField. */
    private var foodScoreText : TextField;
    
    /** Font for score label. */
    private var fontScoreLabel : TextFormat;
    
    /** Font for score value. */
    private var fontScoreValue : TextFormat;
    
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
		
		var fontMessage = Fonts.getFont("ScoreValue");
        var fontScore = Fonts.getFont("ScoreLabel");
		
        // Get fonts for score labels and values.
		var fontScoreValue:TextFormat = new TextFormat(fontMessage.fontName, fontMessage.fontSize, 0xffffff, Align.RIGHT, Align.TOP);
        var fontScoreLabel:TextFormat = new TextFormat(fontScore.fontName, fontScore.fontSize, 0xffffff, Align.RIGHT, Align.TOP);
        
        
        // Lives label
        livesLabel = new TextField(150, 20, "L I V E S", fontScoreLabel);
        livesLabel.x = 150;
        livesLabel.y = 5;
        this.addChild(livesLabel);
        
        // Lives
        livesText = new TextField(150, 75, "5", fontScoreValue);
        livesText.width = livesLabel.width;
		this.addChild(livesText);
        
        livesText.x = cast((livesLabel.x + livesLabel.width - livesText.width),Int);
        livesText.y = livesLabel.y + livesLabel.height;
        this.addChild(livesText);
        
        // Distance label
        distanceLabel = new TextField(150, 20, "D I S T A N C E", fontScoreLabel);
        
        distanceLabel.x = cast((stage.stageWidth - distanceLabel.width - 10),Int);
        distanceLabel.y = 5;
        this.addChild(distanceLabel);
        
        // Distance
        distanceText = new TextField(150, 75, "0", fontScoreValue);
        distanceText.width = distanceLabel.width;
        
        distanceText.x = cast((distanceLabel.x + distanceLabel.width - distanceText.width),Int);
        distanceText.y = distanceLabel.y + distanceLabel.height;
        this.addChild(distanceText);
        
        // Score label
        foodScoreLabel = new TextField(150, 20, "S C O R E", fontScoreLabel);
        
        foodScoreLabel.x = cast((distanceLabel.x - foodScoreLabel.width - 50),Int);
        foodScoreLabel.y = 5;
        this.addChild(foodScoreLabel);
        
        // Score
        foodScoreText = new TextField(150, 75, "0", fontScoreValue);
        foodScoreText.width = foodScoreLabel.width;
        
        foodScoreText.x = cast((foodScoreLabel.x + foodScoreLabel.width - foodScoreText.width),Int);
        foodScoreText.y = foodScoreLabel.y + foodScoreLabel.height;
        this.addChild(foodScoreText);
    }
    
    /**
		 * Lives left. 
		 * @return 
		 * 
		 */
    private function get_lives() : Int
    {
        return _lives;
    }
    private function set_lives(value : Int) : Int
    {
        _lives = value;
        livesText.text = Std.string(_lives);
        return value;
    }
    
    /**
		 * Distance travelled. 
		 * @return 
		 * 
		 */
    private function get_distance() : Int
    {
        return _distance;
    }
    private function set_distance(value : Int) : Int
    {
        _distance = value;
        distanceText.text = Std.string(_distance);
        return value;
    }
    
    /**
		 * Food items score. 
		 * @return 
		 * 
		 */
    private function get_foodScore() : Int
    {
        return _foodScore;
    }
    private function set_foodScore(value : Int) : Int
    {
        _foodScore = value;
        foodScoreText.text = Std.string(_foodScore);
        return value;
    }
    
    /**
		 * Add leading zeros to the score numbers. 
		 * @param value
		 * @return 
		 * 
		 */
    private function addZeros(value : Int) : String
    {
        var ret : String = Std.string(value);
        while (ret.length < 7)
        {
            ret = "0" + ret;
        }
        return ret;
    }
}
