require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.length > 10 ? @nameable[0...10] : @nameable
  end
end
