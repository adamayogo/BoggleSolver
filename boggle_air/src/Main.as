package {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import swc.MainScreenSWC;
	import ui.MainScreen;
	import com.greensock.TweenMax;

	/**
	 * ...
	 * @author Adam Vernon
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite {
		
		private var _mainScreen:MainScreen;
		private const _tDur:Number = 0.2;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_mainScreen = new MainScreenSWC();
			addChild(_mainScreen);
			
			this.stage.addEventListener(Event.RESIZE, stage_resize);
			stage_resize();
		}
		
		private function stage_resize(evt:Event=null):void {
			var screenDims:Point = new Point(700, 400);
			var deviceDims:Point = new Point(this.stage.stageWidth, this.stage.stageHeight);
			var targetScale:Number;
			var targetX:Number;
			var targetY:Number;
			
			if ((screenDims.x / screenDims.y) > (deviceDims.x / deviceDims.y)) {
				targetScale = deviceDims.x / screenDims.x;
				targetX = 0;
				targetY = 0.5 * (deviceDims.y - (screenDims.y * targetScale));
			} else {
				targetScale = deviceDims.y / screenDims.y;
				targetY = 0;
				targetX = 0.5 * (deviceDims.x - (screenDims.x * targetScale));
			}
			
			TweenMax.to(_mainScreen, evt ? _tDur : 0, { x:targetX, y:targetY, scaleX:targetScale, scaleY:targetScale } );
		}

	}

}