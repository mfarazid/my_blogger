class Article < ActiveRecord::Base
  before_create :set_published
  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
    
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  validates_presence_of :title, :content, message: "Required"

  has_attached_file :image
  validates_attachment_content_type :image, 
      :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  validates_attachment_size :image, 
      :less_than => 2.megabytes, message: "File size must be less than 2 MB"

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  private
    def set_published
      self.published = 0
    end  
end
