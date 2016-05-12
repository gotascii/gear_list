module ApplicationHelper
  def item_columns(item)
    [item.function.name, item.name, item.weight].collect do |field|
      content_tag :td, field
    end.join
  end
end
