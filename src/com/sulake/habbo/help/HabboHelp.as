package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1818:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_126:TutorialUI;
      
      private var var_663:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_56:HelpUI;
      
      private var var_664:IHabboConfigurationManager;
      
      private var var_198:IHabboToolbar;
      
      private var var_556:HotelMergeUI;
      
      private var var_296:IHabboCommunicationManager;
      
      private var var_811:FaqIndex;
      
      private var var_1819:String = "";
      
      private var var_946:IncomingMessages;
      
      private var var_1172:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1172 = new CallForHelpData();
         var_1818 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_811 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_198;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_56 != null)
         {
            var_56.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_56 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_56.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_126 != null)
         {
            var_126.dispose();
            var_126 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1819;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_56 != null)
         {
            var_56.dispose();
            var_56 = null;
         }
         if(var_126 != null)
         {
            var_126.dispose();
            var_126 = null;
         }
         if(var_556)
         {
            var_556.dispose();
            var_556 = null;
         }
         if(var_811 != null)
         {
            var_811.dispose();
            var_811 = null;
         }
         var_946 = null;
         if(var_198)
         {
            var_198.release(new IIDHabboToolbar());
            var_198 = null;
         }
         if(var_663)
         {
            var_663.release(new IIDHabboLocalizationManager());
            var_663 = null;
         }
         if(var_296)
         {
            var_296.release(new IIDHabboCommunicationManager());
            var_296 = null;
         }
         if(var_664)
         {
            var_664.release(new IIDHabboConfigurationManager());
            var_664 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_663;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_91:
               if(var_56 != null)
               {
                  var_56.setRoomSessionStatus(true);
               }
               if(var_126 != null)
               {
                  var_126.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_101:
               if(var_56 != null)
               {
                  var_56.setRoomSessionStatus(false);
               }
               if(var_126 != null)
               {
                  var_126.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_56 != null)
         {
            var_56.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1818;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_56 != null)
         {
            var_56.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_556)
         {
            var_556 = new HotelMergeUI(this);
         }
         var_556.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_126 == null && _assetLibrary != null && _windowManager != null)
         {
            var_126 = new TutorialUI(this);
         }
         return var_126 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_56 == null && _assetLibrary != null && _windowManager != null)
         {
            var_56 = new HelpUI(this,_assetLibrary,_windowManager,var_663,var_198);
         }
         return var_56 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1172;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1172.reportedUserId = param1;
         var_1172.reportedUserName = param2;
         var_56.showUI(HabboHelpViewEnum.const_287);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1819 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_198 != null)
         {
            var_198.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_117,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_663 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_126 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_126.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_296 = IHabboCommunicationManager(param2);
         var_946 = new IncomingMessages(this,var_296);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_56 != null)
         {
            var_56.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_56 != null)
         {
            var_56.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_296 != null && param1 != null)
         {
            var_296.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_811;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_56 != null)
         {
            var_56.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_198 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_664 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_126;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_88)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_58)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_556;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_91,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_101,onRoomSessionEvent);
         var_198.events.addEventListener(HabboToolbarEvent.const_88,onHabboToolbarEvent);
         var_198.events.addEventListener(HabboToolbarEvent.const_58,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_56 != null)
         {
            var_56.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_664 == null)
         {
            return param1;
         }
         return var_664.getKey(param1,param2,param3);
      }
   }
}
