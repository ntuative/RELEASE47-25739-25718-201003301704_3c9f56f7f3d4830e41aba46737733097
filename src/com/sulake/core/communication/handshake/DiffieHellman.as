package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1304:BigInteger;
      
      private var var_616:BigInteger;
      
      private var var_1561:BigInteger;
      
      private var var_1562:BigInteger;
      
      private var var_2137:BigInteger;
      
      private var var_2060:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1304 = param1;
         var_1561 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2137.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1562 = new BigInteger();
         var_1562.fromRadix(param1,param2);
         var_2137 = var_1562.modPow(var_616,var_1304);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2060.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1304.toString() + ",generator: " + var_1561.toString() + ",secret: " + param1);
         var_616 = new BigInteger();
         var_616.fromRadix(param1,param2);
         var_2060 = var_1561.modPow(var_616,var_1304);
         return true;
      }
   }
}
