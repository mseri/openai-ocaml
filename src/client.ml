type t =
  { api_key : string
  ; gen_url : string -> string
  ; c : Curl.t
  }

let create ?(secure=true) ?(host="api.openai.com") ?port api_key =
  let base_url = "http" ^ if secure then "s" else "" ^ "://" ^ host in
  let base_url = match port with None -> base_url | Some port -> base_url ^ ":" ^ string_of_int port in
  { api_key; gen_url = ( ^ ) base_url; c = Ezcurl_lwt.make () }
;;
