package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2200:int;
      
      private var var_1014:int;
      
      private var var_2201:int;
      
      private var var_1587:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1587 = param1.readInteger();
         var_2201 = param1.readInteger();
         var_1014 = param1.readInteger();
         var_2200 = param1.readInteger();
         var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1587);
      }
      
      public function get chatRecordId() : int
      {
         return var_2200;
      }
      
      public function get reportedUserId() : int
      {
         return var_1014;
      }
      
      public function get callerUserId() : int
      {
         return var_2201;
      }
      
      public function get callId() : int
      {
         return var_1587;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_113;
      }
   }
}
