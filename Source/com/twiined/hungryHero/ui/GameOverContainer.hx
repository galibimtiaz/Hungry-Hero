package com.twiined.hungryHero.ui;

import com.twiined.hungryHero.customObjects.Font;
import com.twiined.hungryHero.events.NavigationEvent;
import starling.display.Button;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.text.TextFormat;
import starling.utils.Align;

class GameOverContainer extends Sprite
{
    public var score(get, never) : Int;
    public var distance(get, never) : Int;

    /** Background image. */
    private var bg : Quad;
    
    /** Message text field. */
    private var messageText : TextField;
    
    /** Score container. */
    private var scoreContainer : Sprite;
    
    /** Score display - distance. */
    private var distanceText : TextField;
    
    /** Score display - score. */
    private var scoreText : TextField;
    
    /** Play again button. */
    private var playAgainBtn : Button;
    
    /** Main Menu button. */
    private var mainBtn : Button;
    
    /** About button. */
    private var aboutBtn : Button;
    
    /** Font - score display. */
    private var fontScore : Font;
    
    /** Font - message display. */
    private var fontMessage : Font;
    
    /** Score value - distance. */
    private var _distance : Int;
    
    /** Score value - score. */
    private var _score : Int;
    
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
        
        drawGameOver();
    }
    
    /**
		 * Draw game over screen. 
		 * 
		 */
    private function drawGameOver() : Void
    {
        // Get fonts for text display.

        fontMessage = Fonts.getFont("ScoreValue");
        fontScore = Fonts.getFont("ScoreLabel");
		
		var textMessage:TextFormat = new TextFormat(fontMessage.fontName, fontMessage.fontSize, 0xf3e75f, Align.CENTER, Align.TOP);
        var textScore:TextFormat = new TextFormat(fontScore.fontName, fontScore.fontSize, 0xffffff, Align.CENTER, Align.TOP);
        
        // Background quad.
        bg = new Quad(stage.stageWidth, stage.stageHeight, 0x000000);
        bg.alpha = 0.75;
        this.addChild(bg);
        
        // Message text field.
        messageText = new TextField(stage.stageWidth, cast(stage.stageHeight * 0.5,Int), "HERO WAS KILLED!",textMessage);
        //messageText.vAlign = VAlign.TOP;
        messageText.height = messageText.textBounds.height;
        messageText.y = (stage.stageHeight * 20) / 100;
        this.addChild(messageText);
        
        // Score container.
        scoreContainer = new Sprite();
        scoreContainer.y = (stage.stageHeight * 40) / 100;
        this.addChild(scoreContainer);
        
        distanceText = new TextField(stage.stageWidth, 100, "DISTANCE TRAVELLED: 0000000",textScore);
        //distanceText.vAlign = VAlign.TOP;
        distanceText.height = distanceText.textBounds.height;
        scoreContainer.addChild(distanceText);
        
        scoreText = new TextField(stage.stageWidth, 100, "SCORE: 0000000", textScore);
        //scoreText.vAlign = VAlign.TOP;
        scoreText.height = scoreText.textBounds.height;
        scoreText.y = distanceText.bounds.bottom + scoreText.height * 0.5;
        scoreContainer.addChild(scoreText);
        
        // Navigation buttons.
        mainBtn = new Button(Assets.instance.manager.getTexture("gameOver_mainButton"));
        mainBtn.y = (stage.stageHeight * 70) / 100;
        mainBtn.addEventListener(Event.TRIGGERED, onMainClick);
        this.addChild(mainBtn);
        
        playAgainBtn = new Button(Assets.instance.manager.getTexture("gameOver_playAgainButton"));
        playAgainBtn.y = mainBtn.y + mainBtn.height * 0.5 - playAgainBtn.height * 0.5;
        playAgainBtn.addEventListener(Event.TRIGGERED, onPlayAgainClick);
        this.addChild(playAgainBtn);
        
        aboutBtn = new Button(Assets.instance.manager.getTexture("gameOver_aboutButton"));
        aboutBtn.y = playAgainBtn.y + playAgainBtn.height * 0.5 - aboutBtn.height * 0.5;
        aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
        this.addChild(aboutBtn);
        
        mainBtn.x = stage.stageWidth * 0.5 - (mainBtn.width + playAgainBtn.width + aboutBtn.width + 30) * 0.5;
        playAgainBtn.x = mainBtn.bounds.right + 10;
        aboutBtn.x = playAgainBtn.bounds.right + 10;
    }
    
    /**
		 * On play-again button click. 
		 * @param event
		 * 
		 */
    private function onPlayAgainClick(event : Event) : Void
    {
        if (!GameConstants.muted)
        {
            Assets.instance.manager.getSound("mushroom").play();
        }
        
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {
                    id : "playAgain"
                }));
    }
    
    /**
		 * On main menu button click. 
		 * @param event
		 * 
		 */
    private function onMainClick(event : Event) : Void
    {
        if (!GameConstants.muted)
        {
            //GameConstants.sndMushroom.play();
			Assets.instance.manager.getSound("mushroom").play();
        }
        
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {
                    id : "mainMenu"
                }, true));
    }
    
    /**
		 * On about button click. 
		 * @param event
		 * 
		 */
    private function onAboutClick(event : Event) : Void
    {
        if (!GameConstants.muted)
        {
            Assets.instance.manager.getSound("mushroom").play();
        }
        
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {
                    id : "about"
                }, true));
    }
    
    /**
		 * Initialize Game Over container. 
		 * @param _score
		 * @param _distance
		 * 
		 */
    public function initialize(_score : Int, _distance : Int) : Void
    {
        this._distance = _distance;
        this._score = _score;
        
        distanceText.text = "DISTANCE TRAVELLED: " + Std.string(this._distance);
        scoreText.text = "SCORE: " + Std.string(this._score);
        
        this.alpha = 0;
        this.visible = true;
    }
    
    /**
		 * Score. 
		 * @return 
		 * 
		 */
    private function get_score() : Int
    {
        return _score;
    }
    
    /**
		 * Distance. 
		 * @return 
		 * 
		 */
    private function get_distance() : Int
    {
        return _distance;
    }
}
