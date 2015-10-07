class NoticesController < ApplicationController
    def index
        @notices = Notice.all
    end

    def show
        @notice = Notice.find(params[:id])
        @user = @notice.user
        #TODO Agregar avisos
    end

    def new
      @notice = Notice.new
    end

    def edit
        @notice = Notice.find(params[:id])
    end

    def create
        @notice = Notice.new(notice_params)
        if @notice.save
            flash[:notice] = "Aviso creado correctamente"
            redirect_to @notice
        else
          render :new
        end
    end

    def update
        @notice = Notice.find(params[:id])
        if @notice.update(notice_params)
            flash[:notice] = "Aviso editado correctamente"
            redirect_to @notice
        else
            render :edit
        end
    end
    def destroy
        @notice = Notice.find(params[:id])
        @notice.destroy
        flash[:notice] = "Aviso editado correctamente"
        redirect_to notices_url
    end
    private
    def notice_params
        params.require(:notice).permit(:user_id, :title, :message, :qcomments, :created_at)
    end
end
