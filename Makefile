rawdata := $(wildcard data/*.txt)
parseddata := $(patsubst data/%.txt,data-parsed/%.conllu,$(rawdata))

all : $(parseddata)

data-udparsed/%.conllu : data/%.txt
	cat $< | python3 auto_parse/udpipe-parse.py -i $< -o $@