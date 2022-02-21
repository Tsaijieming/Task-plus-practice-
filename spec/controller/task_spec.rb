# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe TasksController, type: :controller do
  before(:all) do
    @task_1 = Task.create(title: 'title_1', content: 'content_1', start_at: 'start_at_1', end_at: 'end_at_1',
                          priority: 'priority_1')
    @task_2 = Task.create(title: 'title_2', content: 'content_2', start_at: 'start_at_2', end_at: 'end_at_2',
                          priority: 'priority_2')
  end

  it '#index' do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it '#new' do
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end

  it '#edit' do
    get :edit, id: @task_1[:id]
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
  end

  describe '#create' do
    before(:all) do
      @task_params = { title: 'title', content: 'content', status: 'status', start_at: 'start_at', end_at: 'end_at',
                       priority: 'priority' }
    end

    it 'create task' do
      expect { post :create, task: @task_params }.to change { Task.all.size }.by(1)
    end

    it 'redirect to success' do
      post :create, task: @task_params
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(task_path(Tast.last))
    end
  end

  describe '#update' do
    before(:all) do
      @task_params = { title: 'title_3', content: 'content', status: 'status', start_at: 'start_at', end_at: 'end_at',
                       priority: 'priority' }
    end

    it 'update task' do
      post :update, task: @task_params, id: @task_2[:id]
      expect(Task.find(@task_2[:id])[:title]).to eq('title_3')
    end

    it 'redirect to success' do
      post :update, task: @task_params, id: @task_2[:id]
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(task_path(Tast.find(@task_2[:id])))
    end
  end
end
