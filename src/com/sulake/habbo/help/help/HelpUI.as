package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.action.CallGuideBotMessageComposer;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.cfh.CallForHelpPendingItemView;
   import com.sulake.habbo.help.cfh.CallForHelpReportUserSelection;
   import com.sulake.habbo.help.cfh.CallForHelpSentView;
   import com.sulake.habbo.help.cfh.CallForHelpTextInput;
   import com.sulake.habbo.help.cfh.CallForHelpTopicSelection;
   import com.sulake.habbo.help.enum.CallForHelpResultEnum;
   import com.sulake.habbo.help.enum.HabboHelpTrackingEvent;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class HelpUI
   {
      
      private static const const_1411:int = 0;
      
      private static const const_1412:int = 0;
       
      
      private var var_1459:int = 0;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _window:IWindowContainer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1848:Boolean = false;
      
      private var var_393:IWindowContainer;
      
      private var var_564:Array;
      
      private var var_99:Map;
      
      private var var_198:IHabboToolbar;
      
      private var var_1847:String = "HHVE_HELP_FRONTPAGE";
      
      private var var_1458:int = 0;
      
      private var var_1846:String = "";
      
      private var var_565:Array;
      
      private var var_258:String;
      
      private var var_24:HabboHelp;
      
      public function HelpUI(param1:HabboHelp, param2:IAssetLibrary, param3:IHabboWindowManager, param4:IHabboLocalizationManager, param5:IHabboToolbar)
      {
         var_258 = var_1847;
         var_565 = new Array();
         var_564 = new Array();
         super();
         var_24 = param1;
         _assetLibrary = param2;
         _windowManager = param3;
         _windowManager.registerLocalizationParameter("info.client.version","version","25739-25718-201003301629");
         var_198 = param5;
         var_99 = new Map();
         var_99.add(HabboHelpViewEnum.const_1239,IHelpViewController(new PlaceholderView(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_156,IHelpViewController(new HelpMainView(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_442,IHelpViewController(new FaqBrowseTopView(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_267,IHelpViewController(new FaqBrowseCategoryView(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_221,IHelpViewController(new FaqBrowseEntry(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_534,IHelpViewController(new FaqBrowseSearchResults(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_287,IHelpViewController(new CallForHelpTopicSelection(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_531,IHelpViewController(new CallForHelpTextInput(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_201,IHelpViewController(new CallForHelpSentView(this,_windowManager,_assetLibrary,"help_cfh_thanks")));
         var_99.add(HabboHelpViewEnum.CALL_FOR_HELP_HAS_ABUSIVE_ITEM,IHelpViewController(new CallForHelpSentView(this,_windowManager,_assetLibrary,"help_cfh_abusive")));
         var_99.add(HabboHelpViewEnum.const_797,IHelpViewController(new CallForHelpPendingItemView(this,_windowManager,_assetLibrary)));
         var_99.add(HabboHelpViewEnum.const_519,IHelpViewController(new CallForHelpReportUserSelection(this,_windowManager,_assetLibrary)));
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_258 != param1)
         {
            return;
         }
         var _loc3_:IHelpViewController = getViewController();
         if(_loc3_ != null)
         {
            _loc3_.update(param2);
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         var _loc2_:XmlAsset = XmlAsset(_assetLibrary.getAssetByName("help_frame_xml"));
         if(_loc2_ == null)
         {
            return;
         }
         _window = _loc1_.buildFromXML(XML(_loc2_.content)) as IWindowContainer;
         if(_window == null)
         {
            return;
         }
         _window.procedure = windowProcedure;
         var _loc3_:IItemListWindow = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var_1459 = 0 - _loc3_.width;
         var_1458 = _window.height;
      }
      
      private function addBackButtonWindow() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_258 == HabboHelpViewEnum.const_156 || false)
         {
            return;
         }
         if(var_393 == null)
         {
            _loc2_ = ICoreWindowManager(_windowManager);
            _loc3_ = XmlAsset(_assetLibrary.getAssetByName("help_back_button_xml"));
            if(_loc3_ == null)
            {
               return;
            }
            var_393 = _loc2_.buildFromXML(XML(_loc3_.content)) as IWindowContainer;
         }
         var _loc1_:IItemListWindow = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc1_ == null || var_393 == null)
         {
            return;
         }
         if(_loc1_.getListItemIndex(var_393 as IWindow) > -1)
         {
            return;
         }
         _loc1_.addListItem(var_393 as IWindow);
         setBackButtonActiveState(false);
      }
      
      public function get lastSearchString() : String
      {
         return var_1846;
      }
      
      private function getViewController() : IHelpViewController
      {
         return var_99.getValue(var_258);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_24.localization;
      }
      
      private function removeCurrentView() : void
      {
         var _loc2_:* = null;
         if(_window != null)
         {
            _loc2_ = _window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ != null)
            {
               while(_loc2_.numListItems > 1)
               {
                  _loc2_.getListItemAt(0).dispose();
                  _loc2_.removeListItemAt(0);
               }
            }
         }
         var _loc1_:IHelpViewController = getViewController();
         if(_loc1_ != null)
         {
            _loc1_.dispose();
         }
      }
      
      public function dispose() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:Array = var_99.getKeys();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc4_ = var_99.getValue(_loc3_) as IHelpViewController;
            if(_loc4_ != null)
            {
               _loc4_.dispose();
            }
            _loc2_++;
         }
         var_99.dispose();
         if(var_393 != null)
         {
            var_393.dispose();
            var_393 = null;
         }
      }
      
      public function updateCallForGuideBotUI(param1:Boolean) : void
      {
         var_1848 = param1;
         var _loc2_:IHelpViewController = var_99.getValue(HabboHelpViewEnum.const_156) as IHelpViewController;
         if(_loc2_ != null && !_loc2_.disposed)
         {
            _loc2_.update();
         }
      }
      
      public function getText(param1:String, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = param1;
         }
         return localization.getKey(param1,param2);
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         switch(param1)
         {
            case CallForHelpResultEnum.const_201:
               showUI(HabboHelpViewEnum.const_201);
               break;
            case CallForHelpResultEnum.const_839:
               showUI(HabboHelpViewEnum.const_797);
               break;
            case CallForHelpResultEnum.const_882:
               showUI(HabboHelpViewEnum.CALL_FOR_HELP_HAS_ABUSIVE_ITEM);
         }
      }
      
      public function set lastSearchString(param1:String) : void
      {
         var_1846 = param1;
      }
      
      private function setBackButtonActiveState(param1:Boolean = false) : void
      {
         var _loc3_:* = null;
         if(var_258 == HabboHelpViewEnum.const_156)
         {
            return;
         }
         if(true)
         {
            _loc3_ = _assetLibrary.getAssetByName("back_png") as BitmapDataAsset;
            var_564.push(_loc3_.content as BitmapData);
            _loc3_ = _assetLibrary.getAssetByName("back_hi_png") as BitmapDataAsset;
            var_564.push(_loc3_.content as BitmapData);
         }
         var _loc2_:IBitmapWrapperWindow = var_393.findChildByName("back_image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true);
         if(param1)
         {
            _loc2_.bitmap.copyPixels(var_564[1],var_564[1].rect,new Point(0,0));
         }
         else
         {
            _loc2_.bitmap.copyPixels(var_564[0],var_564[0].rect,new Point(0,0));
         }
      }
      
      public function get marginWidth() : int
      {
         return var_1459;
      }
      
      public function updateWindowDimensions() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _window.height = _loc1_.height + var_1458;
         _window.width = _loc1_.width + var_1459;
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.tags.indexOf("close") > -1)
               {
                  hideUI();
                  return;
               }
               if(param2.tags.indexOf("back") > -1)
               {
                  if(false)
                  {
                     showUI(var_565.pop(),false);
                  }
                  return;
               }
               break;
            case WindowMouseEvent.const_29:
               if(param2.tags.indexOf("back_image") > -1)
               {
                  setBackButtonActiveState(false);
                  return;
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(param2.tags.indexOf("back_image") > -1)
               {
                  setBackButtonActiveState(true);
                  return;
               }
               break;
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_99.length)
         {
            _loc3_ = var_99.getWithIndex(_loc2_) as IHelpViewController;
            if(_loc3_ != null)
            {
               _loc3_.roomSessionActive = param1;
               if(!_loc3_.disposed)
               {
                  _loc3_.update();
               }
            }
            _loc2_++;
         }
      }
      
      public function showUI(param1:String = null, param2:Boolean = true) : void
      {
         if(param1 == null)
         {
            param1 = var_258;
         }
         var _loc3_:* = !visible;
         if(_window == null)
         {
            createWindow();
            if(_window == null)
            {
               return;
            }
            _window.visible = true;
         }
         else
         {
            removeCurrentView();
         }
         if(param1 == var_1847)
         {
            var_565 = new Array();
         }
         else if(param2)
         {
            if(param1 != var_258)
            {
               var_565.push(var_258);
            }
         }
         var_258 = param1;
         var _loc4_:IHelpViewController = getViewController();
         if(_loc4_ == null)
         {
            Logger.log("* No view controller found for " + var_258);
            return;
         }
         var _loc5_:IWindowContainer = _window.findChildByName("content_area") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:IItemListWindow = _window.findChildByName("content_list") as IItemListWindow;
         if(_loc6_ == null)
         {
            return;
         }
         _loc6_.height = 0;
         _loc4_.render();
         var _loc7_:IWindow = _loc4_.getWindowContainer() as IWindow;
         if(_loc7_ != null)
         {
            _loc6_.addListItemAt(_loc7_,0);
         }
         addBackButtonWindow();
         updateWindowDimensions();
         if(_loc3_)
         {
            if(var_198 != null)
            {
               var_198.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.HELP,_window));
            }
         }
         var_24.events.dispatchEvent(new Event(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT));
      }
      
      public function isCallForGuideBotEnabled() : Boolean
      {
         return var_1848;
      }
      
      public function hideUI() : void
      {
         if(_window != null)
         {
            removeCurrentView();
            _window.dispose();
            _window = null;
         }
         var_258 = var_1847;
         var_24.events.dispatchEvent(new Event(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED));
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         var_24.sendMessage(param1);
      }
      
      public function getFaq() : FaqIndex
      {
         return var_24.getFaq();
      }
      
      public function toggleUI() : void
      {
         if(_window != null && false)
         {
            hideUI();
         }
         else
         {
            showUI();
         }
      }
      
      public function handleCallGuideBot() : void
      {
         sendMessage(new CallGuideBotMessageComposer());
         hideUI();
         var_24.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_694));
      }
      
      public function get visible() : Boolean
      {
         if(_window == null)
         {
            return false;
         }
         return _window.visible;
      }
      
      public function get marginHeight() : int
      {
         return var_1458;
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         var message:String = param1;
         _windowManager.alert("${help.cfh.reply.title}",message,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function get component() : HabboHelp
      {
         return var_24;
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         return var_24.getConfigurationKey(param1,param2,param3);
      }
   }
}
