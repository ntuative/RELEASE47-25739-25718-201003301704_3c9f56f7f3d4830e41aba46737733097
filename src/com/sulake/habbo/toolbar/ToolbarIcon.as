package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_485:ToolbarIconGroup;
      
      private var var_1016:Boolean = false;
      
      private var var_1913:String;
      
      private var var_877:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1017:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_35:String = "-1";
      
      private var var_96:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_678:String;
      
      private var var_1911:int;
      
      private var var_679:Timer;
      
      private var var_1488:Array;
      
      private var var_1019:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2307:Array;
      
      private var var_262:ToolbarBarMenuAnimator;
      
      private var var_402:ToolbarIconAnimator;
      
      private var var_571:Array;
      
      private var var_826:Array;
      
      private var var_825:String = "-1";
      
      private var var_2370:Boolean = true;
      
      private var var_1018:Array;
      
      private var var_1217:Timer;
      
      private var var_1912:int;
      
      private var var_84:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_571 = new Array();
         var_826 = new Array();
         var_2307 = new Array();
         var_1019 = new ToolbarIconBouncer(0.8,1);
         super();
         var_485 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_678 = param4;
         _events = param5;
         var_262 = param6;
         var_1217 = new Timer(40,40);
         var_1217.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_96 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_430,HabboWindowStyle.const_41,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_96.background = true;
         var_96.alphaTreshold = 0;
         var_96.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,HabboWindowParam.const_41,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_96.addChild(_window);
         _window.addEventListener(WindowEvent.const_44,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1488[var_1018.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1912;
      }
      
      public function get iconId() : String
      {
         return var_678;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_877 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_35 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_96 == null || _window == null)
         {
            return;
         }
         var_96.width = _window.width;
         var_96.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_84 = (0 - 0) / 2;
            _y = var_877 + (0 - 0) / 2;
         }
         else
         {
            var_84 = var_877 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_96.x = var_84;
         var_96.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_96 != null)
         {
            var_96.dispose();
            var_96 = null;
         }
         var_571 = null;
         var_826 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_262 = null;
         var_402 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_571.indexOf(param1) < 0)
         {
            var_571.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_826.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1016)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_262)
               {
                  var_262.repositionWindow(var_678,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_58);
                  _loc4_.iconId = var_678;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1017;
                  }
               }
               break;
            case WindowMouseEvent.const_29:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_825;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_571.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_826[var_571.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1016 = param1;
         if(var_96 != null)
         {
            var_96.visible = var_1016;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_96 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_96.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_96.toolTipCaption = "${toolbar.icon.tooltip." + var_1913.toLowerCase() + "}";
         }
         var_96.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_262 != null)
         {
            var_262.animateWindowIn(this,param1,param2,var_678,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_402 != null && _window != null)
         {
            var_402.update(_window);
            if(var_402.hasNextState())
            {
               state = var_402.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1488 = new Array();
         var_1018 = new Array();
         var_1913 = param1.@id;
         var_1912 = int(param1.@window_offset_from_icon);
         var_1911 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1017 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_825 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1018.push(_loc5_.id);
               var_1488.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1017 == "-1")
                  {
                     var_1017 = _loc5_.id;
                  }
                  if(var_825 == "-1")
                  {
                     var_825 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_35 = var_825;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_262 != null)
         {
            var_262.hideWindow(param1,param2,var_678,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_262 != null)
         {
            var_262.positionWindow(this,param1,param2,var_678,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_262 != null)
         {
            var_262.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1016;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1019 != null && _window != null)
         {
            var_1019.update();
            _window.y = var_1019.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_679 != null)
         {
            var_679.stop();
            var_679 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1016)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_402 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_84,_y,_bitmapData);
            if(false)
            {
               var_679 = new Timer(_loc1_.timer);
               var_679.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_679.start();
            }
            if(_loc1_.bounce)
            {
               var_1019.reset(-7);
               var_1217.reset();
               var_1217.start();
            }
         }
         else
         {
            var_402 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1911 + var_485.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_35);
      }
      
      public function get window() : IWindow
      {
         return var_96;
      }
      
      public function get x() : Number
      {
         return var_84;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_826[var_571.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_485;
      }
   }
}
