class SchoolClassesController < ApplicationController
#     school_classes POST  /school_classes(.:format)          school_classes#create
#  new_school_class GET   /school_classes/new(.:format)      school_classes#new
# edit_school_class GET   /school_classes/:id/edit(.:format) school_classes#edit
#      school_class GET   /school_classes/:id(.:format)      school_classes#show
#                   PATCH /school_classes/:id(.:format)      school_classes#update
#                   PUT   /school_classes/:id(.:format)      school_classes#update
    
    def index
        @classes = SchoolClass.all
    end

    def new
        @class = SchoolClass.new
    end

    def create
        @class = SchoolClass.new(class_params)
        @class.save
        redirect_to school_class_path(@class)
    end

    def edit
        @class = SchoolClass.find(params[:id])
    end

    def update
        @class = SchoolClass.find(params[:id])
        @class.update(class_params)
        @class.save
        redirect_to school_class_path(@class)
      
    end
    
    def show
        @class = SchoolClass.find(params[:id])
    end

    private

    def class_params
        params.require(:school_class).permit(:title, :room_number)
    end

end