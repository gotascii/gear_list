class List < ActiveRecord::Base
  attr_accessor :list_id

  has_many :picks, :include => :item, :dependent => :destroy
  has_many :packed_picks, :class_name => 'Pick', :conditions => {:packed => true}
  has_many :worn_picks, :class_name => 'Pick', :conditions => {:packed => false}

  has_many :items, :through => :picks
  has_many :packed_items, :class_name => 'Item', :through => :packed_picks, :source => :item
  has_many :worn_items, :class_name => 'Item', :through => :worn_picks, :source => :item

  scope :order_by_name, :order => :name

  before_create :populate_picks, :if => :list_id?

  def list_id?
    !list_id.blank?
  end

  def list
    List.find(list_id)
  end

  def weight
    sum_and_truncate(items)
  end

  def packed_weight
    sum_and_truncate(packed_items)
  end

  def worn_weight
    sum_and_truncate(worn_items)
  end

  private
  def sum_and_truncate(val)
    val.sum('weight').to_short_d
  end

  def populate_picks
    list.picks.each do |p|
      self.picks << Pick.new(p.attributes)
    end
  end
end