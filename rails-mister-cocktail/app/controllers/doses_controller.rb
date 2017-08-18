class DosesController < ApplicationController

  def create
      @dose = Cocktail.new(cocktail_params)
    if @dose.save # return false if validations don't pass
      redirect_to cocktails_path
    else
      render :new
    end
  end

def destroy
@dose = Dose.destroy(params[:id])
redirect_to cocktails_path
end

end
