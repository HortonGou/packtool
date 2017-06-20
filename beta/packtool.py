import sys, os,json
reload(sys)
sys.setdefaultencoding('utf-8')
filepath = sys.argv[1]
mypath = os.getcwd()
with open(mypath+'\config.json', 'r') as f:
 config = json.load(f, encoding="utf-8")
print(config['keyAlias'])
os.system('rd /s/q '+mypath+'\cache')
os.system('md '+mypath+'\cache')
os.system('md '+mypath+'\cache\\apks')
os.system(mypath+'\lib\zipalign -v 4 ' + filepath + ' ' + mypath + '\cache\\app_nosign.apk')
status=os.system('java -jar '+mypath+'\lib\\apksigner.jar sign --ks '+config['storeFile']+' --ks-key-alias '+config['keyAlias']+' --ks-pass pass:'+ config['storePassword']+' --key-pass pass:'+ config['keyPassword']+' --out '+mypath+'\cache\\app_sign.apk '+mypath+'\cache\\app_nosign.apk')
print(status)