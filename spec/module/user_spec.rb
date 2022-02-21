# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can create' do
    user = User.create!
    expect(user).to eq(User.last)
  end

  it 'have correct columen' do
    columns = User.column_names
    expect(columns).to include('id')
    expect(columns).to include('email')
    expect(columns).to include('name')
    expect(columns).to include('password')
    expect(columns).not_to include('user_id')
  end
end
