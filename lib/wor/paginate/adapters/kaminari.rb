# Used when render_paginated is called with an ActiveModel directly, with kaminari
# already required. Something like
### render_paginated DummyModel
module Wor
  module Paginate
    module Adapters
      class Kaminari < Wor::Paginate::Adapters::Adapter
        def required_methods
          %i(page)
        end

        def paginated_content
          @paginated_content ||= @content.page(@page).per(@limit)
        end

        def count
          paginated_content.count
        end

        def total_count
          paginated_content.total_count
        end

        def total_pages
          paginated_content.total_pages
        end
      end
    end
  end
end
