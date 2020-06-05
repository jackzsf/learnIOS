//
//  Git.h
//  learnIOS
//
//  Created by saifengzhang on 2020/6/5.
//  Copyright © 2020 saifengzhang. All rights reserved.
//

#ifndef Git_h
#define Git_h

/**
 
 基本概念
 git add命令实际上就是把要提交的所有修改放到暂存区（Stage），
 然后，执行git commit就可以一次性把暂存区的所有修改提交到分支。
 Git为我们自动创建的第一个分支master，以及指向master的一个指针叫HEAD。
 
 本地-->add-->commit
 工作区(本地)-->暂存区(stage)-->分支(master)
 
 常用操作
 git add xxx  //把文件添加到仓库
 git add .
 git rm xxx //删除文件
 git commit -m "desc"   //把文件提交到仓库
 git push -u origin master  //第一次推送master分支的所有内容
 git push origin master/dev //推送到远程分支
 git pull //从远程拉取
 
 分支操作
 git branch // 查看分支
 git branch <name> //创建分支
 git checkout <name>或者git switch <name> //切换分支
 git checkout -b <name>或者git switch -c <name> //创建+切换分支：
 git branch -d <name> //删除分支
 git branch -D <name> //强行删除一个没有被合并过的分支
 git merge <name> //合并某分支到当前分支
 git merge --no-ff -m "message" dev  //合并dev分支，请注意--no-ff参数，表示禁用Fast forward 合并分支时，加上--no-ff参数就可以用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合并。
 
 配置
 git config --global user.name zhangsan
 git config --global user.email zhangsan@163.com
 
 初始化git仓库
 git init           (.git是隐藏目录，通过 ls -ah查看)
 
 查询
 git status //查看当前仓库的状态 有么有文件被修改过
 git branch 查看分支
 git diff xxx   //对比修改内容
 git diff HEAD -- readme.txt    命令可以查看工作区和版本库里面最新版本的区别
 git log        //查看提交历史
 git log --pretty=oneline   //历史缩略信息commit id
 git log --graph    //可以看到分支合并图
 
 撤销修改
 git restore xxx
 
 版本回退 Git在内部有个指向当前版本的HEAD指针，当你回退版本的时候，Git仅仅是把HEAD从指向该版本，HEAD指向的版本就是当前版本
 git reset --hard HEAD^     //回退到上个版本
 git reset --hard commit-id //回退到某个commit-id版本
 git reflog     用来记录你的每一次命令commit-id
 
 关联一个远程库
 git remote add origin git@github.com:michaelliao/learngit.git  //远程库的名字就是origin，这是Git默认的叫法，也可以改成别的，但是origin这个名字一看就知道是远程库。
 
 从远程仓库克隆
 git clone xxx.git
 
 git stash
 修复bug时，我们会通过创建新的bug分支进行修复，然后合并，最后删除；
 当手头工作没有完成时，先把工作现场git stash一下，然后去修复bug，修复后，再git stash pop，回到工作现场；
 在master分支上修复的bug，想要合并到当前dev分支，可以用git cherry-pick <commit>命令，把bug提交的修改“复制”到当前分支，避免重复劳动。
 
 标签相关操作
 git tag <tagname> //用于新建一个标签，默认为HEAD，也可以指定一个commit id；
 git tag -a <tagname> -m "blablabla..." //可以指定标签信息；
 git tag //可以查看所有标签。
 git push origin <tagname>可以推送一个本地标签；
 git push origin --tags可以推送全部未推送过的本地标签；
 git tag -d <tagname>可以删除一个本地标签；
 git push origin :refs/tags/<tagname>可以删除一个远程标签。
 
 多人协作的工作模式通常是这样：
 首先，可以试图用git push origin <branch-name>推送自己的修改；
 如果推送失败，则因为远程分支比你的本地更新，需要先用git pull试图合并；
 如果合并有冲突，则解决冲突，并在本地提交；
 没有冲突或者解决掉冲突后，再用git push origin <branch-name>推送就能成功！
 如果git pull提示no tracking information，则说明本地分支和远程分支的链接关系没有创建，用命令git branch --set-upstream-to <branch-name> origin/<branch-name>。
 这就是多人协作的工作模式，一旦熟悉了，就非常简单。

 查看远程库信息，使用git remote -v；
 本地新建的分支如果不推送到远程，对其他人就是不可见的；
 从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
 在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
 建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
 从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。
 
 rebase操作可以把本地未push的分叉提交历史整理成直线；
 rebase的目的是使得我们在查看历史提交的变化时更容易，因为分叉的提交需要三方对比。
 
 */


#endif /* Git_h */
