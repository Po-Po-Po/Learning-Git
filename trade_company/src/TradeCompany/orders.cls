Class TradeCompany.Order Extends %Persistent
{

Index orderID On (good, number, date) [ PrimaryKey ];

Property good As TradeCompany.Good;

Property number As %Integer;

Property cost As %Integer;

Property date As %Date;

ClassMethod saveOrder(order As TradeCompany.Order) As %Status
{
    set obj = ##class(TradeCompany.Order).%New()
    set obj.good = ##class(TradeCompany.Good).%OpenId(order.good)
    set obj.number = order.number
    set obj.cost = order.cost
    set obj.date = order.date
    set result = obj.%Save()
    Return ##class(TradeCompany.Utils).getStatus(result)
}

ClassMethod getAllOrders() As %Library.DynamicArray
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT id, good, number, cost, date
	    INTO :id, :good, :number, :cost, date
	    FROM TradeCompany.Order
 	)
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"OrderID": (id), "good": (good), "number": (number), "cost": (cost), "date":($ZDATE(date))}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	return data
}

}
