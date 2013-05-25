class Url < ActiveRecord::Base
  attr_accessible :source, :random_hash

  def self.generate_random_hash
    begin
      random_hash = Array.new(10){rand(36).to_s(36)}.join
    end until Url.where(random_hash: random_hash).blank?
    random_hash
  end
end
