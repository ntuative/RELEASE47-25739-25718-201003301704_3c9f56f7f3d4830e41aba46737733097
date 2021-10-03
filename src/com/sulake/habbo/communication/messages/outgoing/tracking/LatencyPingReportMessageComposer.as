package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_1724:int;
      
      private var var_1726:int;
      
      private var var_1725:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         var_1724 = param1;
         var_1726 = param2;
         var_1725 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1724,var_1726,var_1725];
      }
   }
}
