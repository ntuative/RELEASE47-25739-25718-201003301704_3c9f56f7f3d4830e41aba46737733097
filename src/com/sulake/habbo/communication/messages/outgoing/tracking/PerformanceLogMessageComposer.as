package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1083:int = 0;
      
      private var var_1329:int = 0;
      
      private var var_2176:String = "";
      
      private var var_1084:int = 0;
      
      private var var_2175:String = "";
      
      private var var_2172:int = 0;
      
      private var var_1592:String = "";
      
      private var var_2173:int = 0;
      
      private var var_2171:int = 0;
      
      private var var_2174:String = "";
      
      private var var_2170:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2173 = param1;
         var_2174 = param2;
         var_1592 = param3;
         var_2176 = param4;
         var_2175 = param5;
         if(param6)
         {
            var_1329 = 1;
         }
         else
         {
            var_1329 = 0;
         }
         var_2172 = param7;
         var_2171 = param8;
         var_1084 = param9;
         var_2170 = param10;
         var_1083 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2173,var_2174,var_1592,var_2176,var_2175,var_1329,var_2172,var_2171,var_1084,var_2170,var_1083];
      }
      
      public function dispose() : void
      {
      }
   }
}
