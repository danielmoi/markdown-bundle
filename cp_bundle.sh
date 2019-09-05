# Ensure that "/" is at the end so _contents_ are copied without parent folder
echo $MARKDOWN_ASSETS_PATH
echo $MARKDOWN_READER_MARKDOWN_ASSETS_BUNDLE_PATH

# -a        Preserve permissions
# -v        Verbose
# --delete  Remove extraneous files from dest dirs

# iOS
rsync -rv \
  --exclude="cp_bundle.sh" \
  --exclude=".git" \
  --exclude=".gitignore" \
  --delete \
  $MARKDOWN_ASSETS_PATH \
  $MARKDOWN_READER_MARKDOWN_ASSETS_BUNDLE_PATH

# Web
rsync -rv \
  --delete \
  $MARKDOWN_ASSETS_PATH/css/ \
  $FANZCA_ZIP_PATH/css/

rsync -rv \
  --delete \
  $MARKDOWN_ASSETS_PATH/js/ \
  $FANZCA_ZIP_PATH/js/

cd $FANZCA_ZIP_PATH/
CSS_WEB_ZIP_NAME="css.zip"
zip -r $CSS_WEB_ZIP_NAME css

cd $FANZCA_ZIP_PATH/
JS_WEB_ZIP_NAME="js.zip"
zip -r $JS_WEB_ZIP_NAME js
