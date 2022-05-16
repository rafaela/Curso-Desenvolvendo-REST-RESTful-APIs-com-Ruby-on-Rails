module V2
  class AddressesController < ApplicationController
    before_action :set_contact


    def show
      render json: @contact.address
    end

    def create
      @contact.address = Address.new(address_params)
      if @contact.save
        render json: @contact.address, status: :created, location: contact_address_url(@contact)
      else
        render json: @contact.errors
      end

    end

    def update
      if @contact.address.update(address_params)
        render json: @contact.address
      else
        render json: @contact.errors
      end
    end

    def destroy
      @contact.address.destroy
    end

    private
      def set_contact
        @contact = Contact.find(params[:contact_id])
      end
      

      def address_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
      
  end
end