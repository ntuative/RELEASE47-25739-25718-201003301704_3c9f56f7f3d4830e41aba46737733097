package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.getTimer;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private const const_1401:int = 0;
      
      private var var_581:String;
      
      private var var_627:int = 0;
      
      private const const_1610:int = 1;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_1113:Number;
      
      private var _isAnimating:Boolean;
      
      private var var_2356:int = 0;
      
      private var var_941:int = 0;
      
      private var var_445:int = 0;
      
      private const const_1026:int = 3;
      
      private const const_1611:int = 2;
      
      private var var_757:AvatarVisualizationData = null;
      
      private const const_1025:int = 3;
      
      private var var_412:Map;
      
      private var var_758:Array;
      
      public function AvatarVisualization()
      {
         var_1113 = new Date().valueOf();
         var_758 = new Array();
         super();
         var_412 = new Map();
         _assetLibrary = new AssetLibrary("avatar visualization");
         _isAnimating = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_757 = param1 as AvatarVisualizationData;
         createSprites(const_1025);
         return true;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:Boolean = false;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:* = false;
         var _loc36_:int = 0;
         var _loc37_:* = null;
         var _loc38_:* = null;
         var _loc39_:* = null;
         var _loc40_:* = null;
         var _loc41_:int = 0;
         var _loc42_:* = null;
         var _loc43_:* = null;
         var _loc44_:* = null;
         var _loc45_:int = 0;
         var _loc46_:Number = NaN;
         var _loc47_:int = 0;
         var _loc48_:* = null;
         var _loc49_:* = null;
         var _loc50_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc52_:* = NaN;
         var _loc53_:Number = NaN;
         var _loc54_:Number = NaN;
         var _loc55_:* = NaN;
         var _loc56_:Number = NaN;
         var _loc57_:Number = NaN;
         var _loc58_:* = NaN;
         var _loc59_:Number = NaN;
         var _loc60_:int = 0;
         var _loc61_:* = null;
         var _loc62_:* = null;
         var _loc63_:int = 0;
         var _loc64_:int = 0;
         var _loc65_:* = null;
         var _loc66_:int = 0;
         var _loc67_:int = 0;
         var _loc68_:int = 0;
         var _loc69_:int = 0;
         var _loc70_:int = 0;
         var _loc71_:* = null;
         var _loc72_:* = null;
         var _loc73_:int = 0;
         var _loc74_:int = 0;
         var _loc75_:int = 0;
         var _loc76_:int = 0;
         var _loc77_:int = 0;
         var _loc78_:* = null;
         var _loc79_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_757 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:String = "avatar" + param1.scale.toString();
         var _loc6_:* = var_412.getValue(_loc5_) as IAvatarImage;
         var _loc7_:String = _loc4_.getString(RoomObjectVariableEnum.const_181);
         var _loc8_:Number = new Date().valueOf();
         var _loc9_:Boolean = false;
         var _loc10_:Number = _loc4_.getNumber(RoomObjectVariableEnum.AVATAR_TALK_TIMESTAMP);
         var _loc11_:Number = _loc4_.getNumber(RoomObjectVariableEnum.const_601);
         var _loc12_:Number = _loc8_ - _loc10_;
         if(_loc12_ < _loc11_ * 1000)
         {
            if(Math.random() * 100 > 33 && _loc6_ != null)
            {
               _loc9_ = true;
               var_445 = const_1026;
            }
         }
         var _loc13_:Boolean = false;
         var _loc14_:Number = _loc8_ - var_1113;
         if(_loc14_ > 5000 && _loc6_ != null && _loc6_.getScale() == AvatarScaleType.const_53)
         {
            if(Math.random() * 100 > 95)
            {
               var_1113 = _loc8_;
               var_445 = const_1026;
               _loc13_ = true;
            }
         }
         var _loc15_:Boolean = false;
         var _loc16_:Number = _loc4_.getNumber(RoomObjectVariableEnum.const_310);
         if(_loc16_ > 0)
         {
            _loc22_ = _loc8_ - _loc16_;
            if(_loc22_ < 0)
            {
               _loc15_ = true;
               var_445 = const_1026;
            }
         }
         var _loc17_:int = _loc3_.getUpdateID();
         var _loc18_:int = param1.scale;
         var _loc19_:int = _loc4_.getUpdateID();
         var _loc20_:Boolean = var_288 != _loc3_.getUpdateID() || var_208 != param1.scale || var_161 != _loc4_.getUpdateID();
         var _loc21_:Boolean = _isAnimating || var_445 > 0;
         if(_loc20_ || _loc21_)
         {
            increaseUpdateId();
            --var_445;
            _loc23_ = getTimer();
            if(var_581 != _loc7_)
            {
               for each(_loc49_ in var_412.getKeys())
               {
                  var_412.remove(_loc49_);
               }
               _loc6_ = null;
            }
            if(_loc6_ == null)
            {
               _loc6_ = var_757.getAvatar(_loc7_,param1.scale);
               if(_loc6_ == null)
               {
                  return;
               }
               var_412.remove(_loc5_);
               var_412.add(_loc5_,_loc6_);
               var_581 = _loc7_;
            }
            _loc24_ = _loc3_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc24_ = (_loc24_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_39,_loc24_);
            _loc25_ = _loc4_.getNumber(RoomObjectVariableEnum.const_311);
            if(isNaN(_loc25_) || _loc4_.getString(RoomObjectVariableEnum.const_253) == "float")
            {
               _loc25_ = _loc24_;
            }
            else
            {
               _loc25_ -= param1.direction.x + 135 - 22.5;
            }
            _loc25_ = (_loc25_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_47,_loc25_);
            _loc6_.initActionAppends();
            _loc26_ = _loc4_.getString(RoomObjectVariableEnum.const_253);
            _loc27_ = _loc4_.getString(RoomObjectVariableEnum.const_727);
            _loc6_.appendAction(AvatarAction.const_646,_loc26_,_loc27_);
            _loc28_ = false;
            if(_loc26_ == "lay")
            {
               _loc50_ = Number(_loc27_);
               if(_loc50_ < 0)
               {
                  _loc28_ = true;
               }
            }
            _loc29_ = _loc4_.getNumber(RoomObjectVariableEnum.const_380);
            if(_loc29_ > 0 && _loc6_.getScale() == AvatarScaleType.const_53)
            {
               _loc51_ = _loc4_.getNumber(RoomObjectVariableEnum.const_417);
               _loc52_ = 3;
               _loc53_ = _loc8_ - _loc51_;
               if(_loc53_ < _loc52_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_304,AvatarAction.const_1278[_loc29_]);
               }
            }
            _loc30_ = _loc4_.getNumber(RoomObjectVariableEnum.const_907);
            if(_loc30_ > 0)
            {
               _loc6_.appendAction(AvatarAction.const_998,_loc30_);
            }
            _loc31_ = _loc4_.getNumber(RoomObjectVariableEnum.const_813);
            if(_loc31_ > 0)
            {
               _loc54_ = _loc4_.getNumber(RoomObjectVariableEnum.const_827);
               _loc55_ = 5;
               _loc56_ = _loc8_ - _loc54_;
               if(_loc56_ < _loc55_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_832,_loc31_);
               }
            }
            _loc32_ = _loc4_.getNumber(RoomObjectVariableEnum.const_736);
            _loc33_ = 0;
            if(_loc32_ > 0)
            {
               _loc57_ = _loc4_.getNumber(RoomObjectVariableEnum.const_695);
               _loc58_ = 100;
               _loc59_ = _loc8_ - _loc57_;
               if(_loc59_ < _loc58_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_966,_loc32_);
                  _loc60_ = 1;
                  while(_loc60_ < 10)
                  {
                     if(_loc59_ > _loc60_ * 10 * 1000 && _loc59_ < _loc60_ * 10 * 1000 + 1000)
                     {
                        _loc33_ = _loc32_;
                     }
                     _loc60_++;
                  }
               }
            }
            _loc34_ = _loc4_.getNumber(RoomObjectVariableEnum.const_846);
            if(_loc33_ > 0)
            {
               _loc34_ = _loc33_;
            }
            if(_loc34_ > 0)
            {
               _loc6_.appendAction(AvatarAction.const_949,_loc34_);
            }
            if(_loc9_)
            {
               _loc6_.appendAction(AvatarAction.const_386);
            }
            _loc35_ = _loc4_.getNumber(RoomObjectVariableEnum.const_444) > 0;
            if(_loc35_ || _loc13_)
            {
               _loc6_.appendAction(AvatarAction.const_716);
            }
            if(_loc15_)
            {
               _loc6_.appendAction(AvatarAction.const_407);
            }
            _loc36_ = _loc4_.getNumber(RoomObjectVariableEnum.const_920);
            if(_loc36_ > 0)
            {
               _loc6_.appendAction(AvatarAction.const_730,_loc36_);
            }
            _loc6_.endActionAppends();
            ++var_627;
            ++var_941;
            if(var_941 > 1)
            {
               _loc6_.updateAnimationByFrames(1);
               var_941 = 0;
            }
            _loc37_ = _loc6_.getImage(AvatarSetType.const_39);
            if(_loc37_ == null)
            {
               return;
            }
            _isAnimating = _loc6_.isAnimating();
            _loc38_ = _loc6_.avatarSpriteData;
            if(_loc38_ != null)
            {
            }
            _loc39_ = "avatar " + param1.scale;
            _loc40_ = _assetLibrary.getAssetByName(_loc39_) as BitmapDataAsset;
            if(_loc40_ == null)
            {
               _loc40_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
               _assetLibrary.setAsset(_loc39_,_loc40_);
            }
            if(_loc40_.content != null)
            {
               _loc61_ = _loc40_.content as BitmapData;
               if(_loc61_ != null && _loc61_ != _loc37_)
               {
                  _loc61_.dispose();
               }
            }
            _loc40_.setUnknownContent(_loc37_.clone());
            _loc41_ = const_1025;
            for each(_loc42_ in _loc6_.getSprites())
            {
               if(_loc42_.id != "avatar")
               {
                  _loc41_++;
               }
            }
            if(_loc41_ != spriteCount)
            {
               createSprites(_loc41_);
            }
            _loc44_ = _loc6_.getCanvasOffsets();
            if(_loc44_ == null || _loc44_.length < 3)
            {
               _loc44_ = new Array(0,0,0);
            }
            _loc45_ = 0;
            if(_loc26_ == "sit" || _loc26_ == "lay")
            {
               _loc45_ = param1.scale / 2;
            }
            _loc43_ = getSprite(const_1401);
            if(_loc43_ != null)
            {
               _loc43_.asset = _loc40_.content as BitmapData;
               _loc43_.offsetX = -1 * param1.scale / 2 + _loc44_[0];
               _loc43_.offsetY = -_loc37_.height + param1.scale / 4 + _loc44_[1] + _loc45_;
               if(_loc28_)
               {
                  _loc43_.relativeDepth = -0.5;
               }
               else if(_loc26_ == "lay")
               {
                  _loc43_.relativeDepth = -0.409 + _loc44_[2];
               }
               else
               {
                  _loc43_.relativeDepth = -0.01 + _loc44_[2];
               }
            }
            _loc46_ = Math.sqrt(0.5);
            _loc47_ = const_1025;
            for each(_loc48_ in _loc6_.getSprites())
            {
               if(_loc48_.id == "avatar")
               {
                  _loc43_ = getSprite(const_1401);
                  _loc62_ = _loc6_.getLayerData(_loc48_);
                  _loc63_ = _loc48_.getDirectionOffsetX(_loc6_.getDirection());
                  _loc64_ = _loc48_.getDirectionOffsetY(_loc6_.getDirection());
                  if(_loc62_ != null)
                  {
                     _loc63_ += _loc62_.dx;
                     _loc64_ += _loc62_.dy;
                  }
                  if(param1.scale < 48)
                  {
                     _loc63_ /= 2;
                     _loc64_ /= 2;
                  }
                  _loc43_.offsetX += _loc63_;
                  _loc43_.offsetY += _loc64_;
               }
               else
               {
                  _loc43_ = getSprite(_loc47_);
                  if(_loc43_ != null)
                  {
                     _loc43_.visible = true;
                     _loc65_ = _loc6_.getLayerData(_loc48_);
                     _loc66_ = 0;
                     _loc67_ = _loc48_.getDirectionOffsetX(_loc6_.getDirection());
                     _loc68_ = _loc48_.getDirectionOffsetY(_loc6_.getDirection());
                     _loc69_ = _loc48_.getDirectionOffsetZ(_loc6_.getDirection());
                     _loc70_ = 0;
                     if(_loc48_.hasDirections)
                     {
                        _loc70_ = _loc6_.getDirection();
                     }
                     if(_loc65_ != null)
                     {
                        _loc66_ = _loc65_.animationFrame;
                        _loc67_ += _loc65_.dx;
                        _loc68_ += _loc65_.dy;
                        _loc70_ += _loc65_.directionOffset;
                     }
                     if(param1.scale < 48)
                     {
                        _loc67_ /= 2;
                        _loc68_ /= 2;
                     }
                     if(_loc70_ < 0)
                     {
                        _loc70_ += 8;
                     }
                     if(_loc70_ > 7)
                     {
                        _loc70_ -= 8;
                     }
                     _loc71_ = _loc6_.getScale() + "_" + _loc48_.member + "_" + _loc70_ + "_" + _loc66_;
                     _loc72_ = _loc6_.getAsset(_loc71_);
                     if(_loc72_ == null)
                     {
                        continue;
                     }
                     _loc43_.asset = _loc72_.content as BitmapData;
                     _loc43_.offsetX = -1 * _loc72_.offset.x - param1.scale / 2 + _loc67_;
                     _loc43_.offsetY = -1 * _loc72_.offset.y + _loc68_ + _loc45_;
                     if(_loc26_ == "lay")
                     {
                        _loc43_.relativeDepth = -0.409 - 0.1 * _loc41_ * _loc69_;
                     }
                     else
                     {
                        _loc43_.relativeDepth = -0.01 - 0.1 * _loc41_ * _loc69_;
                     }
                     if(_loc48_.ink == 33)
                     {
                        _loc43_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc43_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc47_++;
               }
            }
            _loc43_ = getSprite(const_1610);
            if(_loc26_ == "mv" || _loc26_ == "std")
            {
               _loc43_.visible = true;
               _loc40_ = null;
               _loc39_ = null;
               _loc73_ = 0;
               _loc74_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     _loc39_ = "sh_std_sd_1_0_0";
                     _loc73_ = -8;
                     _loc74_ = -3;
                     break;
                  case 64:
                     _loc39_ = "h_std_sd_1_0_0";
                     _loc73_ = -17;
                     _loc74_ = -7;
               }
               if(_loc39_ != null)
               {
                  _loc40_ = _loc6_.getAsset(_loc39_);
               }
               if(_loc40_ != null)
               {
                  _loc43_.asset = _loc40_.content as BitmapData;
                  _loc43_.offsetX = _loc73_;
                  _loc43_.offsetY = _loc74_;
                  _loc43_.alpha = 50;
                  _loc43_.relativeDepth = 1;
               }
            }
            else
            {
               _loc43_.visible = false;
            }
            _loc43_ = getSprite(const_1611);
            if(_loc4_.getNumber(RoomObjectVariableEnum.const_896))
            {
               _loc43_.visible = true;
               _loc40_ = null;
               _loc39_ = null;
               switch(param1.scale)
               {
                  case 32:
                     _loc39_ = "user_typing_small_png";
                     _loc75_ = 3;
                     _loc76_ = -42;
                     break;
                  case 64:
                     _loc39_ = "user_typing_png";
                     _loc75_ = 14;
                     _loc76_ = -83;
               }
               if(_loc39_ != null)
               {
                  _loc40_ = var_757.getAvatarRendererAsset(_loc39_) as BitmapDataAsset;
               }
               if(_loc40_ != null)
               {
                  _loc43_.asset = _loc40_.content as BitmapData;
                  _loc43_.offsetX = _loc75_;
                  _loc43_.offsetY = _loc76_;
                  _loc43_.relativeDepth = -0.02 + _loc44_[2];
               }
            }
            else
            {
               _loc43_.visible = false;
            }
            var_288 = _loc3_.getUpdateID();
            var_161 = _loc4_.getUpdateID();
            var_208 = param1.scale;
            var_758.push(getTimer() - _loc23_);
            if(false)
            {
               _loc77_ = 0;
               _loc78_ = "[";
               for each(_loc79_ in var_758)
               {
                  _loc77_ += _loc79_;
                  _loc78_ += "," + _loc79_;
               }
               _loc78_ += "]";
               var_758 = new Array();
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_412 != null)
         {
            _loc1_ = var_412.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_412.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         var_757 = null;
      }
   }
}
