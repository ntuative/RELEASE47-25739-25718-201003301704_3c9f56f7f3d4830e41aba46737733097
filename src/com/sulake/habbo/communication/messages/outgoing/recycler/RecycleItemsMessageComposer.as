package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_829:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_829 = new Array();
         var_829.push(param1.length);
         var_829 = var_829.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_829;
      }
   }
}
