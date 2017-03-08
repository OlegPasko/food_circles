class EnsureExistingVenuesAndOffersAreAlwaysOpen < ActiveRecord::Migration[5.0]
  def up
    [Venue, Offer].each do |openable_klass|
      openable_klass.find_each do |openable|
        openable.ensure_always_open
      end
    end
  end

  def down
  end
end
