module C80Push
  module AdminHelper

    # noinspection RubyResolve
    def first_region(subj)
      res = '-'
      unless subj.regions.count.zero?
        res = subj.regions.first.title
      end
      res.html_safe
    end

    # noinspection RubyResolve
    def ul_offices(subj)
      res = '-'
      unless subj.offices.count.zero?
        res = ''
        subj.offices.each do |office|
          e = "<li>#{office.title}</li>"
          res += e
        end
        res = "<ul>#{res}</ul>".html_safe
      end
      res
    end

    # noinspection RubyResolve
    def ul_dealers(subj)
      res = '-'
      unless subj.dealers.count.zero?
        res = ''
        subj.dealers.each do |dealer|
          e = "<li>#{dealer.title}</li>"
          res += e
        end
        res = "<ul>#{res}</ul>".html_safe
      end
      res
    end

  end
end