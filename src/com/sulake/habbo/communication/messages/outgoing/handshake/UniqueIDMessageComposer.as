package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class UniqueIDMessageComposer implements IMessageComposer
   {
       
      
      private var var_861:String;
      
      public function UniqueIDMessageComposer(param1:String)
      {
         super();
         var_861 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_861];
      }
      
      public function dispose() : void
      {
      }
   }
}
