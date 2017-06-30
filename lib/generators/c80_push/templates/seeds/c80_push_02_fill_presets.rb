# rake db:seed:c80_push_02_fill_presets

C80Push::Preset.delete_all
C80Push::Preset.create!([
                            {title:'blueDotIcon', color:'#1E98FF'},
                            {title:'redDotIcon', color:'#ED4543'},
                            {title:'darkOrangeDotIcon', color:'#E6761B'},
                            {title:'nightDotIcon', color:'#0E4779'},
                            {title:'darkBlueDotIcon', color:'#177BC9'},
                            {title:'pinkDotIcon', color:'#F371D1'},
                            {title:'grayDotIcon', color:'#B3B3B3'},
                            {title:'brownDotIcon', color:'#793D0E'},
                            {title:'darkGreenDotIcon', color:'#1BAD03'},
                            {title:'violetDotIcon', color:'#B51EFF'},
                            {title:'blackDotIcon', color:'#595959'},
                            {title:'yellowDotIcon', color:'#FFD21E'},
                            {title:'greenDotIcon', color:'#56DB40'},
                            {title:'orangeDotIcon', color:'#FF931E'},
                            {title:'lightBlueDotIcon', color:'#82CDFF'},
                            {title:'oliveDotIcon', color:'#97A100'}
                        ])