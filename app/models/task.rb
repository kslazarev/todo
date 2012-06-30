class Task < ActiveRecord::Base
  scope :on, lambda { |date| where(:due_date => date) if date }
  scope :important, lambda { |status| where(:important => status) unless status.nil? }
  scope :complete, lambda { |status| where(:complete => status) unless status.nil? }

  scope :search, lambda { |params|
    on(params[:due_date]).important(params[:important]).complete(params[:complete])
  }

  attr_accessible :content, :important, :complete, :due_date
end