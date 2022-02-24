# frozen_string_literal: true

class Task < ApplicationRecord
  validate :date_cannot_be_in_the_past

  private
  def date_cannot_be_in_the_past
    if start_at.present? && end_at < start_at
      errors.add(:start_at, "should be later after start date")
    end
  end
end
