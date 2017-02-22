# frozen_string_literal: true
module AlwaysOpen
  def ensure_always_open
    open_times << OpenTime.new(start: 1, end: 7.days / 60)
  end
end
