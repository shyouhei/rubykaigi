# -*- coding: utf-8 -*-
class OrderItem < ActiveRecord::Base
  belongs_to :product_item
  belongs_to :order

  class << self
    def from_cart_item(cart_item)
      li = new
      li.product_item = cart_item.product_item
      li.quantity = cart_item.quantity
      li.price = cart_item.price
      li.link_label = cart_item.link_label
      li.link_url = cart_item.link_url
      li.attend_party = cart_item.attend_party
      li
    end
  end

  def unit_price
    price
  end

  def item_code
    product_item.item_code
  end

  def subtotal_price
    price * quantity
  end

  def individual_sponsor?
    product_item.individual_sponsor?
  end
end