Class TradeCompany.Api Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/savePartner" Method="POST" Call="savePartner"/>
    <Route Url="/deletePartner" Method="POST" Call="deletePartner"/>
    <Route Url="/listPartners" Method="GET" Call="listPartners"/>

    <Route Url="/saveStore" Method="POST" Call="saveStore"/>
    <Route Url="/deleteStore" Method="POST" Call="deleteStore"/>
    <Route Url="/listStores" Method="GET" Call="listStores"/>

    <Route Url="/saveGood" Method="POST" Call="saveGood"/>
    <Route Url="/deleteGood" Method="POST" Call="deleteGood"/>
    <Route Url="/listGoods" Method="GET" Call="listGoods"/>

    <Route Url="/saveContract" Method="POST" Call="saveContract"/>
    <Route Url="/deleteContract" Method="POST" Call="deleteContract"/>
    <Route Url="/listContracts" Method="GET" Call="listContracts"/>

    <Route Url="/saveOrder" Method="POST" Call="saveOrder"/>
    <Route Url="/deleteOrder" Method="POST" Call="deleteOrder"/>
    <Route Url="/listOrders" Method="GET" Call="listOrders"/>

</Routes>
}

ClassMethod savePartner() As %Status
{
    set obj = {}
    set obj.name = %request.Get("name")
    set obj.phone = %request.Get("phone")
    set obj.address = %request.Get("address")
    set result = ##class(TradeCompany.Partner).savePartner(obj)
    write result.%ToJSON()
    Return result
}

ClassMethod deletePartner() As %Status
{
    set id = %request.Get("id")
    set result = ##class(TradeCompany.Partner).%DeleteId(id)
    Return result
}

ClassMethod listPartners() As %Status
{
  set list = ##class(TradeCompany.Partner).getAllPartners()
  write list.%ToJSON()
  Return $$$OK
}

ClassMethod saveStore() As %Status
{
    set obj = {}

    set obj.name =  %request.Get("name")
    set obj.address = %request.Get("address")
    set obj.partner = %request.Get("partner")

    set result = ##class(TradeCompany.Store).saveStore(obj)
    write result.%ToJSON()
    Return result
}

ClassMethod deleteStore() As %Status
{
    set id = %request.Get("id")
    set result = ##class(TradeCompany.Store).%DeleteId(id)
    Return result
}

ClassMethod listStores() As %Status
{
  set list = ##class(TradeCompany.Store).getAllStores()
  write list.%ToJSON()
  Return $$$OK
}

ClassMethod saveGood() As %Status
{
    set obj = {}
    set obj.name = %request.Get("name")
    set obj.cost = %request.Get("cost")
    set obj.store = %request.Get("store")
    set obj.partner =  %request.Get("partner")

    set result = ##class(TradeCompany.Good).saveGood(obj)
    write result.%ToJSON()
    Return result
}

ClassMethod deleteGood() As %Status
{
    set id = %request.Get("id")
    set result = ##class(TradeCompany.Good).%DeleteId(id)
    Return result
}

ClassMethod listGoods() As %Status
{
  set list = ##class(TradeCompany.Good).getAllGoods()
  write list.%ToJSON()
  Return $$$OK
}

ClassMethod saveContract() As %Status
{
    set obj = {}

    set obj.name =  %request.Get("name")
    set obj.partner = %request.Get("partner")

    set result = ##class(TradeCompany.Contract).saveContract(obj)
    write result.%ToJSON()
    Return result
}

ClassMethod deleteContract() As %Status
{
    set id = %request.Get("id")
    set result = ##class(TradeCompany.Contract).%DeleteId(id)
    Return result
}

ClassMethod listContracts() As %Status
{
  set list = ##class(TradeCompany.Contract).getAllContracts()
  write list.%ToJSON()
  Return $$$OK
}

ClassMethod saveOrder() As %Status
{
    set obj = {}
    set obj.date = $ZDATEH(%request.Get("date"), 3)
    set obj.number = %request.Get("number")
    set obj.cost = %request.Get("cost")
    set obj.good = %request.Get("good")
    set result = ##class(TradeCompany.Order).saveOrder(obj)
    write result.%ToJSON()
    Return result
}

ClassMethod deleteOrder() As %Status
{
    set id = %request.Get("id")
    set result = ##class(TradeCompany.Order).%DeleteId(id)
    Return result
}

ClassMethod listOrders() As %Status
{
  set list = ##class(TradeCompany.Order).getAllOrders()
  write list.%ToJSON()
  Return $$$OK
}

}
