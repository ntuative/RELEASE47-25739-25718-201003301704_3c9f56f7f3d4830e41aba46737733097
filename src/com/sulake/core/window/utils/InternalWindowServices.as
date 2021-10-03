package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_118:DisplayObject;
      
      private var var_2308:uint;
      
      private var var_839:IWindowToolTipAgentService;
      
      private var var_840:IWindowMouseScalingService;
      
      private var var_230:IWindowContext;
      
      private var var_843:IWindowFocusManagerService;
      
      private var var_842:IWindowMouseListenerService;
      
      private var var_841:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2308 = 0;
         var_118 = param2;
         var_230 = param1;
         var_841 = new WindowMouseDragger(param2);
         var_840 = new WindowMouseScaler(param2);
         var_842 = new WindowMouseListener(param2);
         var_843 = new FocusManager(param2);
         var_839 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_840;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_843;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_839;
      }
      
      public function dispose() : void
      {
         if(var_841 != null)
         {
            var_841.dispose();
            var_841 = null;
         }
         if(var_840 != null)
         {
            var_840.dispose();
            var_840 = null;
         }
         if(var_842 != null)
         {
            var_842.dispose();
            var_842 = null;
         }
         if(var_843 != null)
         {
            var_843.dispose();
            var_843 = null;
         }
         if(var_839 != null)
         {
            var_839.dispose();
            var_839 = null;
         }
         var_230 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_842;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_841;
      }
   }
}
