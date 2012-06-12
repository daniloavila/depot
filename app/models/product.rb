class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_note_referenced_by_any_line_item

	default_scope :order => 'title'

	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true
	validates :image_url, :format => {:with => %r{\.(gif|jpg|png)$}i, :message => "must be a URL for GIF, JPG or PNG image."}

	private

	def ensure_note_referenced_by_any_line_item
		return true if line_items.empty?

		errors.add(:base, 'Line Items Present')
		false
	end
end
