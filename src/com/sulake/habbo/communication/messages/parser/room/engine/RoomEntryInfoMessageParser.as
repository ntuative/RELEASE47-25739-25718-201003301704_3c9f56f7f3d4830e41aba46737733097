package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2019:int;
      
      private var var_379:Boolean;
      
      private var var_2020:Boolean;
      
      private var var_862:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2020 = param1.readBoolean();
         if(var_2020)
         {
            var_2019 = param1.readInteger();
            var_379 = param1.readBoolean();
         }
         else
         {
            var_862 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_862 != null)
         {
            var_862.dispose();
            var_862 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2019;
      }
      
      public function get owner() : Boolean
      {
         return var_379;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2020;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_862;
      }
   }
}
