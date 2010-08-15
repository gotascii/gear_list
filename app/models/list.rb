class List < ActiveRecord::Base
  has_many :picks, :include => :item
  has_many :packed_picks, :class_name => 'Pick', :conditions => {:packed => true}
  has_many :worn_picks, :class_name => 'Pick', :conditions => {:packed => false}

  has_many :items, :through => :picks
  has_many :packed_items, :class_name => 'Item', :through => :packed_picks, :source => :item
  has_many :worn_items, :class_name => 'Item', :through => :worn_picks, :source => :item

  scope :order_by_name, :order => :name

  def weight
    items.sum('weight')
  end

  def packed_weight
    packed_items.sum('weight')
  end

  def worn_weight
    worn_items.sum('weight')
  end
end