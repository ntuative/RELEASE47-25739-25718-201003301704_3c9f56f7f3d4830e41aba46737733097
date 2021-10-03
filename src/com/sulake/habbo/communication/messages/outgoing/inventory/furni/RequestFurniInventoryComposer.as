package com.sulake.habbo.communication.messages.outgoing.inventory.furni
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RequestFurniInventoryComposer implements IMessageComposer
   {
       
      
      private var var_1833:int = 0;
      
      private var var_1832:int = 0;
      
      public function RequestFurniInventoryComposer(param1:int, param2:int)
      {
         super();
         var_1833 = param1;
         var_1832 = param2;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(var_1833,var_1832);
         return _loc1_;
      }
      
      public function dispose() : void
      {
      }
   }
}
