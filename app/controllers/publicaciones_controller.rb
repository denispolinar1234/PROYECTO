class PublicacionesController < ApplicationController


    def index
      @categories=Category.all
      @publicaciones = Publicacion.all.with_attached_imagen.order(created_at: :desc)
      #como pueo agregar load async a eso
      if params[:category_id]
      @publicaciones=@publicaciones.where(category_id: params[:category_id])
      end
      if params[:query].present?
        @publicaciones = @publicaciones.search(params[:query])
      end

      #=begin
              #se intento usar paginacion pero no funciona
        #@categories = Category.all
        #@publicaciones = Publicacion.all.with_attached_imagen.order(created_at: :desc)
        
        #if params[:category_id].present?
          #@publicaciones = @publicaciones.where(category_id: params[:category_id])
        #end
        
        #if params[:query].present?
          #@publicaciones = @publicaciones.search(params[:query])
        #end
        
        #total=Publicacion.count
        #@pagy, @paginated_publicaciones = pagy(@publicaciones, items: total)
      #=end


    end
    
    def show
     publicacion
      
    end
    
    def new
      @publicacion = Publicacion.new
    end
    
    def create
        @publicacion = Publicacion.new(publicacion_params)
        if @publicacion.save
          redirect_to publicaciones_path, notice: 'se subio tu publicacion'
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
      publicacion
    end

    def update
      if publicacion.update(publicacion_params)
        redirect_to publicaciones_path, notice: 'Tu publicaaacion se ha actualizado correctamente.'
      else 
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      publicacion.destroy
      redirect_to publicaciones_path, notice: 'La publicación se ha eliminado correctamente.', status: :see_other

    end
    
    
      
    def publicacion
      @publicacion= Publicacion.find(params[:id])
    end
    
    private
    
    def publicacion_params
      params.require(:publicacion).permit(:titulo, :descripcion, :imagen, :category_id)
    end
  end
    