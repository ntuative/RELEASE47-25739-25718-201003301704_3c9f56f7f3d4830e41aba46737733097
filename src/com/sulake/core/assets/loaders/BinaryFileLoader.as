package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_18:URLLoader;
      
      protected var var_929:String;
      
      protected var _type:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_929 = param2 == null ? "" : param2.url;
         _type = param1;
         var_18 = new URLLoader();
         var_18.addEventListener(Event.COMPLETE,loadEventHandler);
         var_18.addEventListener(Event.UNLOAD,loadEventHandler);
         var_18.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_18.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_18.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_18.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_18.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_929 = param1.url;
         var_18.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_18.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_18.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_18.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_18.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_18.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_18.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_18.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_18.close();
            var_18 = null;
            _type = null;
            var_929 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_929;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_18.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_18.data;
      }
   }
}
