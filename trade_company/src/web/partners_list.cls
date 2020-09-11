Class web.PartnersList Extends %CSP.Page
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

        var submitPartner = (rawData) => {
            let data = JSON.parse(rawData);
            let message;
            if (data.result) {
                message = { type:"success", text: "Компания добавлена", expire:-1};
                $$('tab2_content').clear();
            }
            else
                message = { type:"error", text: data.message, expire:-1};
            webix.message(message);
        }

        var partner_list_template = {
            id:"tab1_content",
            view:"datatable",
            columns:[

                { id:"partnerID", header:"ID компании", adjust:"true" },

                { id:"name", header:"Название", adjust:"true" },

                { id:"phone", header:"Телефон", adjust:"true" },

                { id:"address", header:"Адрес", adjust:"true" },

                { 
                    id:"", 
                    template:"<input class='delbtn' type='button' value='Удалить'>",	
                    css:"padding_less",
                    width:100 
                }
  
            ],
            url:"/tradeCompany/listPartners"
        };


        var partner_form_template = {
            id:"tab2_content",
            view:"form",
            width: "800",
            elements:[
                {view: "text", name: "name", label: "Название"},
                {view: "text", name: "phone", label: "Телефон"},
                {view: "text", name: "address", label: "Адрес"},
                { view:"button",  value:"Сохранить", id:"btn", 
                    click:function(){
                            var values = this.getFormView().getValues();
                            webix.ajax().post("/tradeCompany/savePartner", values, submitPartner);
                            var url = $$(`tab1_content`).data.url
                            $$(`tab1_content`).clearAll();
                            $$(`tab1_content`).load(url);
                        }
                }
            ]
        };
        var menu_data = [
	        {id: "tab1", icon: "mdi mdi-table", value:"Cписок компаний"},
	        {id: "tab2", icon: "mdi mdi-pencil", value:"Добавление компании"},
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
                                label: "Компании - поставщики"
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
                                            partner_form_template,
                                            partner_list_template
                                    ]   
                                }
                        ]
                    }
            ]
        };


        webix.ready(function(){
            webix.ui(ui_template);
            $$("tab1_content").on_click.delbtn=function(e, id, trg){
               
                var val = $$("tab1_content").getItem(id).partnerID;
                webix.message("Компания удалена: "+ val);
                webix.ajax().post("/tradeCompany/deletePartner", {"id":val});
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
