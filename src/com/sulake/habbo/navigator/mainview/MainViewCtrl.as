package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_603:int = 2;
      
      public static const const_842:int = 4;
      
      private static const const_494:int = 2;
      
      private static const const_776:int = 1;
      
      public static const const_1607:int = 3;
      
      private static const const_1110:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
      
      public static const const_432:int = 1;
      
      private static const const_777:int = 3;
       
      
      private var var_2139:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_1307:IRegionWindow;
      
      private var var_428:int;
      
      private var var_1305:Boolean = true;
      
      private var var_723:GuestRoomListCtrl;
      
      private var var_14:IFrameWindow;
      
      private var var_392:Timer;
      
      private var var_277:IWindowContainer;
      
      private var var_202:IWindowContainer;
      
      private var var_234:IWindowContainer;
      
      private var var_1309:IWindow;
      
      private var var_1308:Boolean;
      
      private var var_890:OfficialRoomListCtrl;
      
      private var var_21:IWindowContainer;
      
      private var var_722:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1306:int = 0;
      
      private var var_210:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_722 = new PopularTagsListCtrl(_navigator);
         var_723 = new GuestRoomListCtrl(_navigator);
         var_890 = new OfficialRoomListCtrl(_navigator);
         var_392 = new Timer(300,1);
         var_392.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_698)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_661)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_504)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_195)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_295)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_660)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_664)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_283)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_225)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_438)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_14 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_210 = ITabContextWindow(var_14.findChildByName("tab_context"));
         var_21 = IWindowContainer(var_14.findChildByName("tab_content"));
         var_234 = IWindowContainer(var_14.findChildByName("custom_content"));
         var_202 = IWindowContainer(var_14.findChildByName("list_content"));
         var_277 = IWindowContainer(var_14.findChildByName("custom_footer"));
         var_1309 = var_14.findChildByName("loading_text");
         var _loc1_:IWindow = var_14.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1307 = IRegionWindow(var_14.findChildByName("to_hotel_view"));
         var_1307.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_14.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_210.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_40,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_14.scaler.setParamFlag(HabboWindowParam.const_649,false);
         var_14.scaler.setParamFlag(HabboWindowParam.const_1374,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_14;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_52)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1308)
         {
            var_1308 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_318:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_244:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_320:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_262:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_197:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_438:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_698:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_661:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_504:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_195:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_523:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_295:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_660:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_664:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_283:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_225:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_202.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_14 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_202);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_722);
         refreshScrollbar(var_723);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1305 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_432)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_603)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_428 = const_494;
            this.var_202.blend = 0;
            if(this.var_234.visible)
            {
               this.var_234.blend = 0;
               this.var_277.blend = 0;
            }
         }
         else
         {
            this.var_428 = const_776;
         }
         this.var_1306 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_234);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_234);
         if(Util.hasVisibleChildren(var_234))
         {
            var_234.visible = true;
         }
         else
         {
            var_234.visible = false;
            var_234.blend = 1;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _navigator = null;
            if(var_14)
            {
               var_14.dispose();
               var_14 = null;
            }
            if(var_21)
            {
               var_21.dispose();
               var_21 = null;
            }
            if(var_392)
            {
               var_392.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_392.reset();
               var_392 = null;
            }
            if(var_722)
            {
               var_722.dispose();
               var_722 = null;
            }
            if(var_723)
            {
               var_723.dispose();
               var_723 = null;
            }
            if(var_890)
            {
               var_890.dispose();
               var_890 = null;
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_44 || param2 != var_14)
         {
            return;
         }
         if(!this.var_392.running)
         {
            this.var_392.reset();
            this.var_392.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_890,"official_rooms");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_723,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_210.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1308 = true;
            var_210.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_722,"popular_tags");
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_14 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_14.visible = true;
         var_14.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.NAVIGATOR,var_14));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_277);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_277);
         if(Util.hasVisibleChildren(var_277))
         {
            var_277.visible = true;
         }
         else
         {
            var_277.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_14 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_234.height = Util.getLowestPoint(var_234);
         var_277.height = Util.getLowestPoint(var_277);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_21,["custom_content","list_content"],var_234.y,8);
         var_202.height = var_202.height + _loc1_ - 0 - 0 + var_2139;
         Util.moveChildrenToColumn(var_21,["list_content","custom_footer"],var_202.y,8);
         var_2139 = var_277.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_202 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_428 == const_776)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_202.blend - _loc2_));
            this.var_202.blend = _loc3_;
            this.var_234.blend = !!var_1305 ? Number(_loc3_) : Number(1);
            this.var_277.blend = !!var_1305 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_428 = const_494;
            }
         }
         else if(var_428 == const_494)
         {
            if(var_1306 % 10 == 1)
            {
               var_1309.visible = true;
            }
            ++var_1306;
            if(!_navigator.data.isLoading())
            {
               var_428 = const_777;
            }
         }
         else if(var_428 == const_777)
         {
            this.refresh();
            var_428 = const_1110;
         }
         else
         {
            var_1309.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_202.blend + _loc2_));
            this.var_202.blend = _loc3_;
            this.var_234.blend = !!var_1305 ? Number(_loc3_) : Number(1);
            this.var_277.blend = !!var_1305 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1307,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1307,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_14 != null)
         {
            var_14.visible = false;
         }
      }
   }
}
