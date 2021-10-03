package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2233:Class;
      
      private var var_2232:Class;
      
      private var var_2231:String;
      
      private var var_1354:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2231 = param1;
         var_2232 = param2;
         var_2233 = param3;
         if(rest == null)
         {
            var_1354 = new Array();
         }
         else
         {
            var_1354 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2233;
      }
      
      public function get assetClass() : Class
      {
         return var_2232;
      }
      
      public function get mimeType() : String
      {
         return var_2231;
      }
      
      public function get fileTypes() : Array
      {
         return var_1354;
      }
   }
}
