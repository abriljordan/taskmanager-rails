class Tag < ApplicationRecord
  has_and_belongs_to_many :tasks

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 },
                    format: { without: /\s/, message: "cannot contain spaces" }

  scope :sorted, -> { order(:name) }

  def display_name
    name.titleize
  end

  after_create :log_creation

  private

  def log_creation
    logger.debug("Tag created: #{name}")
  end
end
