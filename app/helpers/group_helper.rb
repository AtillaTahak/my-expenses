module GroupHelper
    def example_img(category)
        if category.eql?("currency")
            img_example = "fa fa-dollar"
        elsif category.eql?("food")
            img_example = "fa fa-comment-drink"
        elsif category.eql?("transport")
            img_example = "bi bi-car-side"
        elsif category.eql?("clothes")
            img_example = "bi bi-tshirt"
        elsif category.eql?("other")
            img_example = "bi bi-bag-personal"
        else
            img_example = "fa fa-dollar"
        end
    end
end
