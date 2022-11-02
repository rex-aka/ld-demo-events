# LaunchDarkly Demo Project configuration

resource "launchdarkly_project" "demo_project" {
  key  = var.project
  name = var.project

  tags = [
    "terraform",
  ]

  environments {
        key   = "${var.project}-1"
        name  = "${var.project}-1"
        color = "7B42BC"
        tags  = [ "terraform" ]
  }

  environments {
      key   = "${var.project}-2"
      name  = "${var.project}-2"
      color = "1AD2EA"
      tags  = [ "terraform" ]
  }

  default_client_side_availability {
    using_environment_id = true
    using_mobile_key     = false
  }
}

resource "launchdarkly_feature_flag" "header_text" {
  project_key = launchdarkly_project.demo_project.key
  key         = "headertext"
  name        = "0 - Header Text"
  description = "Enables the header text to welcome audience"

  variation_type = "string"
  variations {
    value       = var.header_text
    name        = "Show the event header text"
    description = "Show the event header text"
  }
  variations {
    value       = "${var.name}'s Demo"
    name        = "Show generic demo header text"
    description = "Displays header text for generic Demo"
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed",   
  ]
}

resource "launchdarkly_feature_flag" "prod_header" {
  project_key = launchdarkly_project.demo_project.key
  key         = "prodheader"
  name        = "1 - Production Header"
  description = "Enables the production header view in the UI"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "Show New Header Design"
    description = "Show the updated LaunchDarkly header"
  }
  variations {
    value       = "false"
    name        = "Show Old Header Design"
    description = "Displays header showing common app delivery "
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed",   
  ]
}

resource "launchdarkly_feature_flag" "qrcode" {
  project_key = launchdarkly_project.demo_project.key
  key         = "qrcode"
  name        = "2 - QR Code"
  description = "This flag enables the view of the QR Code on our application canvas for mobile device viewing"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "QR Code On"
    description = "Show the QR Code"
  }
  variations {
    value       = "false"
    name        = "QR Code Off"
    description = "Disable the QR Code for mobile device viewing "
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed"
  ]
}

resource "launchdarkly_feature_flag" "login" {
  project_key = launchdarkly_project.demo_project.key
  key         = "login"
  name        = "3 - Login UI"
  description = "Show the login box for user targeting"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "Login enabled"
    description = "Login box presented"
  }
  variations {
    value       = "false"
    name        = "Login Disabled"
    description = "Not able to login "
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed",   
  ]
}

resource "launchdarkly_feature_flag" "showlogo" {
  project_key = launchdarkly_project.demo_project.key
  key         = "showlogo"
  name        = "4 - Show Logo"
  description = "Show the logo on page"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "Show logo"
    description = "Display the logo"
  }
  variations {
    value       = "false"
    name        = "Disable logo"
    description = "Disable the logo from being viewed "
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed",   
  ]
}

resource "launchdarkly_feature_flag" "logoversion" {
  project_key = launchdarkly_project.demo_project.key
  key         = "logoversion"
  name        = "5 - Logo Version"
  description = "This flag controls which logo is visible within the application"

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "Show Toggle Logo"
    description = "Toggle makes their grand appearance!"
  }
  variations {
    value       = "false"
    name        = "Default LaunchDarkly Logo"
    description = "Shows the default LaunchDarkly Osmo logo"
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed",   
  ]
}

resource "launchdarkly_feature_flag" "cardshow" {
  project_key = launchdarkly_project.demo_project.key
  key         = "cardshow"
  name        = "6 - Release Cards"
  description = "This flag controls the visibility of the release cards on the bottom of the UI "

  variation_type = "boolean"
  variations {
    value       = "true"
    name        = "Show Release Cards"
    description = "Show the app delivery release cards"
  }
  variations {
    value       = "false"
    name        = "Disable Card Views"
    description = "Do not show the release cards "
  }
  
  defaults {
    on_variation = 0
    off_variation = 1
  }

  tags = [
    "terraform-managed",   
  ]
}
