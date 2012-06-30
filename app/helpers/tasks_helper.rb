module TasksHelper
  def calendar_dates_for current_date
    date_captions(current_date).join ' '
  end

  def complete_filters_links
    filter_params[:complete].nil? ?
      links_to_tasks_with_complete_filter : [complete_item, incomplete_item]
  end

  def important_filters_links
    filter_params[:important].nil? ?
      links_to_tasks_with_important_filter : [important_item, unimportant_item]
  end

  private

  def date_captions current_due_date
    month_range_in(current_due_date).map do |date|
      chosen_date?(current_due_date, date) ? date.day : link_to_date(date)
    end
  end

  def chosen_date? current_date, date
    current_date.day == date.day
  end

  def month_range_in date
    date.beginning_of_month..date.end_of_month
  end

  def link_to_date date
    link_to date.day, tasks_path(:due_date => date)
  end

  def link_to_tasks_with_filter caption, params
    link_to t(caption), tasks_path(filter_params.merge(params))
  end

  def filter_params
    @filter_params
  end

  def links_to_tasks_with_complete_filter
    [link_to_complete_tasks, link_to_incomplete_tasks]
  end

  def links_to_tasks_with_important_filter
    [link_to_important_tasks, link_to_unimportant_tasks]
  end

  def complete_item
    filter_params[:complete] ? t('complete') : link_to_complete_tasks
  end

  def incomplete_item
    filter_params[:complete] ? link_to_incomplete_tasks : t('incomplete')
  end

  def important_item
    filter_params[:important] ? t('important') : link_to_important_tasks
  end

  def unimportant_item
    filter_params[:unimportant] ? link_to_unimportant_tasks : t('unimportant')
  end

  def link_to_complete_tasks
    link_to_tasks_with_filter 'complete', {:complete => true}
  end

  def link_to_incomplete_tasks
    link_to_tasks_with_filter 'incomplete', {:complete => false}
  end

  def link_to_important_tasks
    link_to_tasks_with_filter 'important', {:important => true}
  end

  def link_to_unimportant_tasks
    link_to_tasks_with_filter 'unimportant', {:important => false}
  end
end

