import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;

class Watch extends WatchUi.WatchFace {
    private var timeLabel as Toybox.WatchUi.Text?;
    private var secsLabel as Toybox.WatchUi.Text?;

    public function initialize() {
        WatchFace.initialize();
    }

    public function onLayout(dc as Dc) as Void {
        setLayout($.Rez.Layouts.WatchFace(dc));
        timeLabel = View.findDrawableById("TimeLabel") as Toybox.WatchUi.Text;
        secsLabel = View.findDrawableById("SecsLabel") as Toybox.WatchUi.Text;
    }

    public function onShow() as Void {
        View.onShow();
        System.println("On show");
    }
    public function onHide() as Void {
        View.onHide();
        System.println("On hide");
    }

    public function onUpdate(dc as Dc) as Void {
        if (secsLabel == null) {
            return;
        }
        var hour = System.getClockTime().hour.toString();
        var minute = System.getClockTime().min.toString();
        var secs = System.getClockTime().sec.toString();
        if (timeLabel != null) {
            timeLabel.setText(hour + " " + minute);
        }
        if (secsLabel != null) {
            secsLabel.setText(secs);
        }
        WatchFace.onUpdate(dc);
    }

    public function onPartialUpdate(dc as Dc) as Void {
        // WatchFace.onPartialUpdate(dc);
    }

    public function onExitSleep() as Void {}

    public function onEnterSleep() as Void {}
}
