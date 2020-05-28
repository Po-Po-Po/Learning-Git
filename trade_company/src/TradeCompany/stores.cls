Class TradeCompany.Store Extends %Persistent
{

Index storeID On (name, partner, address) [ PrimaryKey ];

Property name As %String;

Property partner As TradeCompany.Partner;

Property address As %String;

ClassMethod saveStore(store As TradeCompany.Store) As %Status
{
    set obj = ##class(TradeCompany.Store).%New()
    set obj.name = store.name
    set obj.partner = ##class(TradeCompany.Partner).%OpenId(store.partner)
    set obj.address = store.address
    set result = obj.%Save()
    Return ##class(TradeCompany.Utils).getStatus(result)
}

ClassMethod getAllStores() As %Library.DynamicArray
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT id, name, partner, address
	    INTO :id, :name, :partner, :address
	    FROM TradeCompany.Store
 	)
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"storeID": (id), "name": (name), "partner": (partner), "address": (address), "id":(id), "value":(name_"/"_id)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	return data
}

}
