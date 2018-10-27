package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Dynamic):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		
		#end
		
		var data, manifest, library;
		
		#if kha
		
		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);
		
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");
		
		#else
		
		data = '{"name":null,"assets":"aoy4:pathy41:assets%2Ffonts%2Fbitmap%2FfontRegular.fnty4:sizei4964y4:typey4:TEXTy2:idR1y7:preloadtgoR0y41:assets%2Ffonts%2Fbitmap%2FfontRegular.pngR2i8939R3y5:IMAGER5R7R6tgoR0y44:assets%2Ffonts%2Fbitmap%2FfontScoreLabel.fntR2i3449R3R4R5R9R6tgoR0y44:assets%2Ffonts%2Fbitmap%2FfontScoreLabel.pngR2i9638R3R8R5R10R6tgoR0y44:assets%2Ffonts%2Fbitmap%2FfontScoreValue.fntR2i3356R3R4R5R11R6tgoR0y44:assets%2Ffonts%2Fbitmap%2FfontScoreValue.pngR2i18212R3R8R5R12R6tgoR0y32:assets%2Fgraphics%2FbgLayer1.jpgR2i51263R3R8R5R13R6tgoR0y33:assets%2Fgraphics%2FbgWelcome.jpgR2i174173R3R8R5R14R6tgoR0y37:assets%2Fgraphics%2FmySpritesheet.pngR2i799010R3R8R5R15R6tgoR0y37:assets%2Fgraphics%2FmySpritesheet.xmlR2i6655R3R4R5R16R6tgoR0y39:assets%2Fparticles%2FparticleCoffee.pexR2i1425R3R4R5R17R6tgoR0y41:assets%2Fparticles%2FparticleMushroom.pexR2i1390R3R4R5R18R6tgoR0y32:assets%2Fparticles%2Ftexture.pngR2i668R3R8R5R19R6tgoR2i280449R3y5:MUSICR5y28:assets%2Fsounds%2FbgGame.mp3y9:pathGroupaR21hR6tgoR2i280449R3R20R5y31:assets%2Fsounds%2FbgWelcome.mp3R22aR23hR6tgoR2i25076R3R20R5y28:assets%2Fsounds%2Fcoffee.mp3R22aR24hR6tgoR2i14627R3R20R5y25:assets%2Fsounds%2Feat.mp3R22aR25hR6tgoR2i10030R3R20R5y25:assets%2Fsounds%2Fhit.mp3R22aR26hR6tgoR2i10866R3R20R5y26:assets%2Fsounds%2Fhurt.mp3R22aR27hR6tgoR2i51408R3R20R5y26:assets%2Fsounds%2Flose.mp3R22aR28hR6tgoR2i25494R3R20R5y30:assets%2Fsounds%2Fmushroom.mp3R22aR29hR6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
		#end
		
	}
	
	
}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontregular_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontregular_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorelabel_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorelabel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorevalue_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorevalue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_bglayer1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_bgwelcome_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_particlecoffee_pex extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_particlemushroom_pex extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_texture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bggame_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bgwelcome_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_coffee_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_eat_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_lose_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mushroom_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("Assets/fonts/bitmap/fontRegular.fnt") #if display private #end class __ASSET__assets_fonts_bitmap_fontregular_fnt extends haxe.io.Bytes {}
@:keep @:image("Assets/fonts/bitmap/fontRegular.png") #if display private #end class __ASSET__assets_fonts_bitmap_fontregular_png extends lime.graphics.Image {}
@:keep @:file("Assets/fonts/bitmap/fontScoreLabel.fnt") #if display private #end class __ASSET__assets_fonts_bitmap_fontscorelabel_fnt extends haxe.io.Bytes {}
@:keep @:image("Assets/fonts/bitmap/fontScoreLabel.png") #if display private #end class __ASSET__assets_fonts_bitmap_fontscorelabel_png extends lime.graphics.Image {}
@:keep @:file("Assets/fonts/bitmap/fontScoreValue.fnt") #if display private #end class __ASSET__assets_fonts_bitmap_fontscorevalue_fnt extends haxe.io.Bytes {}
@:keep @:image("Assets/fonts/bitmap/fontScoreValue.png") #if display private #end class __ASSET__assets_fonts_bitmap_fontscorevalue_png extends lime.graphics.Image {}
@:keep @:image("Assets/graphics/bgLayer1.jpg") #if display private #end class __ASSET__assets_graphics_bglayer1_jpg extends lime.graphics.Image {}
@:keep @:image("Assets/graphics/bgWelcome.jpg") #if display private #end class __ASSET__assets_graphics_bgwelcome_jpg extends lime.graphics.Image {}
@:keep @:image("Assets/graphics/mySpritesheet.png") #if display private #end class __ASSET__assets_graphics_myspritesheet_png extends lime.graphics.Image {}
@:keep @:file("Assets/graphics/mySpritesheet.xml") #if display private #end class __ASSET__assets_graphics_myspritesheet_xml extends haxe.io.Bytes {}
@:keep @:file("Assets/particles/particleCoffee.pex") #if display private #end class __ASSET__assets_particles_particlecoffee_pex extends haxe.io.Bytes {}
@:keep @:file("Assets/particles/particleMushroom.pex") #if display private #end class __ASSET__assets_particles_particlemushroom_pex extends haxe.io.Bytes {}
@:keep @:image("Assets/particles/texture.png") #if display private #end class __ASSET__assets_particles_texture_png extends lime.graphics.Image {}
@:keep @:file("Assets/sounds/bgGame.mp3") #if display private #end class __ASSET__assets_sounds_bggame_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/bgWelcome.mp3") #if display private #end class __ASSET__assets_sounds_bgwelcome_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/coffee.mp3") #if display private #end class __ASSET__assets_sounds_coffee_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/eat.mp3") #if display private #end class __ASSET__assets_sounds_eat_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/hit.mp3") #if display private #end class __ASSET__assets_sounds_hit_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/lose.mp3") #if display private #end class __ASSET__assets_sounds_lose_mp3 extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/mushroom.mp3") #if display private #end class __ASSET__assets_sounds_mushroom_mp3 extends haxe.io.Bytes {}
@:keep @:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end