#!/usr/bin/env ruby

require 'gtk3'
require 'gdk3'

require './code/keyring'

$main_builder = nil

def show_main_window()
    $main_builder = Gtk::Builder.new
    $main_builder.add_from_file "resources/ui/main.glade"
    window = $main_builder.get_object "MainWindow"
    headerbar = $main_builder.get_object "MainHeaderbar"
    headerbar.subtitle = keyring_get_user_pass()[2]

    $main_builder.connect_signals { |handler| method(handler) }

    return [window, $main_builder]
end

def onDestroy(args)
    Gtk.main_quit
end