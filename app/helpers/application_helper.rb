module ApplicationHelper
# Return a title on a per-page basis.
  def page_title(base_title)
    [base_title, @page_title].flatten.compact.join(' | ')
  end
end
