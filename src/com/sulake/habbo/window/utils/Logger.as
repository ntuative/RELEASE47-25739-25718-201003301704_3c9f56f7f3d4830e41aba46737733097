package com.sulake.habbo.window.utils
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.ILogger;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.geom.Rectangle;
   import iid.IIDCoreWindowManager;
   
   public class Logger extends Component implements ILogger
   {
       
      
      private var var_1439:ICoreWindowManager;
      
      private var _window:IFrameWindow;
      
      private var var_971:String;
      
      private var var_334:ITextWindow;
      
      public function Logger(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_971 = "";
         queueInterface(new IIDCoreWindowManager(),windowManagerReceived);
      }
      
      private function loggerEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               _window.destroy();
               _window = null;
               var_334 = null;
            }
         }
      }
      
      public function method_2(param1:String) : void
      {
         var_971 += param1 + "\r";
         if(var_334 != null)
         {
            var_334.text = var_971;
         }
         else
         {
            trace(param1);
         }
      }
      
      private function windowManagerReceived(param1:IID, param2:IUnknown) : void
      {
         var_1439 = param2 as ICoreWindowManager;
         _window = var_1439.create("Logger::Output",HabboWindowType.const_483,WindowStyle.const_319,0 | 0 | 0 | 0,new Rectangle(0,0,180,240),loggerEventProc,"Logger") as IFrameWindow;
         var_334 = var_1439.create("Logger::Output::Text",HabboWindowType.const_2,WindowStyle.const_319,0 | 0 | 0,new Rectangle(0,0,_window.content.width,_window.content.height),null,"") as ITextWindow;
         var_334.multiline = true;
         var_334.background = true;
         var_334.border = true;
         var_334.fontFace = "Volter";
         var_334.fontSize = 9;
         IWindowContainer(_window.findChildByName("content_area")).addChild(var_334);
         method_2("Logger initialized!");
      }
   }
}
