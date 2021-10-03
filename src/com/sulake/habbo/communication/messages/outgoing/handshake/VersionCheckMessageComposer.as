package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2002:String;
      
      private var var_1245:String;
      
      private var var_2003:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2003 = param1;
         var_1245 = param2;
         var_2002 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2003,var_1245,var_2002];
      }
      
      public function dispose() : void
      {
      }
   }
}
