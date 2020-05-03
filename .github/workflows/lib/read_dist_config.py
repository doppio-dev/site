# https://github.com/ahdbilal/firstiosapp/blob/master/.github/workflows/lib/read_dist_config.py
def main():
    import yaml,os,sys

    param=sys.argv[1]

    current_branch=(sys.stdin.readlines())[0]

    with open(".distribute/config.yml", 'r') as ymlfile:
        cfg = yaml.safe_load(ymlfile)

    for i in range(0,len(cfg)):
        if cfg[i]['branch'] in current_branch:
            build=cfg[i]['build']
            destinations=cfg[i]['destinations'].split(",")
            mandatory_update=cfg[i]['mandatory_update']
            notify_testers=cfg[i]['notify_testers']
            release_type=cfg[i]['type']
            prerelease=cfg[i]['prerelease']
            draft=cfg[i]['draft']
            break
        else:
            build=""
            destinations=""
            mandatory_update=""
            notify_testers=""
            release_type=""
            prerelease=""
            draft=""
    
    if param=="build":
        return print(build)
    elif param=="destinations":
        return print(str(destinations)[1:-1])
    elif param=="mandatory_update":
        return print(mandatory_update)
    elif param=="notify_testers":
        return print(notify_testers)
    elif param=="release_type":
        return print(release_type)
    elif param=="prerelease":
        return print(prerelease)
    elif param=="draft":
        return print(draft)
    else:
        return print(-1)
  
if __name__== "__main__":
  main()