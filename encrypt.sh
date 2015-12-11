#!/bin/bash
# Encrypt file with vim

#for file in *.txt ; do encrypt test $file ; done
function batch_encrypt_by_vim() {
	for file in `ls $1`
	do
		if test "$file" = "vendor"
		then
			echo '跳过vendor'
		elif [ -d $1"/"$file ]
		then
			batch_encrypt_by_vim $1"/"$file
		elif test "${file##*.}" = 'php'
		then
			vim -e -c ":set key=yourpsw" -c ":wq" $1"/"$file
			echo $1"/"$file
		else
			echo '跳过非php文件'
		fi
	done
}

function batch_decrypt_by_vim() {
    for file in `ls $1`
    do  
        #test command 用 = 比较字符串，用-eq比较整数
        if test "$file" = "vendor"
        then
            echo '跳过vendor'
        elif [ -d $1"/"$file ]
        then
            batch_encrypt_by_vim $1"/"$file
        elif test "${file##*.}" = 'php'
        then
            # vim ex命令模式 安静执行 设置密码
            vim -e -s -c ":set key=yourpsw" -c ":wq" $1"/"$file
            echo $1"/"$file
        else
            echo '跳过非php文件'
        fi  
    done
}

dir=$(pwd)

if test "$1" = "enc"
then
    #命令后跟参数，参数不定，在里面使用$#表示变量数
    #$1 $2表示第几个参数
	batch_encrypt_by_vim $dir
elif test "$1" = "dec"
then
	batch_encrypt_by_vim $dir
else
	echo '谢谢'
fi
	

