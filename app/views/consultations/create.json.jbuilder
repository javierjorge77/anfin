if @consultation.persisted?
  json.form render(partial: "consultations/form", formats: :html, locals: {user: @user, consultation: Consultation.new})
  json.inserted_item render(partial: "users/consultation", formats: :html, locals: {consultation: @consultation})
else
  json.form render(partial: "consultations/form", formats: :html, locals: {user: @user, consultation: @consultation})
end
