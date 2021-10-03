package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_150:Array;
      
      private var var_35:Boolean = false;
      
      private var var_1464:int = 0;
      
      private var var_1463:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_479:Map;
      
      private var var_1857:int = 0;
      
      private var var_1465:int = 0;
      
      private var var_147:IHabboConfigurationManager;
      
      private var var_1191:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1462:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_35)
         {
            return;
         }
         if(getTimer() - var_1464 > var_1463)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1464 = getTimer();
         var_479.add(var_1191,var_1464);
         _connection.send(new LatencyPingRequestMessageComposer(var_1191));
         ++var_1191;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_147 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1463 = int(var_147.getKey("latencytest.interval"));
         var_1462 = int(var_147.getKey("latencytest.report.index"));
         var_1857 = int(var_147.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1463 < 1)
         {
            return;
         }
         var_479 = new Map();
         var_150 = new Array();
         var_35 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_479 == null || var_150 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_479.getValue(_loc2_.requestId);
         var_479.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_150.push(_loc4_);
         if(var_150.length == var_1462 && var_1462 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_150.length)
            {
               _loc5_ += var_150[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_150.length)
            {
               if(var_150[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_150[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_150 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1465) > var_1857 || var_1465 == 0)
            {
               var_1465 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_150.length);
               _connection.send(_loc11_);
            }
            var_150 = [];
         }
      }
      
      public function dispose() : void
      {
         var_35 = false;
         var_147 = null;
         _communication = null;
         _connection = null;
         if(var_479 != null)
         {
            var_479.dispose();
            var_479 = null;
         }
         var_150 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_147 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
