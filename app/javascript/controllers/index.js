// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ConsultationsController from "./consultations_controller"
application.register("consultations", ConsultationsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import TextController from "./text_controller"
application.register("text", TextController)


import { Application } from '@hotwired/stimulus'
import ScrollReveal from 'stimulus-scroll-reveal'

const application2 = Application.start()
application2.register('scroll-reveal', ScrollReveal)


import VisibilityController from "./visibility_controller"
application.register("visibility", VisibilityController)
