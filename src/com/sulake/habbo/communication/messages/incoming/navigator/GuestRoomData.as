package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1627:int;
      
      private var var_1750:String;
      
      private var var_1746:int;
      
      private var var_1745:int;
      
      private var var_716:Boolean;
      
      private var var_1743:Boolean;
      
      private var var_378:int;
      
      private var var_1152:String;
      
      private var var_1748:int;
      
      private var var_1170:int;
      
      private var _ownerName:String;
      
      private var var_740:String;
      
      private var var_1749:int;
      
      private var var_1744:RoomThumbnailData;
      
      private var var_1747:Boolean;
      
      private var var_622:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_622 = new Array();
         super();
         var_378 = param1.readInteger();
         var_716 = param1.readBoolean();
         var_740 = param1.readString();
         _ownerName = param1.readString();
         var_1748 = param1.readInteger();
         var_1627 = param1.readInteger();
         var_1749 = param1.readInteger();
         var_1152 = param1.readString();
         var_1746 = param1.readInteger();
         var_1747 = param1.readBoolean();
         var_1745 = param1.readInteger();
         var_1170 = param1.readInteger();
         var_1750 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_622.push(_loc4_);
            _loc3_++;
         }
         var_1744 = new RoomThumbnailData(param1);
         var_1743 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1749;
      }
      
      public function get roomName() : String
      {
         return var_740;
      }
      
      public function get userCount() : int
      {
         return var_1627;
      }
      
      public function get score() : int
      {
         return var_1745;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1750;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1747;
      }
      
      public function get tags() : Array
      {
         return var_622;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function get event() : Boolean
      {
         return var_716;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1170;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1746;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1744;
      }
      
      public function get doorMode() : int
      {
         return var_1748;
      }
      
      public function get flatId() : int
      {
         return var_378;
      }
      
      public function get description() : String
      {
         return var_1152;
      }
   }
}
