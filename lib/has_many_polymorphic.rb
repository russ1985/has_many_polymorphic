require 'has_many_polymorphic/has_many_polymorphic'
ActiveRecord::Base.send :include, RussellEdge::HasManyPolymorphic

#used to tie into Rails initialization load the models so the relationships are created
require 'has_many_polymorphic/autoload'


