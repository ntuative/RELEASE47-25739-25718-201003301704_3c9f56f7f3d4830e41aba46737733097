package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1970:String;
      
      private var var_378:int;
      
      private var var_2154:String;
      
      private var var_2153:String;
      
      private var var_2156:int;
      
      private var var_2155:String;
      
      private var var_2157:int;
      
      private var var_622:Array;
      
      private var var_1016:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_622 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1016 = false;
            return;
         }
         this.var_1016 = true;
         var_2156 = int(_loc2_);
         var_2154 = param1.readString();
         var_378 = int(param1.readString());
         var_2157 = param1.readInteger();
         var_1970 = param1.readString();
         var_2153 = param1.readString();
         var_2155 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_622.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2157;
      }
      
      public function get eventName() : String
      {
         return var_1970;
      }
      
      public function get eventDescription() : String
      {
         return var_2153;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2154;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get creationTime() : String
      {
         return var_2155;
      }
      
      public function get exists() : Boolean
      {
         return var_1016;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2156;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_622 = null;
      }
      
      public function get flatId() : int
      {
         return var_378;
      }
   }
}
