# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'task_order_by_created_time' do
    # 新增任務的最後一筆, 會是表格中的第一筆 
    task = Task.order(created_at: :desc)
    task_new = Task.create
    expect(task_new).to eq task.first
  end
end
