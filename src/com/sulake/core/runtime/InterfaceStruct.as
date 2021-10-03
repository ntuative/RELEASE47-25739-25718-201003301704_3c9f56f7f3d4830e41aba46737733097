package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_430:uint;
      
      private var var_1068:IUnknown;
      
      private var var_1321:String;
      
      private var var_1067:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1067 = param1;
         var_1321 = getQualifiedClassName(var_1067);
         var_1068 = param2;
         var_430 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1067;
      }
      
      public function get disposed() : Boolean
      {
         return var_1068 == null;
      }
      
      public function get references() : uint
      {
         return var_430;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_430) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1068;
      }
      
      public function get iis() : String
      {
         return var_1321;
      }
      
      public function reserve() : uint
      {
         return ++var_430;
      }
      
      public function dispose() : void
      {
         var_1067 = null;
         var_1321 = null;
         var_1068 = null;
         var_430 = 0;
      }
   }
}
