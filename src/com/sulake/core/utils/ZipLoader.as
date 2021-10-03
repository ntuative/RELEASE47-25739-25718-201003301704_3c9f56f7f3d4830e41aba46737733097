package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_408:FZip;
      
      private var var_1236:Array;
      
      private var var_1972:uint = 0;
      
      private var var_854:int = 0;
      
      private var var_2371:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1236 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1236;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_18.content);
         var_1236.push(var_18.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_854;
         if(var_1236.length == var_1972)
         {
            var_18.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_18.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_18.loadBytes(var_408.getFileAt(var_854).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_325 = param1;
         if(var_408)
         {
            var_408.close();
         }
         var_408 = new FZip();
         var_408.addEventListener(Event.COMPLETE,onComplete);
         var_408.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_408.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_408.load(var_325);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_854 = 0;
         var_1972 = var_408.getFileCount();
         removeEventListeners();
         var_18.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_18.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_18.loadBytes(var_408.getFileAt(var_854).content);
      }
   }
}
