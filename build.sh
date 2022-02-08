set +v

echo Building...
sass src/shoe-leather.scss:dist/shoe-leather-min.css --style compressed
sass src/shoe-leather.scss:dist/shoe-leather.css 

for I in "./dist/shoe-leather-min.css" "./dist/shoe-leather.css"; do 

    SIZE=$(wc -c $I | awk '{print $1}' )

    SIZE_MB=($SIZE / 1024)

    echo $I - $SIZE_MB MB \($SIZE Bytes\)

done
