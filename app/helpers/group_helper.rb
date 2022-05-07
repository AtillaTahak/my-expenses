module GroupHelper
  def example_img(category)
    case category
    when 'currency'
      'fa fa-dollar'
    when 'food'
      'fa fa-comment-drink'
    when 'transport'
      'fa fa-car-side'
    when 'clothes'
      'fa fa-tshirt'
    when 'other'
      'fa fa-bag-personal'
    else
     ' fa fa-amazon-pay'
    end
  end
end
