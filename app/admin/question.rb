ActiveAdmin.register Question do
  permit_params :level, :description, :image, :answer
  show do |question|
      attributes_table do
        row :description do
          question.description? ? content_tag(:span, question.description) : content_tag(:span, "No description yet")
        end
        row :image do
          question.image? ? image_tag(question.image.url, height: '100') : content_tag(:span, "No image yet")
        end
         row :answer do
         question.description? ? content_tag(:span, question.answer) : content_tag(:span, "No Answer file yet")
        end
         row :level do
         question.description? ? content_tag(:span, question.level) : content_tag(:span, "No Level yet")
        end
     end
     active_admin_comments
 end

 form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs do
     f.input :image, hint: f.question.image? ? image_tag(f.question.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
     f.input :description
     f.input :answer
     f.input :level
   end
   f.actions
 end
end
