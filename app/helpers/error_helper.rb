module ErrorHelper
    def show_errors_for(obj)
        render partial: 'shared/errors', locals: {obj: obj} 
    end
end