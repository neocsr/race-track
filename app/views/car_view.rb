class CarView < UIImageView

  def self.create
    carView = self.alloc.initWithFrame(CGRectMake(160, 25, 44.0, 20.0))
    carView.image = UIImage.imageNamed("carmodel.png")
    carView.userInteractionEnabled = true
    carView
  end
end