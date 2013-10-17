module PostRepository
  extend ActiveSupport::Concern

  included do
    state_machine.states.each do |state|
      scope state.name, -> { where :state => state.name }
    end
  end
end
