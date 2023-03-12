use rocket::{get, serde::json::Json};
use serde_json::json;

fn main() {
    println!("Hello, world!");

    #[get("/")]
    fn index() -> Json {
        let data = json!({
            "message": "Hello, world!"
        });
        Json(data)
    }
}
