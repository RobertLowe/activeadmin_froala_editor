# frozen_string_literal: true

ActiveAdmin.register Post do # rubocop:disable Metrics/BlockLength
  permit_params :author_id, :title, :description, :category, :dt, :position, :published, tag_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :published
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :author
      row :title
      row :description
      row :category
      row :dt
      row :position
      row :published
      row :tags
      row :created_at
      row :updated_at
      row :images do |resurce|
        resurce.images.each do |image|
          div do
            link_to image.filename, image, target: '_blank'
          end
        end
        nil
      end
    end
    active_admin_comments
  end

  form do |f|
    buttons = %w[undo redo bold italic]
    f.inputs 'Post' do
      f.input :author
      f.input :title
      f.input :description, as: :froala_editor, input_html: { data: { options: { toolbarButtons: buttons } } }
      f.input :category
      f.input :dt
      f.input :position
      f.input :published
    end

    f.inputs 'Tags' do
      f.input :tags
    end

    f.actions
  end
end
