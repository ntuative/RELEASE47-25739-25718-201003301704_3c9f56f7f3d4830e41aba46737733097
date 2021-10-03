package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1591:GarbageMonitor = null;
      
      private var var_1357:int = 0;
      
      private var var_1329:Boolean = false;
      
      private var var_2176:String = "";
      
      private var var_1592:String = "";
      
      private var var_362:Number = 0;
      
      private var var_1358:int = 10;
      
      private var var_2332:Array;
      
      private var var_627:int = 0;
      
      private var var_1359:int = 60;
      
      private var var_1083:int = 0;
      
      private var var_1084:int = 0;
      
      private var var_2175:String = "";
      
      private var var_2234:Number = 0;
      
      private var var_1356:int = 1000;
      
      private var var_2235:Boolean = true;
      
      private var var_2236:Number = 0.15;
      
      private var var_147:IHabboConfigurationManager = null;
      
      private var var_2174:String = "";
      
      private var var_1355:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2332 = [];
         super();
         var_1592 = Capabilities.version;
         var_2176 = Capabilities.os;
         var_1329 = Capabilities.isDebugger;
         var_2174 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1591 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1357 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1591.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1591.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_362;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1359 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1592;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1084;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1356)
         {
            ++var_1083;
            _loc3_ = true;
         }
         else
         {
            ++var_627;
            if(var_627 <= 1)
            {
               var_362 = param1;
            }
            else
            {
               _loc4_ = Number(var_627);
               var_362 = var_362 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1357 > var_1359 * 1000 && var_1355 < var_1358)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_362);
            _loc5_ = true;
            if(var_2235 && var_1355 > 0)
            {
               _loc6_ = differenceInPercents(var_2234,var_362);
               if(_loc6_ < var_2236)
               {
                  _loc5_ = false;
               }
            }
            var_1357 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2234 = var_362;
               if(sendReport())
               {
                  ++var_1355;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1358 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1356 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2174,var_1592,var_2176,var_2175,var_1329,_loc4_,_loc3_,var_1084,var_362,var_1083);
            _connection.send(_loc1_);
            var_1084 = 0;
            var_362 = 0;
            var_627 = 0;
            var_1083 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_147 = param1;
         var_1359 = int(var_147.getKey("performancetest.interval","60"));
         var_1356 = int(var_147.getKey("performancetest.slowupdatelimit","1000"));
         var_1358 = int(var_147.getKey("performancetest.reportlimit","10"));
         var_2236 = Number(var_147.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2235 = Boolean(int(var_147.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
