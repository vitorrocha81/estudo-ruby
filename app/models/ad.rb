class Ad < ActiveRecord::Base
  belongs_to :member
  belongs_to :category

  #validação dos campos, preenchimento obrigatório
  validates :title, :description, :category, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0},  presence: true

  #money
  monetize :price_cents

  #PAPERCLIP
  has_attached_file :picture, styles: { medium: "350x150#", thumb: "100x100>" }, default_url: "/images/:ad_id/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  scope :last_ads, -> { order(created_at: :desc).limit(6)}
end