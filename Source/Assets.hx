import haxe.Constraints.Function;
import openfl.system.Capabilities;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.AssetManager;


/**
	 * This class holds all embedded textures, fonts and sounds and other embedded files.  
	 * By using static access methods, only one instance of the asset file is instantiated. This 
	 * means that all Image types that use the same bitmap will use the same Texture on the video card.
	 * 
	 * @author Galib Imtiaz
	 * 
	 */
class Assets
{
    
    public var manager(get, never) : AssetManager;
    public static var instance(get, never) : Assets;

    private static var _instance : Assets;
    
    private var _manager : AssetManager;
    private var _callback : Function;
    
    public function new(callback : Function = null)
    {
        _instance = this;
        _callback = callback;
        
        _manager = new AssetManager();
		_manager.verbose = Capabilities.isDebugger;
		
		_manager.addSound("bgGame",openfl.Assets.getSound("assets/sounds/bgGame.mp3"));
		_manager.addSound("bgWelcome",openfl.Assets.getSound("assets/sounds/bgWelcome.mp3"));
		_manager.addSound("coffee",openfl.Assets.getSound("assets/sounds/coffee.mp3"));
		_manager.addSound("eat",openfl.Assets.getSound("assets/sounds/eat.mp3"));
		_manager.addSound("hit",openfl.Assets.getSound("assets/sounds/hit.mp3"));
		_manager.addSound("hurt",openfl.Assets.getSound("assets/sounds/hurt.mp3"));
		_manager.addSound("lose",openfl.Assets.getSound("assets/sounds/lose.mp3"));
		_manager.addSound("mushroom",openfl.Assets.getSound("assets/sounds/mushroom.mp3"));
		
		_manager.enqueue([
            openfl.Assets.getPath ("assets/graphics/mySpritesheet.png"),
            openfl.Assets.getPath ("assets/graphics/mySpritesheet.xml"),
            openfl.Assets.getPath ("assets/graphics/bgLayer1.jpg"),
            openfl.Assets.getPath ("assets/graphics/bgWelcome.jpg"),
            openfl.Assets.getPath ("assets/particles/particleCoffee.pex"),
            openfl.Assets.getPath ("assets/particles/particleMushroom.pex"),
			openfl.Assets.getPath ("assets/particles/particleCoffee.pex"),
			openfl.Assets.getPath ("assets/particles/particleMushroom.pex"),
			openfl.Assets.getPath ("assets/particles/texture.png"),
			openfl.Assets.getPath ("assets/fonts/bitmap/fontRegular.png"),
			openfl.Assets.getPath ("assets/fonts/bitmap/fontRegular.fnt"),
			openfl.Assets.getPath ("assets/fonts/bitmap/fontScoreLabel.png"),
			openfl.Assets.getPath ("assets/fonts/bitmap/fontScoreLabel.fnt"),
			openfl.Assets.getPath ("assets/fonts/bitmap/fontScoreValue.png"),
			openfl.Assets.getPath ("assets/fonts/bitmap/fontScoreValue.fnt")
		]);
        
		
        //_manager.enqueue("../assets/levelData/testlevel.json");
        
        _manager.loadQueue(onProgress);
        
       // TextField.updateEmbeddedFonts();
    }
    
    private function onProgress(ratio : Float) : Void
    {
        if (ratio == 1.0 && _callback != null)
        {
            _callback();
        }
    }
    
    private function get_manager() : AssetManager
    {
        return _manager;
    }
    
    private static function get_instance() : Assets
    {
        return ((_instance != null) ? _instance : new Assets());
    }
	

}

