package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.enum.AvatarEditorCategory;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.avatar.generic.GenericModel;
   import com.sulake.habbo.avatar.head.HeadModel;
   import com.sulake.habbo.avatar.legs.LegsModel;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.torso.TorsoModel;
   import com.sulake.habbo.avatar.wardrobe.WardrobeModel;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboAvatarEditor extends Component implements IHabboAvatarEditor
   {
       
      
      private var _view:AvatarEditorView;
      
      private var var_584:AvatarEditorHandler;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_560:IAvatarRenderManager;
      
      private var var_230:IWindowContainer;
      
      private var var_15:Map;
      
      private var var_1038:int = 0;
      
      private var var_1262:Boolean = false;
      
      private var var_502:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1148:String = "M";
      
      private var var_10:IHabboInventory;
      
      private var var_147:IHabboConfigurationManager;
      
      private var var_707:IFigureData;
      
      private var _localization:IHabboLocalizationManager;
      
      public function HabboAvatarEditor(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         if(param1 is CoreComponent)
         {
            (param1 as CoreComponent).events.addEventListener(Component.COMPONENT_EVENT_RUNNING,onComponentsRunning);
         }
      }
      
      public function getFigureSetType(param1:String) : ISetType
      {
         if(var_707 == null)
         {
            return null;
         }
         return var_707.getSetType(param1);
      }
      
      public function close() : void
      {
         if(var_230 != null)
         {
            var_230.visible = false;
         }
         else
         {
            this.events.dispatchEvent(new AvatarEditorClosedEvent());
         }
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_147 = param2 as IHabboConfigurationManager;
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_1262)
         {
            var_502 = new Dictionary();
            var_502["null"] = new FigureData(this);
            var_502["null"] = new FigureData(this);
            _loc1_ = var_502["null"];
            _loc2_ = var_502["null"];
            _loc1_.loadAvatarData("hr-681-35.hd-209-7.ch-878-87.lg-281-70.sh-906-77.ea-1401-77.ha-1010-70.he-1601-62.fa-1204-62.ca-1809-62.wa-2007-62",FigureData.const_84);
            _loc2_.loadAvatarData("hr-681-41.hd-620-9.ch-879-90.lg-700-85.sh-735-68",FigureData.FEMALE);
            var_15 = new Map();
            var_15.add(AvatarEditorCategory.const_835,new GenericModel(this));
            var_15.add(AvatarEditorCategory.const_47,new HeadModel(this));
            var_15.add(AvatarEditorCategory.const_302,new TorsoModel(this));
            var_15.add(AvatarEditorCategory.const_1147,new LegsModel(this));
            var_15.add(AvatarEditorCategory.const_975,new WardrobeModel(this));
            var_1262 = true;
         }
      }
      
      public function set gender(param1:String) : void
      {
         var _loc2_:* = null;
         var_1148 = param1;
         for each(_loc2_ in var_15)
         {
            _loc2_.reset();
         }
         if(_view != null)
         {
            _view.updateAvatar();
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return _localization;
      }
      
      private function orderByClub(param1:AvatarEditorGridPartItem, param2:AvatarEditorGridPartItem) : Number
      {
         var _loc3_:Number = param1.partSet == null ? -1 : Number(Number(param1.partSet.clubLevel));
         var _loc4_:Number = param2.partSet == null ? -1 : Number(Number(param2.partSet.clubLevel));
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partSet.id < param2.partSet.id)
         {
            return -1;
         }
         if(param1.partSet.id > param2.partSet.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      private function onComponentsRunning(param1:Event = null) : void
      {
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _communication = param2 as IHabboCommunicationManager;
         var_584 = new AvatarEditorHandler(this,_communication);
      }
      
      public function hasInvalidClubItems() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc1_:Boolean = false;
         for each(_loc2_ in var_15)
         {
            _loc3_ = _loc2_.hasClubItemsOverLevel(clubMemberLevel);
            if(_loc3_)
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_147 != null)
         {
            var_147.release(new IIDHabboConfigurationManager());
            var_147 = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_560 != null)
         {
            var_560.release(new IIDAvatarRenderManager());
            var_560 = null;
         }
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(var_10 != null)
         {
            var_10.release(new IIDHabboInventory());
            var_10 = null;
         }
         if(var_15 != null)
         {
            for each(_loc1_ in var_15)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_15 = null;
         }
         if(var_230 != null)
         {
            var_230.dispose();
            var_230 = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         if(var_584 != null)
         {
            var_584.dispose();
            var_584 = null;
         }
         var_707 = null;
         var_502 = null;
         super.dispose();
      }
      
      public function getDefaultColour(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:ISetType = getFigureSetType(param1);
         if(_loc2_ != null)
         {
            _loc3_ = getPalette(_loc2_.paletteID);
            for each(_loc4_ in _loc3_.colors)
            {
               if(_loc4_.isSelectable && var_1038 >= _loc4_.clubLevel)
               {
                  return _loc4_.id;
               }
            }
         }
         return -1;
      }
      
      public function get figureData() : FigureData
      {
         return var_502[var_1148];
      }
      
      public function generateDataContent(param1:IAvatarEditorCategoryModel, param2:String) : CategoryData
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:Boolean = false;
         var _loc14_:* = null;
         var _loc15_:* = false;
         var _loc16_:Boolean = false;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:Boolean = false;
         if(!param1)
         {
            return null;
         }
         if(!param2)
         {
            return null;
         }
         var _loc3_:* = [];
         var _loc4_:* = [];
         var _loc8_:Boolean = false;
         _loc7_ = getFigureSetType(param2);
         if(!_loc7_)
         {
            return null;
         }
         var _loc9_:String = configuration.getKey("avatareditor.allowclubtryout");
         switch(param2)
         {
            case FigureData.const_56:
               break;
            case FigureData.const_125:
            case FigureData.const_150:
            case FigureData.const_148:
            case FigureData.const_154:
            case FigureData.const_147:
            case FigureData.const_143:
            case FigureData.CHEST_ACCESSORIES:
            case FigureData.const_151:
               _loc8_ = true;
         }
         if(_loc7_ != null)
         {
            _loc10_ = getPalette(_loc7_.paletteID);
            if(!_loc10_)
            {
               return null;
            }
            _loc11_ = figureData.getColourIds(param2);
            if(!_loc11_)
            {
               _loc11_ = new Array();
            }
            _loc12_ = new Array(_loc11_.length);
            _loc13_ = Boolean(_loc9_ == "1");
            for each(_loc14_ in _loc10_.colors)
            {
               if(_loc14_.isSelectable && (_loc13_ || var_1038 >= _loc14_.clubLevel))
               {
                  _loc17_ = new AvatarEditorGridColorItem(AvatarEditorView.var_1597.clone() as IWindowContainer,param1,_loc14_);
                  _loc4_.push(_loc17_);
                  if(param2 != FigureData.const_56)
                  {
                     _loc18_ = 0;
                     while(_loc18_ < _loc11_.length)
                     {
                        if(_loc14_.id == _loc11_[_loc18_])
                        {
                           _loc12_[_loc18_] = _loc14_;
                        }
                        _loc18_++;
                     }
                  }
               }
            }
            if(_loc8_)
            {
               _loc19_ = _assets.getAssetByName("removeSelection") as BitmapDataAsset;
               if(_loc19_)
               {
                  _loc20_ = (_loc19_.content as BitmapData).clone();
                  _loc6_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1370.clone() as IWindowContainer,param1,null,null,false);
                  _loc6_.iconImage = _loc20_;
                  _loc3_.push(_loc6_);
               }
            }
            _loc15_ = param2 != FigureData.const_56;
            _loc16_ = Boolean(_loc9_ == "1");
            for each(_loc5_ in _loc7_.partSets)
            {
               _loc21_ = false;
               if(_loc5_.gender == FigureData.const_1156)
               {
                  _loc21_ = true;
               }
               else if(_loc5_.gender == gender)
               {
                  _loc21_ = true;
               }
               if(_loc5_.isSelectable && _loc21_ && (_loc16_ || var_1038 >= _loc5_.clubLevel))
               {
                  _loc6_ = new AvatarEditorGridPartItem(AvatarEditorView.var_1370.clone() as IWindowContainer,param1,_loc5_,_loc12_,_loc15_);
                  _loc3_.push(_loc6_);
               }
            }
         }
         _loc3_.sort(orderByClub);
         _loc4_.sort(orderPaletteByClub);
         return new CategoryData(_loc3_,_loc4_);
      }
      
      public function get wardrobe() : WardrobeModel
      {
         if(!var_1262)
         {
            init();
         }
         return var_15.getValue(AvatarEditorCategory.const_975);
      }
      
      public function getPalette(param1:int) : IPalette
      {
         if(var_707 == null)
         {
            return null;
         }
         return var_707.getPalette(param1);
      }
      
      public function get gender() : String
      {
         return var_1148;
      }
      
      public function toggleAvatarEditorPage(param1:String) : void
      {
         _view.toggleCategoryView(param1,false);
      }
      
      public function get handler() : AvatarEditorHandler
      {
         return var_584;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function get windowContext() : IWindowContainer
      {
         return var_230;
      }
      
      public function getCategoryWindowContainer(param1:String) : IWindowContainer
      {
         var _loc2_:IAvatarEditorCategoryModel = var_15.getValue(param1) as IAvatarEditorCategoryModel;
         if(_loc2_ != null)
         {
            return _loc2_.getWindowContainer();
         }
         return null;
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return var_560;
      }
      
      private function orderPaletteByClub(param1:AvatarEditorGridColorItem, param2:AvatarEditorGridColorItem) : Number
      {
         var _loc3_:Number = param1.partColor == null ? -1 : Number(param1.partColor.clubLevel as Number);
         var _loc4_:Number = param2.partColor == null ? -1 : Number(param2.partColor.clubLevel as Number);
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(param1.partColor.index < param2.partColor.index)
         {
            return -1;
         }
         if(param1.partColor.index > param2.partColor.index)
         {
            return 1;
         }
         return 0;
      }
      
      private function onAvatarRendererReady(param1:Event = null) : void
      {
         var_707 = var_560.getFigureData(AvatarType.const_81);
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_560 = param2 as IAvatarRenderManager;
         (var_560 as Component).events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY,onAvatarRendererReady);
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_10 = param2 as IHabboInventory;
      }
      
      public function openEditor(param1:IWindowContainer = null) : Boolean
      {
         if(!var_1262)
         {
            init();
         }
         if(_view == null)
         {
            _view = new AvatarEditorView(this,_windowManager,_catalog);
         }
         if(param1 != null)
         {
            param1.addChild(_view.window);
         }
         else
         {
            if(var_230 == null)
            {
               var_230 = _windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_59,HabboWindowStyle.const_38,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               var_230.addChild(_view.window);
               var_230.center();
               var_230.visible = false;
            }
            var_230.visible = true;
         }
         _view.show();
         toggleAvatarEditorPage(AvatarEditorCategory.const_835);
         if(var_584 != null)
         {
            var_584.getWardrobe();
         }
         return true;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      public function loadAvatarInEditor(param1:String, param2:String, param3:int = 0) : void
      {
         var _loc5_:* = null;
         switch(param2)
         {
            case FigureData.const_84:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.FEMALE:
            case "f":
            case "F":
               param2 = "null";
         }
         var_1038 = param3;
         var _loc4_:FigureData = var_502[param2];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.loadAvatarData(param1,param2);
         if(param2 != this.gender)
         {
            this.gender = param2;
         }
         if(var_15)
         {
            for each(_loc5_ in var_15)
            {
               _loc5_.reset();
            }
         }
         if(_view != null)
         {
            _view.updateAvatar();
         }
      }
      
      public function stripClubItems() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_15)
         {
            _loc1_.stripClubItemsOverLevel(clubMemberLevel);
         }
      }
      
      public function get clubMemberLevel() : int
      {
         return var_1038;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_147;
      }
   }
}
