require "rails_helper"

RSpec.describe User, type: :model do
  describe "正常系" do
    context "名前、メールアドレス、パスワードが入力されている場合" do
      let(:user) { build(:user) }

      it "ユーザー登録できる" do
        expect(user).to be_valid
      end
    end
  end

  describe "異常系" do
    context "名前しか入力していない場合" do
      let(:user) { build(:user, email: nil, password: nil) }

      it "エラーが発生する" do
        expect(user).not_to be_valid
      end
    end

    context "email がない場合" do
      let(:user) { build(:user, email: nil,) }

      it "エラーが発生する" do
        expect(user).not_to be_valid
      end
    end
  end

end