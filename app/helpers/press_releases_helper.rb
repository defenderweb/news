module PressReleasesHelper
  def join_tags(press_release)
    press_release.tags.map { |t| t.name }.join(", ")
  end 
  
end
