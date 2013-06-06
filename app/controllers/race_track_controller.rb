class RaceTrackController < UIViewController

  attr_accessor :carView

  def viewDidLoad
    self.view.userInteractionEnabled = true
    self.view.backgroundColor = UIColor.orangeColor

    trackPath = UIBezierPath.bezierPath
    trackPath.moveToPoint(p(160, 25))
    trackPath.addCurveToPoint(p(300, 120),
                              controlPoint1: p(320, 0),
                              controlPoint2: p(300, 80))
    trackPath.addCurveToPoint(p(80, 380),
                              controlPoint1: p(300, 200),
                              controlPoint2: p(200, 480))
    trackPath.addCurveToPoint(p(140, 300),
                              controlPoint1: p(0, 300),
                              controlPoint2: p(200, 220))
    trackPath.addCurveToPoint(p(210, 200),
                              controlPoint1: p(30, 420),
                              controlPoint2: p(280, 300))
    trackPath.addCurveToPoint(p(70, 110),
                              controlPoint1: p(110, 80),
                              controlPoint2: p(110, 80))
    trackPath.addCurveToPoint(p(160, 25),
                              controlPoint1: p(0, 160),
                              controlPoint2: p(0, 40))

    raceTrack = CAShapeLayer.layer
    raceTrack.path = trackPath.CGPath
    raceTrack.strokeColor = UIColor.blackColor.CGColor
    raceTrack.fillColor = UIColor.clearColor.CGColor
    raceTrack.lineWidth = 30.0
    self.view.layer.addSublayer(raceTrack)

    centerLine = CAShapeLayer.layer
    centerLine.path = trackPath.CGPath
    centerLine.strokeColor = UIColor.whiteColor.CGColor
    centerLine.fillColor = UIColor.clearColor.CGColor
    centerLine.lineWidth = 2.0
    self.view.layer.addSublayer(centerLine)

    self.carView = CarView.create
    self.view.addSubview(carView)
  end

  def p(x, y)
    CGPoint.new(x, y)
  end

  def touchesBegan(touches, withEvent: event)
    # We only support single touches, so anyObject retrieves just that touch from touches
    touch = touches.anyObject

    # Only move the placard view if the touch was in the placard view
    if touch.view == carView
      # Animate the first touch
      # animateFirstTouchAtPoint(touch.locationInView(self))
    else
      # In case of a double tap outside the placard view, update the placard's display string
      # carView.setupNextDisplayString if touch.tapCount == 2
    end
  end

  def touchesMoved(touches, withEvent: event)
    touch = touches.anyObject

    # If the touch was in the carView, move the carView to its location
    if touch.view == carView
      location = touch.locationInView(self.view)
      carView.center = location
    end
  end

  def touchesEnded(touches, withEvent: event)
    touch = touches.anyObject

    # If the touch was in the carView, bounce it back to the center
    if touch.view == carView
      # Disable user interaction so subsequent touches don't interfere with animation
      # self.userInteractionEnabled = false
      # animatePlacardViewToCenter
    end
  end
end