#!/bin/bash

bs_dir='../../twitter/bootstrap'
lrb_dir='.'
lrb_img_dir="$lrb_dir/vendor/assets/images/twitter/bootstrap"
lrb_js_dir="$lrb_dir/vendor/assets/javascripts/twitter/bootstrap"
lrb_styles_dir="$lrb_dir/vendor/assets/stylesheets/twitter"
lrb_fw_dir="$lrb_dir/vendor/frameworks/twitter/bootstrap"

if [ ! -d $bs_dir ]; then
    echo "Bootstrap not found. You might want to clone the bootstrap repo from http://twitter.github.com/bootstrap/ into $bs_dir"
    cd ../../
    git clone git://github.com/twitter/bootstrap.git twitter/bootstrap
    cd $lrb_dir/scripts
    # exit 1
fi

# styles
for f in $bs_dir/less/*.less; do
    bn=$(basename $f)
    sed -e 's#"\.\./img/\([^"]*\)"#"twitter/bootstrap/\1"#g' \
        -e 's#background-image: url(#background-image: asset-url(#g' \
        $f > $lrb_fw_dir/$bn
done
