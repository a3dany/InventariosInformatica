class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/$controller/all" {
            action = [GET: "listMobile"]
        }

        "/$controller/$id" (controller: "activo"){
            action = [GET: "showMobile", PUT: "updateMobile", POST: "saveMobile", DELETE: "deleteMobile"]
            constraints {
                id matches: /\d+/
            }
        }

        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/"(view:"/index")
		"500"(view:'/error')
	}
}
