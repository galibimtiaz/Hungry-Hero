import com.twiined.hungryHero.customObjects.Font;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;

/**
	 * This class embeds the bitmap fonts used in the game. 
	 * 
	 * @author Galib Imtiaz
	 * 
	 */
class Fonts
{
    
    
    /**
		 * Font objects.
		 */
    
	private static var gameFont:Map<String, Font> = new Map<String, Font>();
    
    /**
		 * Returns the BitmapFont (texture + xml) instance's fontName property (there is only oneinstance per app).
		 * @return String 
		 */
    public static function getFont(_fontStyle : String) : Font
    {
		var font:Font = gameFont.get(_fontStyle);
		if (font == null)
		{
			var texture:Texture = Texture.fromBitmapData(openfl.Assets.getBitmapData("assets/fonts/bitmap/font"+_fontStyle+".png"));
			var xml:Xml = Xml.parse(openfl.Assets.getText("assets/fonts/bitmap/font"+_fontStyle+".fnt")).firstElement();
			
			var bitFont:BitmapFont  = new BitmapFont(texture, xml);
			
            font = new Font(bitFont.name, cast(bitFont.size,Int));
            TextField.registerCompositor(bitFont,bitFont.name);
			gameFont.set(_fontStyle,font);
		}

		return font;
       
    }
}

