package com.sulake.habbo.navigator
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class AlertView implements IDisposable
   {
      
      private static var var_1566:Dictionary = new Dictionary();
       
      
      private var _disposed:Boolean;
      
      private var var_279:IFrameWindow;
      
      private var _navigator:HabboNavigator;
      
      private var _title:String;
      
      private var var_1311:String;
      
      public function AlertView(param1:HabboNavigator, param2:String, param3:String = null)
      {
         super();
         _navigator = param1;
         var_1311 = param2;
         _title = param3;
      }
      
      function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_279 != null)
         {
            var_279.destroy();
            var_279 = null;
         }
         _navigator = null;
      }
      
      private function getAlert() : IFrameWindow
      {
         var _loc1_:IFrameWindow = IFrameWindow(_navigator.getXmlWindow(this.var_1311));
         var _loc2_:IWindow = _loc1_.findChildByTag("close");
         _loc2_.procedure = onClose;
         return _loc1_;
      }
      
      public function get navigator() : HabboNavigator
      {
         return _navigator;
      }
      
      function setupContent(param1:IWindowContainer) : void
      {
      }
      
      public function show() : void
      {
         var _loc1_:IFrameWindow = IFrameWindow(var_1566[var_1311]);
         if(_loc1_ != null)
         {
            _loc1_.dispose();
         }
         var_279 = getAlert();
         if(_title != null)
         {
            var_279.caption = _title;
         }
         setupContent(var_279.content);
         var _loc2_:Rectangle = Util.getLocationRelativeTo(var_279.desktop,var_279.width,var_279.height);
         var_279.x = _loc2_.x;
         var_279.y = _loc2_.y;
         var_1566[var_1311] = var_279;
      }
   }
}
