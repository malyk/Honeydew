class ListViewCell < UITableViewCell

  def initWithStyle(style, reuse_identifier)
    super(style, reuseIdentifier:reuse_identifier)
  end

  def configure_cell(parent, item)
    @parent = parent
    @item = item

    @color_bar = UIView.alloc.init
    @color_bar.frame = [[0, 0], [10, self.frame.size.height]]
    @color_bar.backgroundColor = [UIColor.greenColor, UIColor.blueColor, UIColor.whiteColor].sample

    @item_name = UILabel.alloc.init
    @item_name.frame = [[20, 11], [240, 22]]
    @item_name.setFont(UIFont.fontWithName("Futura-Medium", size:16))
    @item_name.text = item[:title]
    #@item_name.backgroundColor = UIColor.purpleColor

    @trigger = UIButton.buttonWithType(UIButtonTypeCustom)
    @trigger.frame = [[280, 7], [30, 30]]
    @trigger.setImage(UIImage.imageNamed("city_find_me"), forState:UIControlStateNormal)
    @trigger.setImage(UIImage.imageNamed("city_find_me_down"), forState:UIControlStateHighlighted)
    @trigger.addTarget(self, action:"didPressActionTrigger", forControlEvents:UIControlEventTouchUpInside)

    self.contentView.addSubview(@color_bar)
    self.contentView.addSubview(@item_name)
    self.contentView.addSubview(@trigger)
  end

  def didPressActionTrigger
    @parent.didActivateMenuForCell(self)
  end

end