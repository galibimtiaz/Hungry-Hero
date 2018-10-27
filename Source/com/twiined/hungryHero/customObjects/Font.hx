package com.twiined.hungryHero.customObjects;


/**
	 * This class stores the properties of a font -
	 * 		Font Name
	 * 		Font Size
	 * 		Font Color
	 * 
	 * @author Galib Imtiaz
	 * 
	 */
@:final class Font
{
    public var fontColor(get, set) : Int;
    public var fontSize(get, set) : Int;
    public var fontName(get, set) : String;

    private var _fontName : String;
    private var _fontSize : Int;
    private var _fontColor : Int;
    
    public function new(fontName : String, fontSize : Int, fontColor : Int = 0xffffff)
    {
        this.fontName = fontName;
        this.fontSize = fontSize;
        this.fontColor = fontColor;
    }
    
    /**
		 * Font Color.
		 * @return 
		 * 
		 */
    private function get_fontColor() : Int
    {
        return _fontColor;
    }
    
    private function set_fontColor(value : Int) : Int
    {
        _fontColor = value;
        return value;
    }
    
    /**
		 * Font Size.
		 * @return 
		 * 
		 */
    private function get_fontSize() : Int
    {
        return _fontSize;
    }
    
    private function set_fontSize(value : Int) : Int
    {
        _fontSize = value;
        return value;
    }
    
    /**
		 * Font Name. 
		 * @return 
		 * 
		 */
    private function get_fontName() : String
    {
        return _fontName;
    }
    
    private function set_fontName(value : String) : String
    {
        _fontName = value;
        return value;
    }
}
