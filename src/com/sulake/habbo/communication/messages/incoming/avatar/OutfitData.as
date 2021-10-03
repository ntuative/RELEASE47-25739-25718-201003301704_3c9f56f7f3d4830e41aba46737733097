package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2217:String;
      
      private var var_1148:String;
      
      private var var_1983:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1983 = param1.readInteger();
         var_2217 = param1.readString();
         var_1148 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_1148;
      }
      
      public function get figureString() : String
      {
         return var_2217;
      }
      
      public function get slotId() : int
      {
         return var_1983;
      }
   }
}
