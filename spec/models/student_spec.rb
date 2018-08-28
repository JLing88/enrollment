require 'rails_helper'

describe Student, type: :model do
  it {should validate_presence_of :name}
end
