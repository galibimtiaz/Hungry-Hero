package com.twiined.hungryHero.gameElements;

import starling.display.Image;
import starling.display.Sprite;

/**
	 * This class represents the food items. 
	 * 
	 * @author Galib Imtiaz
	 * 
	 */
class Item extends Sprite
{
    public var foodItemType(get, set) : Int;

    /** Food item type. */
    private var _foodItemType : Int;
    
    /** Food item visuals. */
    private var itemImage : Image;
    
    public function new(_foodItemType : Int)
    {
        super();
        
        this.foodItemType = _foodItemType;
    }
    
    /**
		 * Set the type of food item (visuals) to show. 
		 * @param value
		 * 
		 */
    private function set_foodItemType(value : Int) : Int
    {
        _foodItemType = value;
        
        if (itemImage == null)
        {
            // If the item is created for the first time.
            itemImage = new Image(Assets.instance.manager.getTexture("item" + _foodItemType));
            itemImage.width = Assets.instance.manager.getTexture("item" + _foodItemType).width;
            itemImage.height = Assets.instance.manager.getTexture("item" + _foodItemType).height;
            itemImage.x = -itemImage.width / 2;
            itemImage.y = -itemImage.height / 2;
            this.addChild(itemImage);
        }
        else
        {
            // If the item is reused.
            itemImage.texture = Assets.instance.manager.getTexture("item" + _foodItemType);
            itemImage.width = Assets.instance.manager.getTexture("item" + _foodItemType).width;
            itemImage.height = Assets.instance.manager.getTexture("item" + _foodItemType).height;
            itemImage.x = -itemImage.width / 2;
            itemImage.y = -itemImage.height / 2;
        }
        return value;
    }
    
    /**
		 * Return the type of food item this object is visually representing. 
		 * @return 
		 * 
		 */
    private function get_foodItemType() : Int
    {
        return _foodItemType;
    }
}
