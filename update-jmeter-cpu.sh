sudo apt-get install xmlstarlet -y
xmlstarlet version
xmlstarlet ed -u "//elementProp[@name='url']/stringProp[@name='Argument.value']" \
    -v "hello" \
    "for-cpu.jmx" \
    > "for-cpu.jmx"