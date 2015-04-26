import vibe.d;
import service;

shared static this()
{
	immutable string title = "vibe.d web app";

	logInfo("Connecting to DB...");
	auto db = connectMongoDB("localhost").getDatabase("vibed");
	auto collection = db["userlist"];

	logInfo("Creating service...");
	auto mongoService = new MongoService(collection, title);
	auto mongoServiceSettings = new WebInterfaceSettings;
	mongoServiceSettings.urlPrefix = "/users";


	logInfo("Setup router...");
	auto router = new URLRouter;
	router.registerWebInterface(mongoService, mongoServiceSettings);
	router
		.get("/", (req, res)  
			{ res.redirect("/users"); } )
		.get("*", serveStaticFiles("public/"));

	logInfo("Setup HTTP server...");
	auto settings = new HTTPServerSettings;
	with(settings)
	{
		bindAddresses = ["127.0.0.1"];
		port = 8080;
		errorPageHandler = 
			(req, res, error)
			{
				with(error) res.writeBody(
					format("Code: %s\n Message: %s\n Exception: %s",
						error.code, 
						error.message, 
						error.exception ? error.exception.msg : ""));
			};		
	}

	logInfo("Listen http://127.0.0.1:8080");
	listenHTTP(settings, router);
}
