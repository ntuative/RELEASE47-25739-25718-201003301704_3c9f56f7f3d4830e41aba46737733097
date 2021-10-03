package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.runtime.exceptions.CrashMeError;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputDisplayEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatInputWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoomChatInputWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_1117:int = 2;
      
      private static const const_1424:int = 150;
      
      private static const const_1118:int = 3000;
      
      private static const const_1116:int = 30000;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1332:int;
      
      private var var_1334:Boolean = false;
      
      private var var_1333:String = "";
      
      private var var_433:int = -1;
      
      private var var_899:Timer = null;
      
      private var _visualization:RoomChatInputView;
      
      private var var_1634:Boolean = false;
      
      private var var_898:Boolean = false;
      
      private var var_736:int = 0;
      
      private var var_24:Component = null;
      
      public function RoomChatInputWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         var_1332 = getTimer();
         super(param1,param2,param3);
         var_24 = param4;
         var_24.registerUpdateReceiver(this,9);
      }
      
      public function sendChat(param1:String, param2:int, param3:String = "") : void
      {
         if(var_898)
         {
            return;
         }
         checkForFlooding();
         var _loc4_:RoomWidgetChatMessage = new RoomWidgetChatMessage(RoomWidgetChatMessage.const_606,param1,param2,param3);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      private function onReleaseTimerTick(param1:TimerEvent) : void
      {
         if(_visualization != null)
         {
            var_736 = var_736 - 1;
            _visualization.showFloodBlocking(var_736);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_291,onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_228,onRoomObjectDeselected);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_254,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetChatInputContentUpdateEvent.const_662,onChatInputUpdate);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_200,onUserInfo);
         param1.addEventListener(RoomWidgetChatInputDisplayEvent.const_614,onSettings);
         super.registerUpdateEvents(param1);
      }
      
      public function update(param1:uint) : void
      {
         if(var_1334)
         {
            var_1334 = false;
            throw new CrashMeError();
         }
      }
      
      public function get allowPaste() : Boolean
      {
         return var_1634;
      }
      
      public function get floodBlocked() : Boolean
      {
         return var_898;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         if(_visualization == null)
         {
            _visualization = new RoomChatInputView(this,windowManager,assets,localizations);
         }
         refreshWindowPosition();
      }
      
      private function onReleaseTimerComplete(param1:TimerEvent) : void
      {
         Logger.log("Releasing flood blocking");
         var_898 = false;
         var_433 = -1;
         if(_visualization != null)
         {
            _visualization.hideFloodBlocking();
         }
         var_899 = null;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var_1333 = param1.name;
      }
      
      private function onSettings(param1:RoomWidgetChatInputDisplayEvent) : void
      {
         var_1634 = param1.allowPaste;
      }
      
      private function onChatInputUpdate(param1:RoomWidgetChatInputContentUpdateEvent) : void
      {
         var _loc2_:String = "";
         switch(param1.messageType)
         {
            case RoomWidgetChatInputContentUpdateEvent.const_868:
               _loc2_ = localizations.getKey("widgets.chatinput.mode.whisper",":tell");
               _visualization.displaySpecialChatMessage(_loc2_,param1.userName);
               break;
            case RoomWidgetChatInputContentUpdateEvent.const_1162:
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_291,onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_228,onRoomObjectDeselected);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_254,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetChatInputContentUpdateEvent.const_662,onChatInputUpdate);
         param1.removeEventListener(RoomWidgetChatInputDisplayEvent.const_614,onSettings);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_200,onUserInfo);
      }
      
      private function onRoomObjectDeselected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var_1333 = "";
      }
      
      override public function dispose() : void
      {
         if(_visualization != null)
         {
            _visualization.dispose();
            _visualization = null;
         }
         var_24.removeUpdateReceiver(this);
         _disposed = true;
         super.dispose();
      }
      
      private function checkForFlooding() : Boolean
      {
         if(var_898)
         {
            return true;
         }
         var _loc1_:int = getTimer();
         if(var_433 == -1)
         {
            var_433 = 0;
            var_1332 = _loc1_;
         }
         else
         {
            ++var_433;
         }
         if(var_433 > const_1117)
         {
            if(_loc1_ < var_1332 + const_1118)
            {
               var_898 = true;
               var_736 = const_1116 / 1000;
               Logger.log("Enabling flood blocking");
               var_899 = new Timer(1000,var_736);
               var_899.addEventListener(TimerEvent.TIMER,onReleaseTimerTick);
               var_899.addEventListener(TimerEvent.TIMER_COMPLETE,onReleaseTimerComplete);
               var_899.start();
               if(_visualization != null)
               {
                  _visualization.showFloodBlocking(var_736);
               }
               return true;
            }
            var_433 = -1;
         }
         return false;
      }
      
      public function triggerManualCrash() : void
      {
         var_1334 = true;
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_335,param1.id,param1.category);
      }
      
      public function get selectedUserName() : String
      {
         return var_1333;
      }
      
      private function refreshWindowPosition() : void
      {
         if(_visualization == null)
         {
            return;
         }
         var _loc1_:RoomWidgetChatInputWidgetMessage = new RoomWidgetChatInputWidgetMessage(RoomWidgetChatInputWidgetMessage.const_590,_visualization.window);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
