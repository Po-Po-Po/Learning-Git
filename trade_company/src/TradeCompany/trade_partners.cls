Class TradeCompany.Partner Extends %Persistent
{

Index partnerID On (name, phone, address) [ PrimaryKey ];

Property name As %String;

Property phone As %String;

Property address As %String;

ClassMethod savePartner(partner As TradeCompany.Partner) As %Status
{
    set obj = ##class(TradeCompany.Partner).%New()
    set obj.name = partner.name
    set obj.phone = partner.phone
    set obj.address = partner.address
    set result = obj.%Save()
    Return ##class(TradeCompany.Utils).getStatus(result)
}

ClassMethod getAllPartners() As %Library.DynamicArray
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT id, name, phone, address
	    INTO :id, :name, :phone, :address
	    FROM TradeCompany.Partner
 	)
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"partnerID": (id), "name": (name),  "phone": (phone), "address": (address), "id":(id), "value":(name_"/"_id)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)

 	return data
}

}
