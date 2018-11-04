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
		
		data = '{"name":null,"assets":"aoy4:sizei5009y4:typey4:TEXTy9:classNamey44:__ASSET__assets_fonts_bitmap_fontregular_fnty2:idy41:assets%2Ffonts%2Fbitmap%2FfontRegular.fntgoR0i8939R1y5:IMAGER3y44:__ASSET__assets_fonts_bitmap_fontregular_pngR5y41:assets%2Ffonts%2Fbitmap%2FfontRegular.pnggoR0i3483R1R2R3y47:__ASSET__assets_fonts_bitmap_fontscorelabel_fntR5y44:assets%2Ffonts%2Fbitmap%2FfontScoreLabel.fntgoR0i9638R1R7R3y47:__ASSET__assets_fonts_bitmap_fontscorelabel_pngR5y44:assets%2Ffonts%2Fbitmap%2FfontScoreLabel.pnggoR0i3389R1R2R3y47:__ASSET__assets_fonts_bitmap_fontscorevalue_fntR5y44:assets%2Ffonts%2Fbitmap%2FfontScoreValue.fntgoR0i18212R1R7R3y47:__ASSET__assets_fonts_bitmap_fontscorevalue_pngR5y44:assets%2Ffonts%2Fbitmap%2FfontScoreValue.pnggoR0i51263R1R7R3y37:__ASSET__assets_graphics_bglayer1_jpgR5y32:assets%2Fgraphics%2FbgLayer1.jpggoR0i174173R1R7R3y38:__ASSET__assets_graphics_bgwelcome_jpgR5y33:assets%2Fgraphics%2FbgWelcome.jpggoR0i799010R1R7R3y42:__ASSET__assets_graphics_myspritesheet_pngR5y37:assets%2Fgraphics%2FmySpritesheet.pnggoR0i6722R1R2R3y42:__ASSET__assets_graphics_myspritesheet_xmlR5y37:assets%2Fgraphics%2FmySpritesheet.xmlgoR0i1462R1R2R3y44:__ASSET__assets_particles_particlecoffee_pexR5y39:assets%2Fparticles%2FparticleCoffee.pexgoR0i1427R1R2R3y46:__ASSET__assets_particles_particlemushroom_pexR5y41:assets%2Fparticles%2FparticleMushroom.pexgoR0i668R1R7R3y37:__ASSET__assets_particles_texture_pngR5y32:assets%2Fparticles%2Ftexture.pnggoR0i280449R1y5:MUSICR3y33:__ASSET__assets_sounds_bggame_mp3R5y28:assets%2Fsounds%2FbgGame.mp3goR0i280449R1R32R3y36:__ASSET__assets_sounds_bgwelcome_mp3R5y31:assets%2Fsounds%2FbgWelcome.mp3goR0i25076R1R32R3y33:__ASSET__assets_sounds_coffee_mp3R5y28:assets%2Fsounds%2Fcoffee.mp3goR0i14627R1R32R3y30:__ASSET__assets_sounds_eat_mp3R5y25:assets%2Fsounds%2Feat.mp3goR0i10030R1R32R3y30:__ASSET__assets_sounds_hit_mp3R5y25:assets%2Fsounds%2Fhit.mp3goR0i10866R1R32R3y31:__ASSET__assets_sounds_hurt_mp3R5y26:assets%2Fsounds%2Fhurt.mp3goR0i51408R1R32R3y31:__ASSET__assets_sounds_lose_mp3R5y26:assets%2Fsounds%2Flose.mp3goR0i25494R1R32R3y35:__ASSET__assets_sounds_mushroom_mp3R5y30:assets%2Fsounds%2Fmushroom.mp3gh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontregular_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontregular_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorelabel_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorelabel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorevalue_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_bitmap_fontscorevalue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_bglayer1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_bgwelcome_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_particlecoffee_pex extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_particlemushroom_pex extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_texture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bggame_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bgwelcome_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_coffee_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_eat_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_lose_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mushroom_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


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