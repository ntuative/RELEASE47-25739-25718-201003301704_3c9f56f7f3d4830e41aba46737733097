package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_798:int;
      
      private var _right:int;
      
      private var var_797:int;
      
      private var var_799:int;
      
      private var var_179:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_797 = param1;
         var_799 = param2;
         _right = param3;
         var_798 = param4;
         var_179 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_798 = param1;
         var_179(this);
      }
      
      public function get left() : int
      {
         return var_797;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_797 == 0 && _right == 0 && var_799 == 0 && var_798 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_799 = param1;
         var_179(this);
      }
      
      public function get top() : int
      {
         return var_799;
      }
      
      public function set left(param1:int) : void
      {
         var_797 = param1;
         var_179(this);
      }
      
      public function get bottom() : int
      {
         return var_798;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_797,var_799,_right,var_798,param1);
      }
      
      public function dispose() : void
      {
         var_179 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_179(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
