import vibe.d;
import service;

shared static this()
{
	immutable string title = "Express";

	logInfo("Connecting to DB...");
	auto db = connectMongoDB("localhost").getDatabase("vibed");
	auto collection = db["userlist"];

	logInfo("Querying DB...");
	//Bson query = Bson(["name" : Bson("hans")]);
	auto result = collection.find();

	logInfo("Iterating results...");
	foreach (i, doc; result)
		logInfo("Item %d: %s", i, doc.toJson().toString());

	auto mongoService = new MongoService(collection, title);

	auto mongoServiceSettings = new WebInterfaceSettings;
	mongoServiceSettings.urlPrefix = "/users";

	auto router = new URLRouter;
	router.registerWebInterface(mongoService, mongoServiceSettings);
	router.get("*", serveStaticFiles("public/"));

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

	listenHTTP(settings, router);
}
