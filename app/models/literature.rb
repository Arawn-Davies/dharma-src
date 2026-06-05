class Literature < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :slug, :summary, :body, presence: true
  validates :slug, uniqueness: true

  scope :ordered, -> { order(:position, :title) }

  def downloadable?
    resource_url.present?
  end

  def mirrored?
    local_resource_path.present?
  end

  def display_resource_url
    local_resource_path.presence || resource_url
  end

  def pdf_resource?
    resource_format.to_s.casecmp("PDF").zero? || display_resource_url.to_s.downcase.end_with?(".pdf")
  end

  def audio_resource?
    resource_format.to_s.match?(/\A(?:MP3|Audio ZIP)\z/i) && display_resource_url.to_s.downcase.end_with?(".mp3")
  end

  def inline_preview?
    pdf_resource? || audio_resource?
  end

  def to_param
    slug
  end
end
