package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1495:String;
      
      private var var_929:String;
      
      private var var_1497:String;
      
      private var var_1496:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1496 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1495 = _loc5_[0];
         var_1497 = _loc5_[1];
         _name = param2;
         var_929 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1495;
      }
      
      public function get languageCode() : String
      {
         return var_1496;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_929;
      }
      
      public function get method_14() : String
      {
         return var_1497;
      }
      
      public function get id() : String
      {
         return var_1496 + "_" + var_1495 + "." + var_1497;
      }
   }
}
