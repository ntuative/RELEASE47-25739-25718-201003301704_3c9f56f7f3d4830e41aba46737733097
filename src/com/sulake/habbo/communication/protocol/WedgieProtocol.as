package com.sulake.habbo.communication.protocol
{
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.communication.protocol.IProtocolDecoder;
   import com.sulake.core.communication.protocol.IProtocolEncoder;
   import flash.utils.ByteArray;
   
   public class WedgieProtocol implements IProtocol
   {
      
      public static const const_1154:uint = 1;
      
      public static const const_1187:uint = 2;
       
      
      private var var_917:IProtocolDecoder;
      
      private var var_1086:IProtocolEncoder;
      
      public function WedgieProtocol()
      {
         super();
         var_1086 = new WedgieEncoder();
         var_917 = new WedgieDecoder();
      }
      
      public function getMessages(param1:ByteArray, param2:Array) : uint
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         param1.position = 0;
         var _loc3_:uint = param1.position;
         var _loc4_:ByteArray = new ByteArray();
         while(param1.bytesAvailable)
         {
            _loc5_ = uint(param1.readUnsignedByte());
            if(_loc5_ == const_1154)
            {
               _loc4_.position = 0;
               _loc6_ = var_917.getID(_loc4_);
               param2.push([_loc6_,_loc4_]);
               _loc4_ = new ByteArray();
               _loc3_ = param1.position;
            }
            else
            {
               _loc4_.writeByte(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public function get encoder() : IProtocolEncoder
      {
         return var_1086;
      }
      
      public function get decoder() : IProtocolDecoder
      {
         return var_917;
      }
      
      public function dispose() : void
      {
         var_1086.dispose();
         var_917.dispose();
         var_1086 = null;
         var_917 = null;
      }
   }
}
