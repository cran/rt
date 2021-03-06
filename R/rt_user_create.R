#' Parse the response body from a call to \code{\link{rt_user_create}}
#'
#' @param body (character)
#' @return (numeric) The user ID
parse_user_create_body <- function(body) {
  id <- stringr::str_extract(body, "\\d+")

  if (is.na(id)) {
    stop("Failed to parse response body from call to rt_user_create.")
  }

  as.numeric(id)
}

#' Create a user
#'
#' @param password (character) The password
#' @param name (character) Optional. User name
#' @param email_address (character) Optional. User email
#' @param real_name (character) Optional. User real name
#' @param organization (character) Optional. User organization
#' @param privileged (numeric) Optional. User privilege status
#' @param disabled (numeric) Optional. User disabled status
#' @param ... Other arguments passed to \code{\link{rt_POST}}
#'
#' @return (numeric) The ID of the newly-created user
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Create a barebones user with just a name
#' rt_user_create("Some Person")
#'
#' # Create user that also has an email address
#' rt_user_create("Person", email_address = "person@example.com")
#' }
rt_user_create <- function(name,
                           password = NULL,
                           email_address = NULL,
                           real_name = NULL,
                           organization = NULL,
                           privileged = NULL,
                           disabled = NULL,
                           ...) {
  params <- compact(list(Name = name,
                         Password = password,
                         EmailAddress = email_address,
                         RealName = real_name,
                         Organization = organization,
                         Privileged = privileged,
                         Disabled = disabled))

  user_info <- construct_newline_pairs(params)

  url <- rt_url("user", "new")
  response <- rt_POST(url, body = list(content = user_info), ...)

  if (stringr::str_detect(response$body, "Could not create user.")) {
    stop("Could not create user ",
         name,
         ". Check that properties such as Name and EmailAddress ",
         "are unique for the user.", call. = FALSE)
  }

  stopforstatus(response)

  invisible(parse_user_create_body(response$body))
}
