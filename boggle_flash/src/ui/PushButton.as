package ui {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.greensock.TweenMax;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Adam Vernon
	 */
	public class PushButton extends Sprite {
		
		//--In FLA--//
		public var over:Sprite;
		public var down:Sprite;
		public var labelTF:TextField;
		//----------//
		
		private var _buttonEnabled:Boolean = true;
		private var _toggledOn:Boolean = false;
		private const _tTime:Number = 0.25;
		
		
		public function PushButton() {
			ui_init();
		}
		
		private function ui_init():void {
			TweenMax.allTo([over, down], 0, { autoAlpha:0 } );
			this.mouseChildren = false;
			this.buttonMode = true;
			this.addEventListener(MouseEvent.ROLL_OVER, mouseEvent);
			this.addEventListener(MouseEvent.ROLL_OUT, mouseEvent);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseEvent);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseEvent);
		}
		
		private function mouseEvent(evt:MouseEvent):void {
			if (! _toggledOn) {
				switch(evt.type) {
					case MouseEvent.ROLL_OVER:
						TweenMax.to(over, _tTime, { autoAlpha:1 } );
						break;
					case MouseEvent.ROLL_OUT:
						TweenMax.allTo([over, down], _tTime, { autoAlpha:0 } );
						break;
					case MouseEvent.MOUSE_DOWN:
						TweenMax.to(down, _tTime, { autoAlpha:1 } );
						break;
					case MouseEvent.MOUSE_UP:
						TweenMax.to(down, _tTime, { autoAlpha:0 } );
						break;
				}
			}
		}
		
		public function set toggledOn(value:Boolean):void {
			if (value != _toggledOn) {
				_toggledOn = value;
				if (_toggledOn) {
					this.mouseEnabled = false;
					TweenMax.to(down, _tTime, { autoAlpha:1 } );
					TweenMax.to(over, _tTime, { autoAlpha:0 } );
				} else {
					this.mouseEnabled = true;
					TweenMax.allTo([over, down], _tTime, { autoAlpha:0 } );
				}
			}
		}
		
		public function get buttonEnabled():Boolean { return _buttonEnabled; }
		
		public function set buttonEnabled(value:Boolean):void {
			if (value == _buttonEnabled) return;
			_buttonEnabled = value;
			if (_buttonEnabled) {
				this.mouseEnabled = true;
				this.buttonMode = true;
				TweenMax.to(this, _tTime, { alpha:1 } );
			} else {
				this.mouseEnabled = false;
				this.buttonMode = false;
				TweenMax.allTo([over, down], _tTime, { autoAlpha:0 } );
				TweenMax.to(this, _tTime, { alpha:0.5 } );
			}
		}
		
	}

}