#!/usr/bin/env ruby

require 'yaml'

def gen(defs)
  YAML.dump defs.each_with_object({}) { |val, hash|
    val.each do |k, v|
      hash[k] = v
    end
  }
end

def key(name: , key: , description: "", **opt)
  {
    "#{name}": {
      "key": key,
      "description": description,
    }.merge(**opt)
  }
end

def main
  puts gen([
      key(name: "g", key: "pass", description: "google account", expired: "2019-12-31", username: 'taro')
  ])
end

if __FILE__ == $0
  main
end
