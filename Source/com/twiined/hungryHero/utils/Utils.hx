package com.twiined.hungryHero.utils;




class Utils {
	
	public static function randomRange(minNum:Float, maxNum:Float):Int 
	{
		return Math.round(Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	}
	
}