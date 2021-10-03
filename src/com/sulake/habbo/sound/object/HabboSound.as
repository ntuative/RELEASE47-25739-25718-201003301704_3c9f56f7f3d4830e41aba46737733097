package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_989:SoundChannel = null;
      
      private var var_815:Boolean;
      
      private var var_988:Sound = null;
      
      private var var_638:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_988 = param1;
         var_988.addEventListener(Event.COMPLETE,onComplete);
         var_638 = 1;
         var_815 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_815;
      }
      
      public function stop() : Boolean
      {
         var_989.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_815 = false;
         var_989 = var_988.play(0);
         this.volume = var_638;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_638;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_989.position;
      }
      
      public function get length() : Number
      {
         return var_988.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_638 = param1;
         if(var_989 != null)
         {
            var_989.soundTransform = new SoundTransform(var_638);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_815 = true;
      }
   }
}
