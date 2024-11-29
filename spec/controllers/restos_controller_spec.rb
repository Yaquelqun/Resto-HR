require 'rails_helper'

RSpec.describe RestosController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { resto: { date: Date.tomorrow } } }

      it 'creates a new resto' do
        expect {
          post :create, params: valid_params
        }.to change(Resto, :count).by(1)
      end

      it 'redirects to restos index' do
        post :create, params: valid_params
        expect(response).to redirect_to(restos_path)
      end

      it 'sets a success flash message' do
        post :create, params: valid_params
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { resto: { date: nil } } }

      it 'does not create a new resto' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Resto, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end

      it 'sets an error flash message' do
        post :create, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'PATCH #update' do
    let!(:resto) { create(:resto, date: Date.tomorrow) }

    context 'with valid parameters' do
      let(:new_date) { Date.tomorrow + 1.day }
      let(:valid_params) { { id: resto.id, resto: { date: new_date } } }

      it 'updates the resto' do
        patch :update, params: valid_params
        expect(resto.reload.date).to eq(new_date)
      end

      it 'redirects to restos index' do
        patch :update, params: valid_params
        expect(response).to redirect_to(restos_path)
      end

      it 'sets a success flash message' do
        patch :update, params: valid_params
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { id: resto.id, resto: { date: nil } } }

      it 'does not update the resto' do
        patch :update, params: invalid_params
        expect(resto.reload.date).to eq(Date.tomorrow)
      end

      it 'renders the edit template' do
        patch :update, params: invalid_params
        expect(response).to render_template(:edit)
      end

      it 'sets an error flash message' do
        patch :update, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:resto) { create(:resto) }

    it 'deletes the resto' do
      expect {
        delete :destroy, params: { id: resto.id }
      }.to change(Resto, :count).by(-1)
    end

    it 'redirects to restos index' do
      delete :destroy, params: { id: resto.id }
      expect(response).to redirect_to(restos_path)
    end

    it 'sets a success flash message' do
      delete :destroy, params: { id: resto.id }
      expect(flash[:success]).to be_present
    end
  end
end 