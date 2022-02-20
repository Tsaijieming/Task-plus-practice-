# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'can create' do
    task = Task.create!
    expect(task).to eq(Task.last)
  end

  it 'have correct columen' do
    columns = Task.column_names
    expect(columns).to include('id')
    expect(columns).to include('title')
    expect(columns).to include('content')
    expect(columns).to include('status')
    expect(columns).to include('start_at')
    expect(columns).to include('end_at')
    expect(columns).to include('priority')
    expect(columns).not_to include('task_id')
  end
end
