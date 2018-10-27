package com.twiined.hungryHero.objectPools;

import haxe.Constraints.Function;
import com.twiined.hungryHero.gameElements.Item;

/**
	 * This class handles the Object Pooling for food items.
	 *  
	 * @author Galib Imtiaz
	 * 
	 */
class PoolItem
{
    public var minSize(get, set) : Int;
    public var maxSize(get, set) : Int;

    
    /** Minimum size of the pool. */
    private var _minSize : Int;
    
    /** Maximum size of the pool. */
    private var _maxSize : Int;
    
    /** Current size of the pool (list). */
    public var size : Int = 0;
    
    /** Function to be called when the object is to be created. */
    public var create : Function;
    
    /** Function to be called when the object is to be cleaned. */
    public var clean : Function;
    
    /** Checked in objects count. */
    public var length : Int = 0;
    
    /** Objects in the pool. */
    private var list : Array<Item> = new Array<Item>();
    
    /** If this pool has been disposed. */
    private var disposed : Bool = false;
    
    /**
		* @param create This is the Function which should return a new Object to populate the Object pool
		* @param clean This Function will recieve the Object as a param and is used for cleaning the Object ready for reuse
		* @param minSize The initial size of the pool on Pool construction
		* @param maxSize The maximum possible size for the Pool
		*
		*/
    
    public function new(create : Function, clean : Function = null, minSize : Int = 50, maxSize : Int = 200)
    {
        this.create = create;
        this.clean = clean;
        this.minSize = minSize;
        this.maxSize = maxSize;
        
        // Create minimum number of objects now. Later in run-time, if required, more objects will be created < maximum number.
        for (i in 0...minSize)
        {
            add();
        }
    }
    
    /**
		 * Add new objects and check-in to the pool. 
		 * 
		 */
    private function add() : Void
    {
        list[length++] = create();
        size++;
    }
    
    /**
		 * Sets the minimum size for the Pool.
		 *
		 */
    private function set_minSize(num : Int) : Int
    {
        _minSize = num;
        if (_minSize > _maxSize)
        {
            _maxSize = _minSize;
        }
        if (_maxSize < list.length)
        {
            list.splice(_maxSize, 1);
        }
        size = list.length;
        return num;
    }
    
    /**
		 * Gets the minimum size for the Pool.
		 *
		 */
    private function get_minSize() : Int
    {
        return _minSize;
    }
    
    /**
		 * Sets the maximum size for the Pool.
		 *
		 */
    private function set_maxSize(num : Int) : Int
    {
        _maxSize = num;
        if (_maxSize < list.length)
        {
            list.splice(_maxSize, 1);
        }
        size = list.length;
        if (_maxSize < _minSize)
        {
            _minSize = _maxSize;
        }
        return num;
    }
    
    /**
		 * Returns the maximum size for the Pool.
		 *
		 */
    private function get_maxSize() : Int
    {
        return _maxSize;
    }
    
    /**
		 * Checks out an Object from the pool.
		 *
		 */
    public function checkOut() : Item
    {
        if (length == 0)
        {
            if (size < maxSize)
            {
                size++;
                return create();
            }
            else
            {
                return null;
            }
        }
        
        return list[--length];
    }
    
    /**
		 * Checks the Object back into the Pool.
		 * @param item The Object you wish to check back into the Object Pool.
		 *
		 */
    public function checkIn(item : Item) : Void
    {
        if (clean != null)
        {
            clean(item);
        }
        list[length++] = item;
    }
    
    /**
		 * Disposes the Pool ready for GC.
		 *
		 */
    public function dispose() : Void
    {
        if (disposed)
        {
            return;
        }
        
        disposed = true;
        
        create = null;
        clean = null;
        list = null;
    }
}
