package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SignMessageComposer implements IMessageComposer
   {
       
      
      private var var_1733:int;
      
      public function SignMessageComposer(param1:int)
      {
         super();
         var_1733 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1733];
      }
      
      public function dispose() : void
      {
      }
   }
}
