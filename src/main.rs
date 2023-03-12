use rocket::{get, serde::json::Json};
use serde_json::json;
fn main() {
    println!("Hello, world!");

    /// First api enpoint
    #[get("/")]
    fn index() -> Json<serde_json::Value> {
        let data = json!({
            "message": "Hello, world!"
        });
        Json(data)
    }
}
