class TargetGroup < ActiveRecord::Base

    belongs_to :panel_provider
    has_many :countries, through: :panel_provider
    has_many :location_groups, through: :panel_provider

    has_many :locations, foreign_key: [:external_id, :secret_code], primary_key: [:external_id, :secret_code]

    belongs_to :parent, class_name: 'TargetGroup'
    has_many :children, class_name: 'TargetGroup', foreign_key: 'parent_id'

end