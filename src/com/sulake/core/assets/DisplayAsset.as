package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_21:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_929:String;
      
      protected var var_444:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_444 = param1;
         var_929 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_444;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            var_21 = DisplayAsset(param1).var_21;
            var_444 = DisplayAsset(param1).var_444;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return var_929;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            var_21 = param1 as DisplayObject;
            if(var_21 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            var_21 = DisplayAsset(param1).var_21;
            var_444 = DisplayAsset(param1).var_444;
            if(var_21 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return var_21;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(var_21.loaderInfo.loader != null)
               {
                  var_21.loaderInfo.loader.unload();
               }
            }
            var_21 = null;
            var_444 = null;
            _disposed = true;
            var_929 = null;
         }
      }
   }
}
