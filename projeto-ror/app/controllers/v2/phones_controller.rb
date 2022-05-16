module V2
  class PhonesController < ApplicationController
    before_action :set_contact


    def show
      render json: @contact.phones
    end

    def create
      @contact.phones << Phone.new(phones_params)
      if @contact.save
        render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
      else
        render json: @contact.errors
      end

    end

    def update
      if @contact.phones.update(phones_params)
        render json: @contact.phones
      else
        render json: @contact.errors
      end
    end

    def destroy
      phone = Phone.find(phones_params[:id])
      phone.destroy
    end

    private
      def set_contact
        @contact = Contact.find(params[:contact_id])
      end

      def phones_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
      
  end
end
