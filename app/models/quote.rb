class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
