Class TradeCompany.Utils
{

ClassMethod getStatus(saveResult As %Status) As %Status
{
    if $$$ISOK(saveResult){
        set result = {"result": true}
    }
    else {
        set result = {"result": false}
    }
    set ErrorMessage = ##class(%SYSTEM.Status).GetErrorText(saveResult)
    set result.message = ErrorMessage

    return result
}

}
