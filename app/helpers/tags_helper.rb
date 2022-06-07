module TagsHelper
# http://www.javawenti.com/?post=426796

  def display_standard_table(columns, collection = {})
    thead = content_tag :thead do
      content_tag :tr do
        columns.collect {|column|  
          concat content_tag(:th,column[:display_name])
        }.join().html_safe 
      end
    end 
    tbody = content_tag :tbody do
      collection.collect { |elem|
        content_tag :tr do
          columns.collect { |column|
            concat content_tag(:td, elem.attributes[column[:name]])
          }.to_s.html_safe
        end  
      }.join().html_safe
    end
    # bootstrap is not working here in this App. 
    # Its classes are for testing only (via browser Inspector)
    content_tag :table, thead.concat(tbody), class: "table table-hover"
  end

  ##############################################################################
  #   Generates a table body with hash data
  ##############################################################################
  def table_body collection = {}
    tbody = content_tag :tbody do
      collection.collect { |key, value|
       content_tag(:tr, class: "table-warning") do
          concat content_tag(:td, key)
          concat content_tag(:td, value)
        end
      }.join().html_safe
    end 
    content_tag :table, tbody, class: "table table-hover"
  end

  # Just an Exercise
  def display_array_table(columns, collection = {})
    tbody = content_tag :tbody do
      collection.collect { |elem|
        content_tag(:tr, class: "table-danger") do
          concat content_tag(:td, "#{elem[0].capitalize}:")
          concat content_tag(:td, elem[1])
        end  
      }.join().html_safe
    end
    content_tag :table, tbody, class: "table table-hover"
  end
end