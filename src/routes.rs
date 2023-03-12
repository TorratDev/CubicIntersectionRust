use rocket::{get, serde::json::Json};
use serde_json::json;

///
#[get("/")]
pub async fn index() -> Json<serde_json::Value> {
    let data = json!({
        "message": "Hello, world!"
    });
    Json(data)
}
