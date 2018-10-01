## An ASP.NET RESTful API template for ASNA Visual RPG for .NET

> This project was created with AVR for .NET 14.x (for use with Visual Studio 2015) but will work as-is with AVR 15.x (for use with Visual Studio 2017). It may work with lower AVR for .NET versions but has not been tested with them. 

Several years ago, Microsoft provided its Web API facility for .NET.  This Web API makes it easy to create RESTful services with C# and VB.NET. This AVR for NET project provides a subset of MS's Web API—intended specifically for AVR. You can copy this project and use it as the basis for a new project or you can open it and then save it as a template for new projects. [See this article on ASNA.com for instructions how to save an AVR project as a new project template](https://asna.com/us/tech/kb/doc/custom-vs-templates) 


In many cases, RESTful services return Json data. Json data is generally fetched with JavaScript and used to dynamically populate a Web page--but it is also used as a data transfer format business-to-business services. When used to populate a page, that resulting Json may be used to populate an autocomplete lookup or a custom grid element like [DataTables](https://datatables.net/) or [Tabulator](http://tabulator.info/).

This AVR for .NET ASP.NET RESTful template lets you quickly scaffold up an ASP.NET program that has :

* [ASP.NET page routing](https://asna.com/us/tech/kb/doc/asp-net-routing)
* [Json](https://www.copterlabs.com/json-what-it-is-how-it-works-how-to-use-it/) API routing
* [RESTful](https://restfulapi.net/) API endpoints that return Json results
* [Bootstrap 4](https://getbootstrap.com/) CSS framework
* [jQuery](https://jquery.com/) JavaScript library
* [FontAwesome](https://fontawesome.com/) icons

> jQuery is included because Bootstrap 4 needs it.  There was a time when jQuery was indespensible. For most cases today it's no longer necessary. Even though this example includes jQuery, it's included only because some of the BootStap 4 components need it (a decision BS4 eecision-makers probably rue now). It's best to try to avoid using jQuery in your code. <a href='http://youmightnotneedjquery.com/'>  See this site for tips</a> on how to avoid needing jQuery.


This template includes two external DLLs:

* **ASNA.JsonRestRouting.dll** &mdash; this provides the routing engine for  REST web APIs and it provides a base controller that converts its methods to Json. 
* **Newtonsoft.Json.dll** — this is a free .NET DLL that converts objects to Json. This is a *very* popular .NET DLL, its been [downloaded more than 149 million times](https://www.nuget.org/packages/Newtonsoft.Json/) and is the defacto standard for Json work in .NET. If you're doing any Json work with AVR, this DLL is highly recommended. [The Newtonsoft DLL was discussed in this ASNA.com article.](https://asna.com/us/tech/kb/doc/read-write-json) Although this template includes the Newtonsoft.Json.dll, it may not be the latest version available. [Consider downloading your own fresh copy of this DLL.](https://github.com/JamesNK/Newtonsoft.Json/releases)

This text doesn't attempt to explain REST and routing. Rather it assumes some familiarity with REST and routing and its purpose is to show how to quickly get started using the template. 

You can read more about ASP.NET routing here:
* [MS article on using ASP.NET routing with Web forms](https://msdn.microsoft.com/en-us/library/dd329551.aspx)
* [An AVR-centric article that discusses using ASP.NET routing](https://asna.com/us/tech/kb/doc/asp-net-routing)

You can read more about Json here:

* [Read and write Json with AVR](https://asna.com/us/tech/kb/doc/read-write-json)
* [Introductory Json article](https://www.copterlabs.com/json-what-it-is-how-it-works-how-to-use-it/)


The web is full of articles and blog posts about REST. Here are a few to get you started:
* [REST API Tutorial](https://restfulapi.net/)
* [Learn REST: A Tutorial](http://rest.elkstein.org/)
* [Beginner's tutorial for understanding RESTful APIs](https://mlsdev.com/blog/81-a-beginner-s-tutorial-for-understanding-restful-api) 

### Template output 

This template is intended to serve as a jumping off place for you to build your own web sites and APIs. To use the template, start a new AVR for .NET ASP.NET project selecting the AVR for .NET ASP.NET RESTful template (as shown below).

![](https://asna.com/filebin/marketing/article-figures/selecting-restful-template.png)

When you run the template, it first shows the home page shown below in Figure 1a. 

![](https://asna.com/filebin/marketing/article-figures/restful-template-1.png)
<br><small> Figure 1a. The RESTful template's home page. </small>

Notice the URL in the browser doesn't include an ASPX page, even though the `views/index.aspx` page is being shown. ASPX page routing done by the built-in [ASP.NET routing engine](https://asna.com/us/tech/kb/doc/asp-net-routing). We'll take a look at that configuration in a minute. 

Clicking on the `api/customers/345` link shows the Json that represents a single customer as shown below in Figure 1b.

![](https://asna.com/filebin/marketing/article-figures/restful-template-2.png)
<br><small> Figure 1b. Raw Json API output showing a single customer</small>

Clicking on the `api/customers` link shows the Json that represents a list of customers as shown below in Figure 1c.

![](https://asna.com/filebin/marketing/article-figures/restful-template-3.png)
<br><small> Figure 1c. Raw Json API output showing a list of customers</small>

The raw Json output from a web API is emitted from a method you provided. The ASNA.JsonRestRouting DLL provides the URL routing necessary to invoke that method. The output of a Json API is rarely, if ever, displayed in this raw fashion. It's usually consumed by JavaScript (and maybe a JavaScript library or control to dynamically populate a part of a page with [Ajax](https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX). 


###  Configuring routes

Routes are configured in the `Global.asax.vr` source file. It includes two namespace directives to be able to use then `System.Web.Routing` and the `ASNA.JsonRestRouting` namespaces. The full source for `Global.asax.vr` is shown below in Figure 2. 

	<%@ Application Language="AVR" %>
	<%@ Import namespace="System.Web.Routing" %>
	<%@ Import namespace="ASNA.JsonRestRouting" %>

	<script runat="server">        
	    BegSr Application_Start
	        DclSrParm sender Type(*Object)
	        DclSrParm e Type(EventArgs)

	        // Code that runs on application startup.

	        RegisterRoutes(RouteTable.Routes)
	    EndSr

	    BegSr RegisterRoutes
	        DclSrParm routes Type(RouteCollection)

	        DclFld restRouter Type(ASNA.JsonRestRouting.Router) 
	        restRouter = *New ASNA.JsonRestRouting.Router(routes) 

	        // ASPX page routes. 		
	        // This support is provided directly by MS .NET.
	        routes.MapPageRoute("home", "", "~/views/index.aspx")

	        // Add as many routes here as needed.
	        // This support is provided by the ASNA.JsonRestRouting.Router.
	        RestRouter.Get("api/customers/{id}", "ShowAction", *TypeOf(CustomerController)) 
		RestRouter.Get("api/customers", "ListAction", *TypeOf(CustomerController)) 
        EndSr
	</script>

<br><small>Figure 2. The `Global.asax.vr` file is where routes are registered.</small>

To ensure no URL is used as ASP.NET's start page when running your app from inside Visual Studio, be sure to set the `Specific page` to an empty string in your project's Property Pages as shown below in Figure 3. This ensure the `home` route configured in Figure2's code is invoked.

![](https://asna.com/filebin/marketing/article-figures/set-empty-start-page-avr-asp-net.png)
<br><small>Figure 3. Setting your project's start page to an empty string to invoke the `home` route.</small>

#### Configuring ASPX page routes

The `RegisterRoutes` method is called in `Global.asax.vr's` `Application_Start` event handler. This registers the application routes for all users of the app. The line below in `RegisterRoutes`uses the `routes`object (made available from `System.Web.Routing`) to define routes for ASPX pages. 

	routes.MapPageRoute("home", "", "~/views/index.aspx")

It names the route `home`, specifies its URL (in this case an empty string), and the page to show when that route is entered into the browser. Generally, you'd use a line like this to route to your app's home page. You'll register your app's ASPX pages here. For example, you may use this line to routine to a sales listing page:

	routes.MapPageRoute("sales", "sales-listing", "~/views/sales-listing.aspx")

Routing ASPX pages like isn't necessary to use the RESTful API, but it keeps the ASPX URLs consistent with the API URLs. If this consistency isn't important or if there isn't any value in mapping rational URLs to your ASPX pages you can skip the processing of mapping ASPX pages.  You can also map selected ASPX pages (highly used pages, for examples) and leave others alone. 

> The RESTful template provides a `views` folder for you to put your ASPX pages in. There isn't a functional reason for this—but it keeps the root of the web site clean.  With this route, the `sales-listing` URL would display the sales-`listing.aspx` page. You can also specify what are effectively query string values in route definitions. For example, this route:

ASP.NET's routing engine provides a way to pass values to a page. For example, 

	routes.MapPageRoute("sales", "sales-listing/2018", "~/views/sales-listing.aspx")

displays the `sales-listing.aspx` page  and pass it `2018` as an argument (that can be read like a query string) to govern what sales listing data is displayed. [See this article for more on route arguments.](https://asna.com/us/tech/kb/doc/asp-net-routing)


#### Configuring API routes

This line in the web.config file registers an API route:

	RestRouter.Get("api/customers/{id}", "ShowAction", *TypeOf(CustomerController))
`RestRouter` is an instance of `ASNA.JsonRestRouting.Router`. It has methods that correspond to HTTP methods. In this case, the `Get` method is used to register a method that corresponds to an HTTP GET request. Whenever an HTTP Get request is received coming from the URL specified (the first argument), the method provided (the second argument) in the class provided (the third argument) is called, passing to it any argument values specified in braces. 

In this example, the `ShowAction` method in the `CustomerController` class is called, passing `id` to it. Controllers are classes (this template includes the example `CustomerController` class) . Controllers extend the `ASNA.JsonRestRouting.Controller` class and provide the code that returns a response to the incoming API request. 

The template presented here includes the example controller shown below in Figure 4. Notice its name is `CustomContoller` and it has a `ShowAction` method. The route created above passes control to this `ShowAction` method, passing it the `id` argument. The names of any arguments provided in the URL *must* match the parameter names provided in the method.

	Using System

	// An example controller.
	BegClass CustomerController Access(*Public) +
	                            Extends(ASNA.JsonRestRouting.Controller)

	    // Example ShowAction method. 
	    BegFunc ShowAction Access(*Public) Type(CustomerEntity) 
	        DclSrParm Id Type(*Integer4) 

	        // This method hardcodes a customer lookup. 
	        // In production, you'd use the given Id value 
	        // to look up the exact customer number in a data file
	        // or some other data store. 

	        DclFld Entity Type(CustomerEntity) New()
	        Entity.CMCustNo = Convert.ToInt32(id )
	        Entity.CMName = 'Neil Young'
	        Entity.CMAddr1 = 'Broken Arrow'
	        Entity.CMCity = 'Santa Cruz'
	        Entity.CMState = 'CA'
	        Entity.CMCntry = 'US'
	        Entity.CMPostCode = '95603'
	        Entity.CMPhone = '(831) 205-3345'
	        Entity.CMFax  = 8312053346
	        Entity.CMActive = '1'

	        // The ASNA.JsonRestRouting router implicitly maps the return type to Json. 
	        LeaveSr Entity 
	    EndFunc        

	    BegFunc ListAction Access(*Public) Type(CustomerEntity) Rank(1) 

	        DclFld EntityList Type(List(*Of CustomerEntity)) New()

	        // This method hardcodes customer list creation. In production, you'd loop over rows
	        // in a file.

	        DclFld Entity Type(CustomerEntity) 

	        Entity = *New CustomerEntity()
	        Entity.CMCustNo = 1
	        Entity.CMName = 'Neil Young'
	        Entity.CMAddr1 = 'Broken Arrow'
	        Entity.CMCity = 'Santa Cruz'
	        Entity.CMState = 'CA'
	        Entity.CMCntry = 'US'
	        Entity.CMPostCode = '95603'
	        Entity.CMPhone = '(831) 205-3345'
	        Entity.CMFax  = 8312053346
	        Entity.CMActive = '1'
	        EntityList.Add(Entity) 

	        Entity = *New CustomerEntity()
	        Entity.CMCustNo = 2
	        Entity.CMName = 'Warren Zevon'
	        Entity.CMAddr1 = 'Heaven Lane'
	        Entity.CMCity = 'Big Sky'
	        Entity.CMState = 'ET'
	        Entity.CMCntry = 'US'
	        Entity.CMPostCode = '00001'
	        Entity.CMPhone = '(800) 205-3345'
	        Entity.CMFax  = 8002053346
	        Entity.CMActive = '0'
	        EntityList.Add(Entity) 

	        Entity = *New CustomerEntity()
	        Entity.CMCustNo = 3
	        Entity.CMName = 'Van Morrison'
	        Entity.CMAddr1 = 'Mystic Avenue'
	        Entity.CMCity = 'Belfast'
	        Entity.CMState = 'ET'
	        Entity.CMCntry = 'Ireland'
	        Entity.CMPostCode = '234-002'
	        Entity.CMPhone = '21-465-9123'
	        Entity.CMFax  = 0
	        Entity.CMActive = '1'
	        EntityList.Add(Entity) 

	        // The ASNA.JsonRestRouting router implicitly maps the return type to Json. 
	        LeaveSr EntityList.ToArray() 
	    EndFunc        

	EndClass

	// Example entity class. 
	BegClass CustomerEntity Access(*Public)
	    DclProp CMCustNo    Type(*Integer4) Access(*Public)
	    DclProp CMName      Type(*String) Access(*Public)
	    DclProp CMAddr1     Type(*String) Access(*Public)
	    DclProp CMCity      Type(*String) Access(*Public)
	    DclProp CMState     Type(*String) Access(*Public)
	    DclProp CMCntry     Type(*String) Access(*Public)
	    DclProp CMPostCode  Type(*String) Access(*Public)
	    DclProp CMActive    Type(*String) Access(*Public)
	    DclProp CMFax       Type(*Packed) Len(9,0) Access(*Public)
	    DclProp CMPhone     Type(*String) Access(*Public)
	EndClass

<br><small>Figure 4. The template's example controller.</small>

> In the interest of presenting example code concisely, the controller class's methods shown above in Figure 4 violate an important application design rule called the [Single Responsibity Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle). In a production application you don't want logic embedded in a controller method&mdash;don't try to make controller methods do too much. Ideally, a repository class would provide the logic for fetching data. The controller's methods should only concern themselves with fetching data from that repository class and returning either the data returned or providing an error condition. 

In a controller class that extends `ASNA.JsonRestRouting.Controller` function return types are implicitly converted to Json (via the Newtonsoft DLL). `ShowAction` returns an instance of the `CustomerEntity` class and `ListAction` returns an array of `CustomerEntity` instances (both of which is also in Figure 4 above). For example purposes these methods hardcode`CustomerEntity` instances; in a production app you'd write code to create these object instances. 

#### For internal use

    C:\Users\roger\Documents\Programming\AVR\Web\RESTful-Template


