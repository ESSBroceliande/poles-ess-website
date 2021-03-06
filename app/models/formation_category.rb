class FormationCategory < ApplicationRecord
  include Seoable
  include Enablable

  acts_as_list

  has_many :formations, dependent: :restrict_with_exception

  # Validations ================================================================

  validates :title, presence: true

  # Scopes ====================================================================

  scope :having_formations, -> { joins(:formations).distinct }
  scope :by_formation_category, -> (val) {
    where(id: val)
  }
  scope :sort_by_position, -> { order(position: :desc) }

  # Instance methods ====================================================

  # Class Methods ==============================================================

  def self.apply_filters(params)
    [
      :by_formation_category,
    ].inject(all) do |relation, filter|
      next relation unless params[filter].present?

      relation.send(filter, params[filter])
    end
  end

  def self.apply_sorts(params)
    self.order(position: :desc)
  end
end
