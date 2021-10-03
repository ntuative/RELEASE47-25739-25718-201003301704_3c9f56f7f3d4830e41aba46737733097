package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1659:int;
      
      private var var_1660:int;
      
      private var var_2196:Boolean;
      
      private var var_2197:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2198:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1660 = param1;
         var_1659 = param2;
         var_2197 = param3;
         var_2198 = param4;
         var_2196 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1660,var_1659,var_2197,var_2198,int(var_2196)];
      }
      
      public function dispose() : void
      {
      }
   }
}
