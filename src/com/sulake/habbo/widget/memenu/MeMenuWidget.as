package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_642:String = "me_menu_settings_view";
      
      private static const const_746:int = 10;
      
      public static const const_509:String = "me_menu_effects_view";
      
      public static const const_118:String = "me_menu_top_view";
      
      public static const const_1331:String = "me_menu_rooms_view";
      
      public static const const_939:String = "me_menu_dance_moves_view";
      
      public static const const_275:String = "me_menu_my_clothes_view";
       
      
      private var var_1769:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1443:int = 0;
      
      private var var_1768:int = 0;
      
      private var var_1773:Boolean = false;
      
      private var var_257:Boolean = false;
      
      private var var_1770:int = 0;
      
      private var var_1771:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_550:Boolean = false;
      
      private var var_91:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1166:int = 0;
      
      private var var_1772:Boolean = false;
      
      private var var_976:Point;
      
      private var var_31:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_976 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1772 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_118);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_690,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_645,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_547,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_588,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_334,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_652,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_470,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_867,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_228,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_193,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_655,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_210,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_289,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_103,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_422,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_160,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_550;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_257)
         {
            return;
         }
         if(var_31.window.name == const_642)
         {
            (var_31 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1166 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1443 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1443.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_257 && var_31.window.name == const_275))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_659);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_690,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_645,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_547,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_588,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_334,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_228,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_193,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_655,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_652,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_470,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_867,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_210,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_289,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_422,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_103,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_160,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_31 != null)
         {
            var_31.dispose();
            var_31 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1769;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1771 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_91 != null)
         {
            var_91.dispose();
            var_91 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1773;
      }
      
      public function get creditBalance() : int
      {
         return var_1443;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_422:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_257 + " view: " + var_31.window.name);
               if(var_257 != true || var_31.window.name != const_118)
               {
                  return;
               }
               (var_31 as MeMenuMainView).setIconAssets("clothes_icon",const_118,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_103:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1771 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1768;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_550 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_550 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1166 > 0;
         var_1166 = param1.daysLeft;
         var_1768 = param1.periodsLeft;
         var_1770 = param1.pastPeriods;
         var_1769 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_31 != null)
            {
               changeView(var_31.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1773 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_31 != null && var_31.window.name != const_275)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_31 != null && var_31.window.name == const_275)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_858)
            {
               var_91 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1200);
            }
            else
            {
               var_91 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_353);
            }
            _loc2_ = _mainContainer.getChildByName(var_31.window.name);
            if(_loc2_ != null)
            {
               var_91.window.x = _loc2_.width + const_746;
               _mainContainer.addChild(var_91.window);
               _mainContainer.width = var_91.window.x + var_91.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_550 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_550 = true;
            }
         }
         if(var_31 != null && var_31.window.name == const_509)
         {
            (var_31 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1770;
      }
      
      public function get habboClubDays() : int
      {
         return var_1166;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1256,HabboWindowStyle.const_845,HabboWindowParam.const_41,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_257 = !var_257;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_257 = false;
               break;
            default:
               return;
         }
         if(var_257)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_564);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_31 != null)
         {
            _mainContainer.removeChild(var_31.window);
            var_31.dispose();
            var_31 = null;
         }
         var_257 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_31 != null && var_31.window.name == const_275)
         {
            if(var_91 != null)
            {
               var_91.dispose();
               var_91 = null;
            }
            changeView(const_118);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1772;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_91 != null)
         {
            var_91.dispose();
            var_91 = null;
         }
         switch(param1)
         {
            case const_118:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_509:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_939:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_275:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1331:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_642:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_31 != null)
            {
               _mainContainer.removeChild(var_31.window);
               var_31.dispose();
               var_31 = null;
            }
            var_31 = _loc2_;
            var_31.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_31 != null)
         {
            var_976.x = var_31.window.width + 10;
            var_976.y = var_31.window.height;
            var_31.window.x = 5;
            var_31.window.y = 0;
            _mainContainer.width = var_976.x;
            _mainContainer.height = var_976.y;
            if(var_91 != null)
            {
               _mainContainer.width = var_91.window.x + var_91.window.width + const_746;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_118);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_595);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_257 = true;
      }
   }
}
