package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class Selector
   {
       
      
      private var var_480:IBitmapWrapperWindow;
      
      private var _window:IWindowContainer;
      
      private var var_1195:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_994:BitmapData;
      
      private var _windowManager:IHabboWindowManager;
      
      public function Selector(param1:HabboAvatarEditor)
      {
         var _loc3_:* = null;
         super();
         _windowManager = param1.windowManager;
         _assetLibrary = param1.assets;
         var _loc2_:XmlAsset = _assetLibrary.getAssetByName("Selector") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc2_.content as XML));
         _window.background = true;
         _window.alphaTreshold = 0;
         if(_window != null)
         {
            var_480 = _window.findChildByName("bitmap") as IBitmapWrapperWindow;
         }
         _loc3_ = _assetLibrary.getAssetByName("selectOutfit") as BitmapDataAsset;
         var_994 = (_loc3_.content as BitmapData).clone();
         _loc3_ = _assetLibrary.getAssetByName("selectOutfit_over") as BitmapDataAsset;
         var_1195 = (_loc3_.content as BitmapData).clone();
         update(var_994);
         _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,windowEventProc);
         _window.addEventListener(WindowMouseEvent.const_29,windowEventProc);
      }
      
      private function windowEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            Logger.log("[Selector] Click! This should be over-ridden!");
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            update(var_1195);
         }
         else if(param1.type == WindowMouseEvent.const_29)
         {
            update(var_994);
         }
      }
      
      private function update(param1:BitmapData) : void
      {
         var_480.bitmap = new BitmapData(var_480.width,var_480.height,true,16777215);
         var _loc2_:int = (0 - param1.width) / 2;
         var _loc3_:int = 0 - param1.height;
         var_480.bitmap.copyPixels(param1,param1.rect,new Point(_loc2_,_loc3_));
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function dispose() : void
      {
         _window.dispose();
         var_1195 = null;
         var_994 = null;
         var_480 = null;
      }
   }
}
