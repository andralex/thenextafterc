module service;

import std.conv;
import vibe.d;

class MongoService
{
	private MongoCollection collection;
	const string title;

	this(MongoCollection collection, string title = null)
	{
		this.collection = collection;
		this.title = title;
	}

	void index()
	{
		logInfo("MongoService: GET /");
		render!("index.dt", title);
	}

	void postAdduser(
		string username,
		string email,
		string fullname,
		int age,
		string location,
		string gender,
		HTTPServerResponse res,
	)
	{
		logInfo(text("MongoService: POST /adduser : ", username));
		
		import vibe.utils.validation;
		auto bson = Json.emptyObject;
		bson.username = validateUserName(username);
		bson.email = email.validateEmail;
		bson.fullname = fullname;
		enforce(age < 200 && age >= 0, "wrong age");
		bson.age = age;
		bson.location = location;
		bson.gender = gender.toLower;
		//
		collection.insert(bson);
		//
		res.writeBody("");
	}

	Json getUserlist()
	{
		logInfo("MongoService: GET /userlist");
		return Json(collection.find!Json.array);
	}

	@path("deleteuser/:id")
	@method(HTTPMethod.DELETE)
	void pullOutUser(
		BsonObjectID _id,
		HTTPServerResponse res,
		)
	{
		logInfo(text("MongoService: GET /deleteuser/", _id));
		//
		collection.remove(["_id": _id]);
		//
		res.writeBody("");
	}
}
