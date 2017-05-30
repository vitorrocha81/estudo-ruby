class Ad < ActiveRecord::Base
  
  # callbacks
  before_save :to_html

  #  associations
  belongs_to :member
  belongs_to :category

  #validação dos campos, preenchimento obrigatório
  validates :title, :description_short, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0},  presence: true

  #money
  monetize :price_cents

  #PAPERCLIP
  has_attached_file :picture, styles: { ad: "579x579#",  medium: "350x150#", thumb: "100x100>" }, default_url: "/images/:ad_id/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  scope :last_ads, -> { order(created_at: :desc).limit(6)}

  private

    def to_html
      options = {
        filter_html: true,
        link_attributes: {
          rel: "nofollow",
          target: "_blank"
        }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      render = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(render, extensions)

      self.description = markdown.render(self.description_md)
    end
end