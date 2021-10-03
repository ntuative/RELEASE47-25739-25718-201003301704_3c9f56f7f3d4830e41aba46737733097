package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2334:Boolean;
      
      private var var_2336:int;
      
      private var var_2333:Boolean;
      
      private var var_1583:String;
      
      private var var_1213:String;
      
      private var var_1739:int;
      
      private var var_2185:String;
      
      private var var_2335:String;
      
      private var var_2184:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1739 = param1.readInteger();
         this.var_1583 = param1.readString();
         this.var_2185 = param1.readString();
         this.var_2334 = param1.readBoolean();
         this.var_2333 = param1.readBoolean();
         param1.readString();
         this.var_2336 = param1.readInteger();
         this.var_2184 = param1.readString();
         this.var_2335 = param1.readString();
         this.var_1213 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1213;
      }
      
      public function get avatarName() : String
      {
         return this.var_1583;
      }
      
      public function get avatarId() : int
      {
         return this.var_1739;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2334;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2335;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2184;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2333;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2185;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2336;
      }
   }
}
