package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private var var_645:String;
      
      private var var_32:CoreComponent;
      
      private var var_1331:AssetAliasCollection;
      
      private var var_1070:PaletteManager;
      
      private var var_732:PetDataManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_237:Map;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_237 = new Map();
         param2 |= const_960;
         super(param1,param2,param3);
         var_645 = RenderMode.const_1293;
         if(param1 is CoreComponent)
         {
            var_32 = CoreComponent(param1);
            var_32.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
      }
      
      public function injectFigureData(param1:String, param2:XML) : void
      {
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarType.const_81:
               _loc3_ = var_237.getValue(AvatarType.const_81) as AvatarStructure;
               break;
            case AvatarType.PET:
               _loc3_ = var_237.getValue(AvatarType.PET) as AvatarStructure;
               break;
            default:
               Logger.log("Uknown avatar type: " + param1);
         }
         if(_loc3_ != null)
         {
            _loc3_.injectFigureData(param2);
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var _loc2_:* = null;
         _loc2_ = var_237.getValue(AvatarType.const_81) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
         _loc2_ = var_237.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc2_ != null)
         {
            _loc2_.initConfiguration(_habboConfiguration);
         }
      }
      
      private function onStructureInit(param1:Event = null) : void
      {
         this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
      }
      
      private function init() : void
      {
         var _loc5_:* = null;
         var _loc1_:AssetLibraryCollection = var_32.assets as AssetLibraryCollection;
         var _loc2_:int = 0;
         var _loc3_:Array = new Array();
         while(_loc1_.hasAssetLibrary("lib-" + _loc2_))
         {
            _loc3_.push("lib-" + _loc2_);
            _loc2_++;
         }
         if(_loc1_.hasAssetLibrary("PetData"))
         {
            _loc3_.push("PetData");
            _loc2_++;
         }
         if(_loc1_.hasAssetLibrary("PaletteData"))
         {
            _loc3_.push("PaletteData");
            _loc2_++;
         }
         var_1331 = new AssetAliasCollection(_loc1_,_loc3_);
         var_732 = new PetDataManager(_loc1_,_loc3_);
         var_1070 = new PaletteManager(_loc1_,_loc3_);
         var _loc4_:XML = _assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         var_732.populateFigureData(_loc4_);
         _loc5_ = new AvatarStructure(this,assets,_loc1_,AvatarType.const_81);
         _loc5_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_237.add(AvatarType.const_81,_loc5_);
         _loc5_ = new AvatarStructure(this,assets,_loc1_,AvatarType.PET);
         _loc5_.addEventListener(AvatarStructure.AVATAR_STRUCTURE_INIT,onStructureInit);
         var_237.add(AvatarType.PET,_loc5_);
         initHardCodedAliases();
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return var_732 as IPetDataManager;
      }
      
      public function set mode(param1:String) : void
      {
         var_645 = param1;
         if(var_645 == RenderMode.const_1161)
         {
            init();
         }
         if(var_645 == RenderMode.const_1140)
         {
            init();
            onConfigurationInit(null);
         }
      }
      
      public function createPetImage(param1:String, param2:String) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc3_:Array = param1.split(" ");
         if(_loc3_.length == 0)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         var _loc6_:uint = parseInt(_loc3_[2],16);
         return createPetImageNew(_loc4_,_loc5_,_loc6_,param2);
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return var_1331.getAssetByName(param1);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
         }
      }
      
      public function createPetImageNew(param1:int, param2:int, param3:uint, param4:String) : IAvatarImage
      {
         var _loc5_:String = var_732.createAvatarFigureStringNew(param1,param2,param3);
         var _loc6_:AvatarStructure = var_237.getValue(AvatarType.PET) as AvatarStructure;
         if(_loc6_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc6_,var_1331,_loc5_,param4,AvatarType.PET);
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
         init();
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = var_237.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function createAvatarImage(param1:String, param2:String) : IAvatarImage
      {
         var _loc3_:AvatarStructure = var_237.getValue(AvatarType.const_81) as AvatarStructure;
         if(_loc3_ == null)
         {
            return null;
         }
         return new AvatarImage(_loc3_,var_1331,param1,param2,AvatarType.const_81);
      }
      
      override public function dispose() : void
      {
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
         if(var_237 != null)
         {
            var_237.dispose();
            var_237 = null;
         }
         if(var_732 != null)
         {
            var_732 = null;
         }
         if(var_1070 != null)
         {
            var_1070 = null;
         }
         PartOffsetData.dispose();
      }
      
      public function get paletteManager() : PaletteManager
      {
         return var_1070;
      }
      
      private function initHardCodedAliases() : void
      {
      }
      
      public function get mode() : String
      {
         return var_645;
      }
   }
}
