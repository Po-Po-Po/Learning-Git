Class TradeCompany.Good Extends %Persistent
{

Index goodID On (partner, store, name) [ PrimaryKey ];

Property partner As TradeCompany.Partner;

Property store As TradeCompany.Store;

Property name As %String;

Property cost As %Integer;

ClassMethod saveGood(good As TradeCompany.Good) As %Status
{
    set obj = ##class(TradeCompany.Good).%New()
    set obj.partner = ##class(TradeCompany.Partner).%OpenId(good.partner)
    set obj.store = ##class(TradeCompany.Store).%OpenId(good.store)
    set obj.name = good.name
    set obj.cost = good.cost
    set result = obj.%Save()
    Return ##class(TradeCompany.Utils).getStatus(result)
}

ClassMethod getAllGoods() As %Library.DynamicArray
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT "id", "partner", "name", "store", "cost"
	    INTO :id, :partner, :name, :store, :cost
	    FROM TradeCompany.Good
 	)
 	&sql(OPEN MyCursor)

  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit
    set obj = {"goodID": (id), "partner": (partner), "name": (name), "store": (store), "cost": (cost), "id":(id), "value":(name_"/"_id)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	return data
}

}
