require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST /v1/auth" do
    subject { post(api_v1_user_registration_path, params: params) }

    context "name と email と password が存在するとき" do
      let(:params) { attributes_for(:user) }

      it "Userの新規登録ができる" do
        expect { subject }.to change { User.count }.by(1)
        expect(response).to have_http_status(:ok)
        res = JSON.parse(response.body)
        expect(res["data"]["email"]).to eq(User.last.email)
      end

      it "本人認証として使用されるheader情報を取得することができる" do
        subject
        header = response.header
        expect(header["access-token"]).to be_present
        expect(header["client"]).to be_present
        expect(header["expiry"]).to be_present
        expect(header["uid"]).to be_present
        expect(header["token-type"]).to be_present
      end
    end

    context "name が存在しないとき" do
      let(:params) { attributes_for(:user, name: nil) }

      it "エラーする" do
        expect { subject }.to change { User.count }.by(0)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(res["errors"]["name"][0]).to include "can't be blank"
      end
    end

    context "email が存在しないとき" do
      let(:params) { attributes_for(:user, email: nil) }

      it "エラーする" do
        expect { subject }.to change { User.count }.by(0)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(res["errors"]["email"][0]).to include "can't be blank"
      end
    end

    context "password が存在しないとき" do
      let(:params) { attributes_for(:user, password: nil) }

      it "エラーする" do
        expect { subject }.to change { User.count }.by(0)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(res["errors"]["password"][0]).to include "can't be blank"
      end
    end
  end

  describe "POST /api/v1/auth/sign_in" do
    subject { post(api_v1_user_session_path, params: params) }

    context "登録済みのユーザーの正しいメールアドレスとパスワードを送信したとき" do
      let!(:user) { create(:user) }
      let(:params) { { email: user.email, password: user.password } }

      it "トークン情報を取得できる" do
        subject

        headers = response.headers

        expect(response).to have_http_status(:ok)
        expect(headers["access-token"]).to be_present
        expect(headers["client"]).to be_present
        expect(headers["expiry"]).to be_present
        expect(headers["uid"]).to be_present
        expect(headers["token-type"]).to be_present
      end
    end

    context "存在しないメールアドレスを送信したとき" do
      let!(:user) { create(:user) }
      let(:params) { { email: "000_#{Faker::Internet.email}", password: user.password } }

      it "トークン情報を取得できない" do
        subject

        headers = response.headers

        expect(response).to have_http_status(:unauthorized)
        expect(headers["access-token"]).to be_blank
        expect(headers["client"]).to be_blank
        expect(headers["expiry"]).to be_blank
        expect(headers["uid"]).to be_blank
        expect(headers["token-type"]).to be_blank
      end
    end

    context "パスワードに誤りがあったとき" do
      let!(:user) { create(:user) }
      let(:params) { { email: user.email, password: "dummy_password" } }

      it "トークン情報を取得できない" do
        subject

        headers = response.headers

        expect(response).to have_http_status(:unauthorized)
        expect(headers["access-token"]).to be_blank
        expect(headers["client"]).to be_blank
        expect(headers["expiry"]).to be_blank
        expect(headers["uid"]).to be_blank
        expect(headers["token-type"]).to be_blank
      end
    end
  end

  describe "DELETE /api/v1/auth/sign_out" do
    subject { delete(destroy_api_v1_user_session_path, params: params, headers: headers) }

    context "ログイン済みのユーザーの情報を送ったとき" do
      let(:user) { create(:user) }
      let(:params) { { email: user.email, password: user.password } }
      let!(:headers) { user.create_new_auth_token }

      it "トークン情報が削除される" do
        expect { subject }.to change { user.reload.tokens }.from(be_present).to(be_empty)

        res = JSON.parse(response.body)
        expect(user.reload.tokens).to be_blank
        expect(response.headers["uid"]).to be_blank
        expect(response.headers["access-token"]).to be_blank
        expect(response.headers["client"]).to be_blank
        expect(response).to have_http_status(:ok)
        expect(res["success"]).to be true
      end
    end
  end
end
