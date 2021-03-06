class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders
  belongs_to :supplier
  has_many :images

  def sale_message
    # return a message(string) based on the price
    if price.to_f <= 2
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end

  def tax
    return price.to_f * 0.09
  end

  def total
    return price.to_f + tax
  end

  def cheap?
    if sale_message == "Discount Item!"
      return true
    else
      return false
    end
  end

  def sale_item_class
    if sale_message == "Discount Item!"
      return "discount-item"
    else
      return ""
    end
  end
end


