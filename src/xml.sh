#!/bin/sh

###
# parseur de xml en shell, 
# if THE C is for the braves, SHELL is for the ???
#
# le but ici est de parser un xml (non polue)
###
function gnl 
{
    declare -a tab=( null )
    declare -i i=0

    while IFS='' read -r line || [[ -n "$line" ]]; do
        if [[ "$line" =~ (\<.*\>$) ]] || [[ "$line" =~ (\</.*\>$) ]] ; then
            #echo "Text read from file: $line"
            if [ -n "$tmp" ] ; then 
                tab[$i]="$tmp\n" ; let i++
                unset tmp
            fi
            tab[$i]="$line\n" ; let i++
        else 
            #echo "Text read from new line file: $line"
            #ici une var tmp est set et sa value est += a chaque tour, des que la balise se ferme la tmp est unset
            if [ -z "$tmp" ] ; then 
                tmp=`echo "$line" | sed 's/ *$//g'` # regex cancer a trouver
            else
                tmp="$tmp `echo $line | sed 's/ {2,}|\t//g'`" # bref encore un autre cancer a trouver 
            fi
        fi 
    done < "$1"
    echo "\n\n===================\n\n"
    echo "this is my good file = \n ${tab[@]}"
}
function exemple 
{
    echo "<plist version=\"1.0\">
    <vars>
        <v1 meta=\"tab1\"> la v1 est la premiere variable du lot </v1>
        <v2 meta=\"tab2\"> bah ce si con que ca, pour la suite</v2>
    </vars>
    <vars meta=\"especial\">
        <v1 meta=\"banana\"> donc ici on est un peut diferent de la v1</v1>
        <!-- et pour finir un peti commentaire sympa :3 -->
    </vars>
    <tab meta=\"exemple\">
        <v1> je       
        peut 
        etre 
        aussi 
        sur plusieurs
        lignes 
        c moins 
        marrant n'est pas ?
        mdr
        </v1> 
    <vars>
</plist>" > exemple.xml
echo "exemple file has been created"
}

exit 1