package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1752:Array;
      
      private var var_1731:String;
      
      private var var_1751:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1731 = param1;
         var_1752 = param2;
         var_1751 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1731;
      }
      
      public function get yieldList() : Array
      {
         return var_1752;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1751;
      }
   }
}
