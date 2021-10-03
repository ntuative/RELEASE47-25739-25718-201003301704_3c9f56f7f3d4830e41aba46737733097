package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2149:int;
      
      private var var_2148:String;
      
      private var var_1702:int;
      
      private var _disposed:Boolean;
      
      private var var_2150:int;
      
      private var var_2118:String;
      
      private var var_1351:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2118 = param1.readString();
         var_2149 = param1.readInteger();
         var_1702 = param1.readInteger();
         var_2148 = param1.readString();
         var_2150 = param1.readInteger();
         var_1351 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2150;
      }
      
      public function get worldId() : int
      {
         return var_1702;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_2118;
      }
      
      public function get unitPort() : int
      {
         return var_2149;
      }
      
      public function get castLibs() : String
      {
         return var_2148;
      }
      
      public function get nodeId() : int
      {
         return var_1351;
      }
   }
}
