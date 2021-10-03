package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class SSOTicket extends EventDispatcher
   {
      
      public static const const_245:String = "failure";
      
      public static const const_328:String = "success";
       
      
      private var _assets:IAssetLibrary;
      
      private var var_1245:String;
      
      private var var_2004:String;
      
      private var var_1513:String;
      
      private var var_1244:IHabboWebLogin;
      
      private var var_18:URLLoader;
      
      private var var_2372:String;
      
      public function SSOTicket(param1:IAssetLibrary, param2:IHabboWebLogin, param3:String)
      {
         super();
         _assets = param1;
         var_1244 = param2;
         var_1245 = "http://" + param3 + "/client";
         var_1244.init();
         var_1244.addEventListener(HabboWeb.const_206,requestClientURL);
      }
      
      public function get shockwaveClientUrl() : String
      {
         return var_2004;
      }
      
      private function requestClientURL(param1:Event = null) : void
      {
         var _loc2_:String = var_1245;
         if(_assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + var_1245);
         }
         var _loc3_:URLRequest = new URLRequest(var_1245);
         if(_assets.hasAsset(_loc2_))
         {
            _assets.removeAsset(_assets.getAssetByName(_loc2_));
         }
         var _loc4_:AssetLoaderStruct = _assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_32,clientURLComplete);
      }
      
      public function get ticket() : String
      {
         return var_1513;
      }
      
      private function clientURLComplete(param1:Event = null) : void
      {
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         var data:String = loaderStruct.assetLoader.content as String;
         if(data.indexOf("account/reauthenticate\"") > -1)
         {
            var_1244.requestReAuthenticate();
         }
         else
         {
            try
            {
               var_1513 = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
               var_2004 = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
               if(false)
               {
                  dispatchEvent(new Event(const_328));
               }
               else
               {
                  dispatchEvent(new Event(const_245));
               }
            }
            catch(e:Error)
            {
               trace(e);
               dispatchEvent(new Event(const_245));
            }
         }
      }
   }
}
