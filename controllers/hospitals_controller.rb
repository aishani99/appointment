class HospitalsController < ApplicationController
    def index
        @hospitals=Hospital.all
    end
    def show
        @hospital=Hospital.find(params[:id])
    end
    def list
        @hospitals=Hospital.all
    end
    def new
        @hospital=Hospital.new
    end
    def create
        @hospital=Hospital.new(hospital_params)
        @hospital.cur_date=Time.now
        if @hospital.save
            redirect_to @hospital
        else
            render 'new'
        end
    end
    def edit 
        @hospital=Hospital.find(params[:id])
    end
    def update
        @hospital=Hospital.find(params[:id])
        if @hospital.update(hospital_params)
            redirect_to @hospital
          else
            render 'edit'
          end
    end
    def destroy
        @hospital=Hospital.find(params[:id])
        @hospital.destroy
        redirect_to hospitals_path
    end
    private
    def hospital_params
        params.require(:hospital).permit(:Hname,:Haddress,:contact,:email,:website,:no_of_test)
    end

end
