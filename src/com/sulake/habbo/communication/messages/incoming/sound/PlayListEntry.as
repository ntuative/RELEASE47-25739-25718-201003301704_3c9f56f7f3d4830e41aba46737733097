package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1710:int;
      
      private var var_1711:int = 0;
      
      private var var_1712:String;
      
      private var var_1713:int;
      
      private var var_1714:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1710 = param1;
         var_1713 = param2;
         var_1714 = param3;
         var_1712 = param4;
      }
      
      public function get length() : int
      {
         return var_1713;
      }
      
      public function get name() : String
      {
         return var_1714;
      }
      
      public function get creator() : String
      {
         return var_1712;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1711;
      }
      
      public function get id() : int
      {
         return var_1710;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1711 = param1;
      }
   }
}
