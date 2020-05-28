Class web.StoresList Extends %CSP.Page
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

ClassMethod body() As %Status
{
    &JS<
        <script type="text/javascript">

        var submitStore = (rawData) => {
            let data = JSON.parse(rawData);
            let message;
            if (data.result) {
                message = { type:"success", text: "Склад добавлен", expire:-1};
                $$('tab2_content').clear();
            }
            else
                message = { type:"error", text: data.message, expire:-1};
            webix.message(message);
        }

        var store_list_template = {
            id:"tab1_content",
            view:"datatable",
            columns:[

                { id:"storeID", header:"ID склада", adjust:"true" },

                { id:"partner", header:"ID компании", adjust:"true", minWidth:"150" },

                { id:"name", header:"Название", adjust:"true" },

                { id:"address", header:"Адрес", adjust:"true" },

                { 
                    id:"", 
                    template:"<input class='delbtn' type='button' value='Удалить'>",	
                    css:"padding_less",
                    width:100 
                }
  
            ],
            url:"/tradeCompany/listStores"
        };


        var store_form_template = {
            id:"tab2_content",
            view:"form",
            width: "800",
            elements:[
                {
                    view: "richselect",
                    name: "partner",
                    labelWidth:"150",
                    value: 1, 
                    options: "/tradeCompany/listPartners",
                    label: "Компания владелец"
                },
                {view: "text", name: "name", label: "Название"},
                {view: "text", name: "address", label: "Адрес"},
                
                { view:"button",  value:"Сохранить", id:"btn", 
                    click:function(){
                            var values = this.getFormView().getValues();
                            console.log(values)
                            webix.ajax().post("/tradeCompany/saveStore", values, submitStore);
                            var url = $$(`tab1_content`).data.url
                            $$(`tab1_content`).clearAll();
                            $$(`tab1_content`).load(url);
                        }
                }
            ]
        };
        var menu_data = [
	        {id: "tab1", icon: "mdi mdi-table", value:"Список складов"},
	        {id: "tab2", icon: "mdi mdi-pencil", value:"Добавление склада"},
        ];
        var ui_template = {
            height: '100%',
            rows: [
                    { 
                        view: "toolbar", 
                        padding:3, 
                        elements: [
                            { 
                                view: "button",
                                type: "icon", 
                                icon: "mdi mdi-menu",
                                width: 37, align: "left", css: "app_button", click: function(){
                                    $$("$sidebar1").toggle();
                                }
                            },
                            { 
                                view: "label", 
                                label: "Склады"
                            },
                        ]
                    },
                    { 
                        cols:[
                                {
                                    view: "sidebar",
                                    data: menu_data,
                                    on:{
                                        onAfterSelect: function(id){
                                            $$(`${id}_content`).show();
                                        }
                                    }
                                },
                                { 
                                    id:"t1_content",
                                    cells:[
                                            store_form_template,
                                            store_list_template
                                    ]   
                                }
                        ]
                    }
            ]
        };


        webix.ready(function(){
            webix.ui(ui_template);
            $$("tab1_content").on_click.delbtn=function(e, id, trg){
               
                var val = $$("tab1_content").getItem(id).storeID;
                webix.message("Склад удален: "+ val);
                webix.ajax().post("/tradeCompany/deleteStore", {"id":val});
                var url = $$(`tab1_content`).data.url
                $$(`tab1_content`).clearAll();
                $$(`tab1_content`).load(url);
                //block default onclick event
                return false;
            };
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
