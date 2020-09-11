Class web.TradeCompanyIndex Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
  do ..header()
  do ..body()
  do ..footer()
    Quit $$$OK
}

ClassMethod header() As %Status
{
  &HTML<
  <html>
    <head>
      <script type="text/javascript" src="webix/webix.min.js" ></script>
      <link rel="stylesheet" type="text/css" href="webix/webix.min.css">
      <link rel="stylesheet" href="https://cdn.materialdesignicons.com/2.7.94/css/materialdesignicons.css?v=7.2.0" type="text/css" charset="utf-8">
    </head>
  >

  Quit $$$OK
}

/// mostly JS on webix framework
ClassMethod body() As %Status
{
    &JS<
        <script type="text/javascript">
        var menu_template = {
            container:"menu",   
            view:"menu",
            type: {
                height: 40
            },
            data:[
                { id:"1",value:"Компании продажники"},
                { id:"2",value:"Склады"},
                { id:"3",value:"Товары"},
            ],
            on:{
                onMenuItemClick:function(id){
                    switch(id) {
                        case "1":
                            $$("frame-body").load("http://localhost/csp/irisapp/web.PartnersList.cls");
                            break;
                        case "2":
                            $$("frame-body").load("http://localhost/csp/irisapp/web.StoresList.cls");
                            break;
                        case "3":
                            $$("frame-body").load("http://localhost/csp/irisapp/web.GoodsList.cls");
                            break;
                        default:      
                    }
                }
                    
            }
        }
        var frame_template = {
            view:"iframe", 
            id:"frame-body", 
            src:"http://localhost/csp/irisapp/web.PartnersList.cls"
        }
        var ui_template = {
            
            type:"wide",
            height: '100%',
            rows: [
                menu_template, 
                frame_template
            ]
        }
        
        webix.ready(function(){
            webix.ui(ui_template);
        });
        </script>
    >
  Quit $$$OK
}

ClassMethod footer() As %Status
{
  &HTML<
    </body></html>
  >
  Quit $$$OK
}

}
