class RaceTrackController < UIViewController

  def viewDidLoad
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

    car = CALayer.layer
    car.bounds = CGRectMake(0, 0, 44.0, 20.0)
    car.position = p(160, 25)
    car.contents = UIImage.imageNamed("carmodel.png").CGImage
    self.view.layer.addSublayer(car)

    anim = CAKeyframeAnimation.animationWithKeyPath("position")
    anim.path = trackPath.CGPath
    anim.rotationMode = KCAAnimationRotateAuto
    anim.repeatCount = 10
    anim.duration = 8.0
    car.addAnimation(anim, forKey: "race")
  end

  def p(x, y)
    CGPoint.new(x, y)
  end
end