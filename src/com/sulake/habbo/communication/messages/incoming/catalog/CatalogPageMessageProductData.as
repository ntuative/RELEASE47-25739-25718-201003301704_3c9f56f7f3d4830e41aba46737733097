package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const include:String = "e";
      
      public static const const_82:String = "i";
      
      public static const const_78:String = "s";
       
      
      private var var_1071:String;
      
      private var var_1337:String;
      
      private var var_1335:int;
      
      private var var_1607:int;
      
      private var var_1072:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1337 = param1.readString();
         var_1607 = param1.readInteger();
         var_1071 = param1.readString();
         var_1072 = param1.readInteger();
         var_1335 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1072;
      }
      
      public function get productType() : String
      {
         return var_1337;
      }
      
      public function get expiration() : int
      {
         return var_1335;
      }
      
      public function get furniClassId() : int
      {
         return var_1607;
      }
      
      public function get extraParam() : String
      {
         return var_1071;
      }
   }
}
