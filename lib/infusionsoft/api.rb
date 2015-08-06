module Infusionsoft
  module API
    DATA_FORM_FIELDS = %w( Id DataType FormId GroupId Name Label DefaultValue Values ListRows )

    TAG_FIELDS = %w( Id GroupName GroupCategoryId GroupDescription )

    USER_FIELDS = %w(
      City Email EmailAddress2 EmailAddress3 FirstName HTMLSignature Id
      LastName MiddleName Nickname Phone1 Phone1Ext Phone1Type Phone2
      Phone2Ext Phone2Type PostalCode Signature SpouseName State
      StreetAddress1 StreetAddress2 Suffix Title ZipFour1
    )

    CUSTOM_FIELD_TYPES = {
      '1' => 'Phone Number',
      '2' => 'Social Security Number',
      '3' => 'Currency',
      '4' => 'Percent',
      '5' => 'State',
      '6' => 'Yes/No',
      '7' => 'Year',
      '8' => 'Month',
      '9' => 'Day of Week',
      '10' => 'Name',
      '11' => 'Decimal Number',
      '12' => 'Whole Number',
      '13' => 'Date',
      '14' => 'Date/Time',
      '15' => 'Text',
      '16' => 'Text Area',
      '17' => 'List Box',
      '18' => 'Website',
      '19' => 'Email',
      '20' => 'Radio',
      '21' => 'Dropdown',
      '22' => 'User',
      '23' => 'Drilldown'
    }
    # This data is from the API documentation
    CONTACT_FIELDS = [
      { label:'Address1 Type', name: 'Address1Type', type: 'string'},
      { label:'Street Address1', name: 'StreetAddress1', type: 'string'},
      { label:'Street Address2', name: 'StreetAddress2', type: 'string'},
      { label:'Postal Code', name: 'PostalCode', type: 'string'},
      { label:'Zip Ext', name: 'ZipFour1', type: 'string'},
      { label:'Shipping Address Type', name: 'Address2Type', type: 'string'},
      { label:'Shipping Address Street1', name: 'Address2Street1', type: 'string'},
      { label:'Shipping Address Street2', name: 'Address2Street2', type: 'string'},
      { label:'Shipping Postal Code', name: 'PostalCode2', type: 'string'},
      { label:'Shipping Zip Ext', name: 'ZipFour2', type: 'string'},
      { label:'Optional Address Street1', name: 'Address3Street1', type: 'string'},
      { label:'Optional Address Street2', name: 'Address3Street2', type: 'string'},
      { label:'Optional Address Type', name: 'Address3Type', type: 'string'},
      { label:'Optional Zip Ext', name: 'ZipFour3', type: 'string'},
      { label:'Anniversary', name: 'Anniversary', type: 'date'},
      { label:'Assistant Name', name: 'AssistantName', type: 'string'},
      { label:'Assistant Phone', name: 'AssistantPhone', type: 'string'},
      { label:'Billing Information', name: 'BillingInformation', type: 'string'},
      { label:'Birthday', name: 'Birthday', type: 'date'},
      { label:'City', name: 'City', type: 'string'},
      { label:'Shipping City', name: 'City2', type: 'string'},
      { label:'Optional City', name: 'City3', type: 'string'},
      { label:'Company', name: 'Company', type: 'string'},
      { label:'Account Id', name: 'AccountId', type: 'integer'},
      { label:'Company ID', name: 'CompanyID', type: 'integer'},
      { label:'Contact Notes', name: 'ContactNotes', type: 'string'},
      { label:'Contact Type', name: 'ContactType', type: 'string'},
      { label:'Country', name: 'Country', type: 'string'},
      { label:'Shipping Country', name: 'Country2', type: 'string'},
      { label:'Optional Country', name: 'Country3', type: 'string'},
      { label:'Created By', name: 'CreatedBy', type: 'string'},
      { label:'Date Created', name: 'DateCreated', type: 'datetime'},
      { label:'Email', name: 'Email', type: 'string'},
      { label:'Email Address2', name: 'EmailAddress2', type: 'string'},
      { label:'Email Address3', name: 'EmailAddress3', type: 'string'},
      { label:'Fax1', name: 'Fax1', type: 'string'},
      { label:'Fax1 Type', name: 'Fax1Type', type: 'string'},
      { label:'Fax2', name: 'Fax2', type: 'string'},
      { label:'Fax2 Type', name: 'Fax2Type', type: 'string'},
      { label:'First Name', name: 'FirstName', type: 'string'},
      { label:'Tags', name: 'Groups', type: 'string'},
      { label:'Id', name: 'Id', type: 'integer'},
      { label:'Job Title', name: 'JobTitle', type: 'string'},
      { label:'Last Name', name: 'LastName', type: 'string'},
      { label:'Last Updated', name: 'LastUpdated', type: 'datetime'},
      { label:'Last Updated By', name: 'LastUpdatedBy', type: 'string'},
      { label:'Lead source', name: 'Leadsource', type: 'string'},
      { label:'Lead Source Id', name: 'LeadSourceId', type: 'integer'},
      { label:'Middle Name', name: 'MiddleName', type: 'integer'},
      { label:'Nickname', name: 'Nickname', type: 'string'},
      { label:'Owner ID', name: 'OwnerID', type: 'integer'},
      { label:'Password', name: 'Password', type: 'string'},
      { label:'Phone1', name: 'Phone1', type: 'string'},
      { label:'Phone1 Ext', name: 'Phone1Ext', type: 'string'},
      { label:'Phone1 Type', name: 'Phone1Type', type: 'string'},
      { label:'Phone2', name: 'Phone2', type: 'string'},
      { label:'Phone2 Ext', name: 'Phone2Ext', type: 'string'},
      { label:'Phone2 Type', name: 'Phone2Type', type: 'string'},
      { label:'Phone3', name: 'Phone3', type: 'string'},
      { label:'Phone3 Ext', name: 'Phone3Ext', type: 'string'},
      { label:'Phone3 Type', name: 'Phone3Type', type: 'string'},
      { label:'Phone4', name: 'Phone4', type: 'string'},
      { label:'Phone4 Ext', name: 'Phone4Ext', type: 'string'},
      { label:'Phone4 Type', name: 'Phone4Type', type: 'string'},
      { label:'Phone5', name: 'Phone5', type: 'string'},
      { label:'Phone5 Ext', name: 'Phone5Ext', type: 'string'},
      { label:'Phone5 Type', name: 'Phone5Type', type: 'string'},
      { label:'Optional Postal Code', name: 'PostalCode3', type: 'string'},
      { label:'Referral Code', name: 'ReferralCode', type: 'string'},
      { label:'Spouse Name', name: 'SpouseName', type: 'string'},
      { label:'State', name: 'State', type: 'string'},
      { label:'Shipping State', name: 'State2', type: 'string'},
      { label:'Optional State', name: 'State3', type: 'string'},
      { label:'Suffix', name: 'Suffix', type: 'string'},
      { label:'Title', name: 'Title', type: 'string'},
      { label:'Username', name: 'Username', type: 'string'},
      { label:'Validated', name: 'Validated', type: 'integer'},
      { label:'Website', name: 'Website', type: 'string'}
    ]

    CONTACT_FIELD_LABELS = CONTACT_FIELDS.map { |fields| fields[:name] }

    # Find all the tags...all of them!
    def get_tags(page = 0)
      data = { 'Id' => '%' }
      query('ContactGroup', 1000, page, data, TAG_FIELDS)
    end

    def get_custom_fields(page = 0)
      data = { 'FormId' => -1 }
      response = query('DataFormField', 1000, page, data, ['Name', 'Label', 'DataType'])
      response.each do |field|
        field['DataType'] = CUSTOM_FIELD_TYPES[field['DataType'].to_s]
      end
      response
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
      fields = fields.any? ? fields : CONTACT_FIELD_LABELS
      connection('ContactService.load', contact_id, fields)
    end

    # Finds all contacts with the given email
    def find_contact_by_email(email, fields = [])
      fields = fields.any? ? fields : CONTACT_FIELD_LABELS
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

    def get_user_info(data = {}, page = 0)
      query('User', 1000, page, data, USER_FIELDS)
    end

    def fetch_contacts_with_tag(tag_id, custom_fields = [], page = 0)
      contacts = []
      custom_fields.map! { |field| "_#{field}"}
      fields = CONTACT_FIELD_LABELS + custom_fields

      # This covers all the possible location of the tagID in the contact hash
      datas =
        [
          { 'Groups' => tag_id },
          { 'Groups' => "%,#{tag_id}" },
          { 'Groups' => "#{tag_id},%"},
          { 'Groups' => "%,#{tag_id},%" }
        ]

      datas.each do |data|
        contacts += query('Contact', 1000, page, data, fields)
      end
      contacts
    end

    def get_contacts(page = 0, custom_fields = [], data={})
      fields = CONTACT_FIELD_LABELS + custom_fields
      binding.pry
      query('Contact', 1000, page, data, fields)
    end
  end
end
