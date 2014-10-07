module Infusionsoft
  module API
    DATA_FORM_FIELDS = %w( Id DataType FormId GroupId Name Label DefaultValue Values ListRows )

    TAG_FIELDS = %w( Id GroupName GroupCategoryId GroupDescription )

    CONTACT_FIELDS = %w(
      Address1Type Address2Street1 Address2Street2 Address2Type
      Address3Street1 Address3Street2 Address3Type Anniversary AssistantName
      AssistantPhone BillingInformation Birthday City City2 City3 Company
      AccountId CompanyID ContactNotes ContactType Country Country2 Country3
      CreatedBy DateCreated Email EmailAddress2 EmailAddress3 Fax1 Fax1Type
      Fax2 Fax2Type FirstName Groups Id JobTitle LastName LastUpdated
      LastUpdatedBy Leadsource LeadSourceId MiddleName Nickname OwnerID
      Password Phone1 Phone1Ext Phone1Type Phone2 Phone2Ext Phone2Type Phone3
      Phone3Ext Phone3Type Phone4 Phone4Ext Phone4Type Phone5 Phone5Ext
      Phone5Type PostalCode PostalCode2 PostalCode3 ReferralCode SpouseName
      State State2 State3 StreetAddress1 StreetAddress2 Suffix Title Username
      Validated Website ZipFour1 ZipFour2 ZipFour3
    )

    # Find all the tags...all of them!
    def get_tags(page = 0)
      data = { 'Id' => '%' }
      query('ContactGroup', 1000, page, data, TAG_FIELDS)
    end

    def get_custom_fields(page = 0)
      data = { 'FormId' => -1 }
      query('DataFormField', 1000, page, data, ['Name'])
    end

    # Finds all contacts with the given tag
    def find_contacts_with_tag(tag_id, page = 0)
      data = { 'GroupId' => tag_id }
      query('ContactGroupAssign', 1000, page, data, ['ContactId'])
    end

    # Creates a new contact
    def add_contact(data)
      contact_id = connection('ContactService.add', data)
      handle_email(data)
      contact_id
    end

    # Adds or updates a contact based on matching data
    def add_or_update_contact(data)
      contact_id = connection('ContactService.addWithDupCheck', data, 'Email')
      handle_email(data)
      contact_id
    end

    # Updates a contact in the database
    def contact_update(contact_id, data)
      contact_id = connection('ContactService.update', contact_id, data)
      handle_email(data)
      contact_id
    end

    # Loads contact info from the database
    def load_contact(contact_id, fields = [])
      fields = fields.any? ? fields : CONTACT_FIELDS
      connection('ContactService.load', contact_id, fields)
    end

    # Finds all contacts with the given email
    def find_contact_by_email(email, fields = [])
      fields = fields.any? ? fields : CONTACT_FIELDS
      connection('ContactService.findByEmail', email, fields)
    end

    # Removes a tag/group from a contact
    def remove_tag_from_contact(contact_id, tag_id)
      connection('ContactService.removeFromGroup', contact_id, tag_id)
    end

    # Adds a tag/group to a contact
    def add_tag_to_contact(contact_id, tag_id)
      connection('ContactService.addToGroup', contact_id, tag_id)
    end

    def handle_email(data)
      if data.has_key?('Email')
        connection('APIEmailService.optIn', data['Email'], 'requested information')
      end
    end

    def query(table, limit, page, data, fields)
      connection('DataService.query', table, limit, page, data, fields)
    end

    def find_by_field(table, limit, page, name, value, fields)
      connection('DataService.findByField', table, limit, page, name, value, fields)
    end

  end
end
