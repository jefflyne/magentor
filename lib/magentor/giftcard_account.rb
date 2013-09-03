module Magento
  # http://www.magentocommerce.com/api/soap/enterpriseGiftCard/giftCardAccount/giftCardAccount.html
  # 100 Gift card does not exists.
  # 101 Invalid filters specified. Details in error message.
  # 102 Unable to save data.
  # 104 Provided email notification data is invalid
  # 105 Provided gift card account data is invalid
  # 106 Gift card account with requested id does not exist
  # 107 Error occurs while deleting gift card
  class GiftcardAccount < Base
    class << self
      # giftcard_account.list
      # Retrieve giftcards
      # 
      # Return: array
      # 
      # Arguments:
      # 
      # array filters - filters by giftcard attributes (optional)
      def list(*args)
        results = commit("list", *args)
        results.collect do |result|
          new(result)
        end
      end

      # giftcard_account.create
      # Create gift card account
      # 
      # Return: string - ID of the created gift card account
      # 
      # Arguments:
      # 
      # array giftcardAccountData
      # array notificationData (optional)
      def create(attributes)
        id = commit("create", attributes)
        record = new(attributes)
        record.id = id
        record
      end
    end
  end
end