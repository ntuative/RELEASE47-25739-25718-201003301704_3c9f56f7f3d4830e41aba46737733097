package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_575:String = "RWOCM_CLUB_MAIN";
      
      public static const const_707:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1903:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_707);
         var_1903 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1903;
      }
   }
}
