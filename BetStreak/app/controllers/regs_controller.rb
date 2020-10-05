class RegsController < ApplicationController

  def new
    @reg = Reg.new
  end

  def create
     @reg = current_user.regs.build(reg_params)

     if @reg.save
      redirect_to reg_path(@reg)
     else
      redirect_to games_path
     end
  end

  private

  def reg_params
     params.require(:reg).permit(:datetime_registered, :user_id, :game_id)
  end

end
