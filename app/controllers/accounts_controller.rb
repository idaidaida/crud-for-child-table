class AccountsController < ApplicationController

    def index
        @accounts = Account.all
    end

    def new
        # has_oneのときはbuild_XXXXを使う
        # has_manyのときは@account.build.profilesとなる
        @account = Account.new
        @account.build_profile
    end

    def create
        @account = Account.new(params_create)
        if @account.save
            redirect_to root_url
        else
            render "new"
        end
    end

    def edit
        # Editのときはbuild入らない
        @account = Account.find(params[:id])
    end

    def update
        @account = Account.find(params[:id])
        if @account && @account.update_attributes(params_update)
            redirect_to root_url
        else
            render "edit"
        end
    end

    def destroy
        @account = Account.find(params[:id])
        @account.destroy
        redirect_to root_url
    end

    private
        def params_create
            params.require(:account).permit(:name,profile_attributes:[:hobby,:birthplace])
        end

        def params_update
            params.require(:account).permit(:name,profile_attributes:[:hobby,:birthplace])
        end
end
