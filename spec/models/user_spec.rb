require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_katakana、first_name_katakana、birthdateがあれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'last_name_katakanaが空では登録できない' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
    end
    it 'first_name_katakanaが空では登録できない' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana can't be blank"
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'last_name_katakanaは全角（カタカナ）でないと登録できない' do
      @user.last_name_katakana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana is invalid"
    end
    it 'first_name_katakanaは全角（カタカナ）でないと登録できない' do
      @user.first_name_katakana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana is invalid"
    end
  end
end