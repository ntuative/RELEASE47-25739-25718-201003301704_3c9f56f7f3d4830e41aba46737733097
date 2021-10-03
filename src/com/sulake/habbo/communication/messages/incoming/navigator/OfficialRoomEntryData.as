package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1205:int = 4;
      
      public static const const_538:int = 3;
      
      public static const const_608:int = 2;
      
      public static const const_919:int = 1;
       
      
      private var var_1958:String;
      
      private var _disposed:Boolean;
      
      private var var_1627:int;
      
      private var var_1961:Boolean;
      
      private var var_863:String;
      
      private var var_846:PublicRoomData;
      
      private var var_1960:int;
      
      private var _index:int;
      
      private var var_1962:String;
      
      private var _type:int;
      
      private var var_1641:String;
      
      private var var_845:GuestRoomData;
      
      private var var_1959:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1958 = param1.readString();
         var_1959 = param1.readString();
         var_1961 = param1.readInteger() == 1;
         var_1962 = param1.readString();
         var_863 = param1.readString();
         var_1960 = param1.readInteger();
         var_1627 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_919)
         {
            var_1641 = param1.readString();
         }
         else if(_type == const_538)
         {
            var_846 = new PublicRoomData(param1);
         }
         else if(_type == const_608)
         {
            var_845 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1960;
      }
      
      public function get popupCaption() : String
      {
         return var_1958;
      }
      
      public function get userCount() : int
      {
         return var_1627;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1961;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_919)
         {
            return 0;
         }
         if(this.type == const_608)
         {
            return this.var_845.maxUserCount;
         }
         if(this.type == const_538)
         {
            return this.var_846.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1959;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_845 != null)
         {
            this.var_845.dispose();
            this.var_845 = null;
         }
         if(this.var_846 != null)
         {
            this.var_846.dispose();
            this.var_846 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_845;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1962;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_846;
      }
      
      public function get picRef() : String
      {
         return var_863;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1641;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
