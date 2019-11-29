# frozen_string_literal: true

class PaginationDecorator < Draper::CollectionDecorator
  delegate :current_page, :total_entries, :total_pages, :per_page, :offset
end
