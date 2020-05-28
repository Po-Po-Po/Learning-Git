Class TradeCompany.Contract Extends %Persistent
{

Index contractID On (partner, desc) [ PrimaryKey ];

Property desc As %String;

Property partner As TradeCompany.Partner;

ClassMethod saveContract(contract As TradeCompany.Contract) As %Status
{
    set obj = ##class(TradeCompany.Contract).%New()
    set obj.desc = contract.desc
    set obj.partner = ##class(TradeCompany.Partner).%OpenId(contract.partner)
    set result = obj.%Save()
    Return ##class(TradeCompany.Utils).getStatus(result)
}

ClassMethod getAllContracts() As %Library.DynamicArray
{
	set data = [] 
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT id, descr, partner
	    INTO :id, :descr, :partner
	    FROM TradeCompany.Contract
 	)
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"contractID": (id), "name": (name), "partner": (partner), "id":(id), "value":(name_"/"_id)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	return data
}

}
