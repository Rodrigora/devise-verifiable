module ActionDispatch::Routing
  class Mapper

    protected

    def devise_verification(mapping, controllers)
      path_names = {
        new: mapping.path_names[:new],
        create: mapping.path_names[:create]
      }

      resource :verification, only: [:new, :create],
                              path: mapping.path_names[:verification],
                              path_names: path_names,
                              controller: controllers[:verification]
    end
  end
end
