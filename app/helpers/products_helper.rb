module ProductsHelper

  def product_website_link(product, options = {})
    options.reverse_merge!(:new_window => true)

    link_options = {}
    link_options[:target] = "_blank" if options[:new_window]

    if product.url
      link_to "View #{product.model}'s Website", product.url, link_options
    else
      link_to "View #{product.brand.name}'s Website", product.brand.url, link_options
    end
  end
end
