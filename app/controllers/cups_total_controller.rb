class CupsTotalController < ApplicationController
    before_action :authenticate_user

    def index
        if current_user.admin == true
            @cups_total = CupsTotal.all
        else
            @cups_total = current_user.cups_total
        end
        render json: @cups_total
    end
end
