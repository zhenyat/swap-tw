
################################################################################
# Model:  Coin
#
# Purpose:
#
# Coin attributes:
#   name      - string,  not NULL, unique
#   code      - string,  not NULL, unique
#   kind      - enum { crypto (0) | fiat (1) }
#   unicode   - string
#   status    - enum { active (0) | archived (1) }
#
#  16.04.2022 ZT
################################################################################
class Coin < ApplicationRecord
  include ImagesHandleable

  has_many :coin_nicknames, dependent: :delete_all
  has_many :based_pairs,  class_name: 'Pair', foreign_key: 'base_id',  dependent: :delete_all
  has_many :quoted_pairs, class_name: 'Pair', foreign_key: 'quote_id', dependent: :delete_all
 
  has_one_attached :cover_image, dependent: :destroy

  enum kind:   %w(crypto fiat)
  enum status: %w(active archived)

  validates :name,  presence: true, uniqueness: true
  validates :code,  presence: true, uniqueness: true
end
  