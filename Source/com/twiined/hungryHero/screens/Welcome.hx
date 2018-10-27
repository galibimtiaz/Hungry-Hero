package com.twiined.hungryHero.screens;

import com.twiined.hungryHero.customObjects.Font;
import com.twiined.hungryHero.events.NavigationEvent;
import openfl.media.SoundMixer;
import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.BlendMode;
import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.text.TextFormat;
import starling.utils.Align;

/**
	 * This is the welcome or main menu class for the game.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class Welcome extends Sprite
{
    /** Background image. */
    private var bg : Image;
    
    /** Game title. */
    private var title : Image;
    
    /** Play button. */
    private var playBtn : Button;
    
    /** About button. */
    private var aboutBtn : Button;
    
    /** Hero artwork. */
    private var hero : Image;
    
    /** About text field. */
    private var aboutText : TextField;
    
    /** Galib Imtiaz.com button. */
    private var ImtiazBtn : Button;
    
    /** Starling Framework button. */
    private var starlingBtn : Button;
    
    /** Back button. */
    private var backBtn : Button;
    
    /** Screen mode - "welcome" or "about". */
    private var screenMode : String;
    
    /** Current date. */
    private var _currentDate : Date;
    
    /** Font - Regular text. */
    private var fontRegular : Font;
    
    /** Hero art tween object. */
    private var tween_hero : Tween;
    
    public function new()
    {
        super();
        this.visible = false;
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
        
        drawScreen();
    }
    
    /**
		 * Draw all the screen elements. 
		 * 
		 */
    private function drawScreen() : Void
    {
        // GENERAL ELEMENTS
        
        bg = new Image(Assets.instance.manager.getTexture("bgWelcome"));
        bg.blendMode = BlendMode.NONE;
        this.addChild(bg);
        
        title = new Image(Assets.instance.manager.getTexture("welcome_title"));
        title.x = 600;
        title.y = 65;
        this.addChild(title);
        
        // WELCOME ELEMENTS
        
        hero = new Image(Assets.instance.manager.getTexture("welcome_hero"));
        hero.x = -hero.width;
        hero.y = 130;
        this.addChild(hero);
        
        playBtn = new Button(Assets.instance.manager.getTexture("welcome_playButton"));
        playBtn.x = 640;
        playBtn.y = 340;
        playBtn.addEventListener(Event.TRIGGERED, onPlayClick);
        this.addChild(playBtn);
        
        aboutBtn = new Button(Assets.instance.manager.getTexture("welcome_aboutButton"));
        aboutBtn.x = 460;
        aboutBtn.y = 460;
        aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
        this.addChild(aboutBtn);
        
        // ABOUT ELEMENTS
        fontRegular = Fonts.getFont("Regular");
		
		var textFormate:TextFormat = new TextFormat(fontRegular.fontName, fontRegular.fontSize, 0xffffff, Align.CENTER, Align.TOP);
        
        aboutText = new TextField(480, 600, "",textFormate);
        aboutText.text = "Hungry Hero is a free and open source game built on Adobe Flash using Starling Framework.\n\nhttp://www.hungryherogame.com\n\n" +
                " The concept is very simple. The hero is pretty much always hungry and you need to feed him with food." +
                " You score when your Hero eats food.\n\nThere are different obstacles that fly in with a \"Look out!\"" +
                " caution before they appear. Avoid them at all costs. You only have 5 lives. Try to score as much as possible and also" +
                " try to travel the longest distance.";
        aboutText.x = 60;
        aboutText.y = 230;
        aboutText.height = aboutText.textBounds.height + 30;
        this.addChild(aboutText);
        
         ImtiazBtn = new Button(Assets.instance.manager.getTexture("about_starlingLogo"));
         ImtiazBtn.x = aboutText.x;
         ImtiazBtn.y = aboutText.bounds.bottom;
         ImtiazBtn.addEventListener(Event.TRIGGERED, onImtiazBtnClick);
        this.addChild( ImtiazBtn);
        
        starlingBtn = new Button(Assets.instance.manager.getTexture("about_starlingLogo"));
        starlingBtn.x = aboutText.bounds.right - starlingBtn.width;
        starlingBtn.y = aboutText.bounds.bottom;
        starlingBtn.addEventListener(Event.TRIGGERED, onStarlingBtnClick);
        this.addChild(starlingBtn);
        
        backBtn = new Button(Assets.instance.manager.getTexture("about_backButton"));
        backBtn.x = 660;
        backBtn.y = 350;
        backBtn.addEventListener(Event.TRIGGERED, onAboutBackClick);
        this.addChild(backBtn);
    }
    
    /**
		 * On back button click from about screen. 
		 * @param event
		 * 
		 */
    private function onAboutBackClick(event : Event) : Void
    {
        if (!GameConstants.muted)
        {
            Assets.instance.manager.getSound("coffee").play();
        }
        
        initialize();
    }
    
    /**
		 * On credits click on Galib Imtiaz.com image. 
		 * @param event
		 * 
		 */
    private function onImtiazBtnClick(event : Event) : Void
    {
        //navigateToURL(new URLRequest("http://www.Galib Imtiaz.com/"), "_blank");
    }
    
    /**
		 * On credits click on Starling Framework image. 
		 * @param event
		 * 
		 */
    private function onStarlingBtnClick(event : Event) : Void
    {
        //navigateToURL(new URLRequest("http://www.gamua.com/starling"), "_blank");
    }
    
    /**
		 * On play button click. 
		 * @param event
		 * 
		 */
    private function onPlayClick(event : Event) : Void
    {
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {
                    id : "play"
                }, true));
        
        if (!GameConstants.muted)
        {
            Assets.instance.manager.getSound("coffee").play();
        }
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
        showAbout();
    }
    
    /**
		 * Show about screen. 
		 * 
		 */
    public function showAbout() : Void
    {
        screenMode = "about";
        
        hero.visible = false;
        playBtn.visible = false;
        aboutBtn.visible = false;
        
        aboutText.visible = true;
        ImtiazBtn.visible = true;
        starlingBtn.visible = true;
        backBtn.visible = true;
    }
    
    /**
		 * Initialize welcome screen. 
		 * 
		 */
    public function initialize() : Void
    {
        disposeTemporarily();
        
        this.visible = true;
        
        // If not coming from about, restart playing background music.
        if (screenMode != "about")
        {
            if (!GameConstants.muted)
            {
                Assets.instance.manager.getSound("bgWelcome").play(0, 999);
            }
        }
        
        screenMode = "welcome";
        
        hero.visible = true;
        playBtn.visible = true;
        aboutBtn.visible = true;
        
        aboutText.visible = false;
        ImtiazBtn.visible = false;
        starlingBtn.visible = false;
        backBtn.visible = false;
        
        hero.x = -hero.width;
        hero.y = 100;
        
        tween_hero = new Tween(hero, 4, Transitions.EASE_OUT);
        tween_hero.animate("x", 80);
        Starling.current.juggler.add(tween_hero);
        
        this.addEventListener(Event.ENTER_FRAME, floatingAnimation);
    }
    
    /**
		 * Animate floating objects. 
		 * @param event
		 * 
		 */
    private function floatingAnimation(event : Event) : Void
    {
        _currentDate = Date.now();
        hero.y = 130 + (Math.cos(_currentDate.getTime() * 0.002)) * 25;
        playBtn.y = 340 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
        aboutBtn.y = 460 + (Math.cos(_currentDate.getTime() * 0.002)) * 10;
    }
    
    /**
		 * Dispose objects temporarily. 
		 * 
		 */
    public function disposeTemporarily() : Void
    {
        this.visible = false;
        
        if (this.hasEventListener(Event.ENTER_FRAME))
        {
            this.removeEventListener(Event.ENTER_FRAME, floatingAnimation);
        }
        
        if (screenMode != "about")
        {
            SoundMixer.stopAll();
        }
    }
}
