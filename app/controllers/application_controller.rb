class ApplicationController < ActionController::Base
    def fallback
        redirect_to root_path
    end

end
