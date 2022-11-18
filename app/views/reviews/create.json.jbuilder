if @review.persisted?
  json.item_html(render(partial: 'reviews/review', formats: :html, locals: { review: @review }))
  # We render the form with a new review to empty the relevant fields
  json.form_html(render(partial: 'reviews/form', formats: :html,
                        locals: { field: @review.field, review: Review.new }))
else
  # We render the form with the error messages if the save failed
  json.form_html(render(partial: 'reviews/form', formats: :html,
                        locals: { field: @review.field, review: @review }))
end
