package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_822:String = "select_outfit";
       
      
      private var var_1620:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_822);
         var_1620 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1620;
      }
   }
}
