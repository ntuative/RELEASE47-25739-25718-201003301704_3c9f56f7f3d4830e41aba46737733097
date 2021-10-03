package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_740:String;
      
      private var var_1965:int;
      
      private var var_1589:Boolean;
      
      private var _roomId:int;
      
      private var var_1966:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1589 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_740 = param1.readString();
         var_1966 = param1.readInteger();
         var_1965 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1589;
      }
      
      public function get roomName() : String
      {
         return var_740;
      }
      
      public function get enterMinute() : int
      {
         return var_1965;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1966;
      }
   }
}
