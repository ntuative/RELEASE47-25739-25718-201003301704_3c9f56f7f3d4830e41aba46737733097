package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2130:int;
      
      private var var_2129:Boolean;
      
      private var _offerId:int;
      
      private var var_1881:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2129 = param1.readBoolean();
         var_2130 = param1.readInteger();
         var_1881 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1881;
      }
      
      public function get monthsRequired() : int
      {
         return var_2130;
      }
      
      public function get isVip() : Boolean
      {
         return var_2129;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
