import com.twiined.hungryHero.events.NavigationEvent;
import com.twiined.hungryHero.screens.InGame;
import com.twiined.hungryHero.screens.Welcome;
import com.twiined.hungryHero.ui.SoundButton;
import flash.media.SoundMixer;
import starling.display.Sprite;
import starling.events.Event;

/**
	 * This class is the primary Starling Sprite based class
	 * that triggers the different screens. 
	 * 
	 * @author Galib Imtiaz
	 * 
	 */
class Game extends Sprite
{
    /** Screen - Welcome or Main Menu. */
    private var screenWelcome : Welcome;
    
    /** Screen - InGame. */
    private var screenInGame : InGame;
    
    /** Sound / Mute button. */
    private var soundButton : SoundButton;
    
    public function new()
    {
        super();
        
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }
    
    /**
		 * On Game class added to stage. 
		 * @param event
		 * 
		 */
    private function onAddedToStage(event : Event) : Void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        
        // Initialize screens.
		
		new Assets(callback);
        
    }
	
	function callback() 
	{
		initScreens();
	}
    
    /**
		 * Initialize screens. 
		 * 
		 */
    private function initScreens() : Void
    {
		
		
        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
		
		
        
        // InGame screen.
        screenInGame = new InGame();
        screenInGame.addEventListener(NavigationEvent.CHANGE_SCREEN, onInGameNavigation);
        this.addChild(screenInGame);
		
		
        
        // Welcome screen.
        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
		
		
        
        // Create and add Sound/Mute button.
        soundButton = new SoundButton();
        soundButton.x = cast((soundButton.width * 0.5),Int);
        soundButton.y = cast((soundButton.height * 0.5),Int);
        soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
        this.addChild(soundButton);  // Initialize the Welcome screen by default.  ;
        
        
        
        screenWelcome.initialize();
		trace("Is it working ??");
    }
    
    /**
		 * On navigation from different screens. 
		 * @param event
		 * 
		 */
    private function onInGameNavigation(event : NavigationEvent) : Void
    {
        var param:String = (event.params.id);        

        switch (param)
        {
            case "mainMenu":
                screenWelcome.initialize();
            case "about":
                screenWelcome.initialize();
                screenWelcome.showAbout();
        }
    }
    
    /**
		 * On click of the sound/mute button. 
		 * @param event
		 * 
		 */
    private function onSoundButtonClick(event : Event = null) : Void
    {
        if (GameConstants.muted)
        {
            GameConstants.muted = false;
            
            if (screenWelcome.visible)
            {
                Assets.instance.manager.getSound("bgWelcome").play(0, 999);
            }
            else
            {
                if (screenInGame.visible)
                {
                    Assets.instance.manager.getSound("bgGame").play(0, 999);
                }
            }
            
            soundButton.showUnmuteState();
        }
        else
        {
            GameConstants.muted = true;
            SoundMixer.stopAll();
            
            soundButton.showMuteState();
        }
    }
    
    /**
		 * On change of screen. 
		 * @param event
		 * 
		 */
    private function onChangeScreen(event : NavigationEvent) : Void
    {
        var param:String = (event.params.id);        

        switch (param)
        {
            case "play":
                screenWelcome.disposeTemporarily();
                screenInGame.initialize();
        }
    }
}
