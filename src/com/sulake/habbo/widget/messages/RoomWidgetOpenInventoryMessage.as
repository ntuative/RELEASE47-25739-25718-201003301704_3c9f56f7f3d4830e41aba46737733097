package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_829:String = "inventory_badges";
      
      public static const const_1378:String = "inventory_clothes";
      
      public static const const_1296:String = "inventory_furniture";
      
      public static const const_612:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_870:String = "inventory_effects";
       
      
      private var var_1976:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_612);
         var_1976 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1976;
      }
   }
}
