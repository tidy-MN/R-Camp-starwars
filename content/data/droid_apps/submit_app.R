#install.packages(c("distill", "postcards", "rmarkdown"))

library(distill)
library(postcards)


# Droid bio
if (!exists("intro")) {
  intro <- "**Hello!**  I am a classically trained data scientist living on planet Endor. Wherever I go I bring a supply of good energy. I currently work for the Oculus Corp, but I have been feeling rebellious lately. I love talking about urban forests and discussing true crime podcasts."
}

# Create a default application
create_website(dir = ".", title = "Rey's Scrap Team")
file.remove("droid_application.Rmd")
create_postcard(file = "droid_application.Rmd", template = "Onofre")
app_text <- readLines("droid_application.Rmd")

# Update name
app_text[2] <- paste0('title: "', nickname, " the ", droid, " Droid", '"')

# Update image
droid <- tolower(droid)

droid_img <- switch(droid,
                "mouse" = "mouse_droid2",
                "gonk"  = "trash_droid_rev",
                "r2d2"  = "r2d2_cl",
                droid)

app_text[3]  <- paste0('image: https://raw.githubusercontent.com/MPCA-data/R2D2_rescue_mission/main/', droid_img, '.png')

# Image style
app_text[7] <- "css: droid.css"
app_text[8] <- ""
app_text[9] <- "links:"

# Update personal intro
app_text[21:25] <- ""

app_text[20] <- intro

# Add best skill
app_text[22] <- paste0('You need to see me <span style="font-size: 155%;"> ', toupper(skill), '</span>.')

# Save the app
writeLines(app_text, "droid_application.Rmd")

# Update the theme
web_theme <- readLines("_site.yml")
web_theme[8] <- '    - text: "Droid App #77"'
web_theme[10:11] <- ""

writeLines(web_theme, "_site.yml")


# Render the app
rmarkdown::render("droid_application.Rmd", )
rmarkdown::render_site()
browseURL("_site/droid_application.html")

