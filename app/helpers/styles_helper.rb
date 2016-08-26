module StylesHelper
  VIRTUAL_STYLES = {
    "-pricing-card" => "dib w-100 w-25-ns ba br2 b--light-silver pa4 tc center"
  }.freeze

  def cn(styles)
    styles.split(' ').map do |style|
      if style[0] == "-"
        VIRTUAL_STYLES[style]
      else
        style
      end
    end.join(' ')
  end
end
