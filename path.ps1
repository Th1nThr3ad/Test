$names = dir -recurse -file *.exe 'C:\Program Files\PowerToys' | wsl grep -o C:.* | sort -Unique | wsl grep -v -e '^[[:space:]]*$'



For( $i=0; $i -le $names.length; $i++){
    
    $addPath = $names[$i] 
   
    if (Test-Path $addPath){
        $regexAddPath = [regex]::Escape($addPath)
        #$env:Path -split ';' | Where-Object {$_ -notMatch "^$regexAddPath\\?"}
        $arrPath = $env:Path -split ';' | Where-Object {$_ -notMatch "^$regexAddPath\\?"}
        $env:Path = ($arrPath + $addPath) -join ';'
        echo $addPath
        echo  "sucessfully added "
    } else {
        Throw "'$addPath' is not a valid path."
    }
   
}