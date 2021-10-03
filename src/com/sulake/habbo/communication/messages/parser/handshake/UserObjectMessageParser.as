package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_581:String;
      
      private var var_2295:String;
      
      private var var_2293:int;
      
      private var var_2292:int;
      
      private var var_1124:String;
      
      private var var_1213:String;
      
      private var _name:String;
      
      private var var_456:int;
      
      private var var_779:int;
      
      private var var_2291:int;
      
      private var var_1636:int;
      
      private var var_2294:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2292;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1213;
      }
      
      public function get customData() : String
      {
         return this.var_2295;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_456;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2293;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2294;
      }
      
      public function get figure() : String
      {
         return this.var_581;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1636;
      }
      
      public function get sex() : String
      {
         return this.var_1124;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_581 = param1.readString();
         this.var_1124 = param1.readString();
         this.var_2295 = param1.readString();
         this.var_1213 = param1.readString();
         this.var_2291 = param1.readInteger();
         this.var_2294 = param1.readString();
         this.var_2293 = param1.readInteger();
         this.var_2292 = param1.readInteger();
         this.var_1636 = param1.readInteger();
         this.var_779 = param1.readInteger();
         this.var_456 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2291;
      }
      
      public function get respectLeft() : int
      {
         return this.var_779;
      }
   }
}
