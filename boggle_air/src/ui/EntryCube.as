package ui {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Adam Vernon
	 */
	public class EntryCube extends Sprite {
		
		//--In FLA--//
		public var inputTF:TextField;
		//----------//
		
		public static const CHAR_ENTERED:String = "CHAR_ENTERED";
		
		
		public function EntryCube() {
			ui_init();
		}
		
		private function ui_init():void {
			inputTF.restrict = "A-z";
			inputTF.addEventListener(Event.CHANGE, inputTF_change);
		}
		
		private function inputTF_change(evt:Event):void {
			inputTF.text = inputTF.text.toUpperCase();
			if (inputTF.text.charAt(0) == "Q") inputTF.text = "Qu";
			else inputTF.text = inputTF.text.charAt(0);
			dispatchEvent(new Event(CHAR_ENTERED));
		}
		
		
	}
}