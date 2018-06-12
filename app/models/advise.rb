# == Schema Information
#
# Table name: advises
#
#  id         :bigint(8)        not null, primary key
#  note_id    :bigint(8)        not null
#  user_name  :string
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Advise < ApplicationRecord
  belongs_to :note

  validates :user_name, presence: true, length: {minimum: 1, maximum: 100, allow_blank: true}
  validates :body, presence: true, length: {minimum: 2, maximum: 1000, allow_blank: true}
end
