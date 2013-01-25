Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 456C9E006CC
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 00:04:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8BF9E52AE0; Fri, 25 Jan 2013 08:04:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130125080446.8BF9E52AE0@arago-project.org>
Date: Fri, 25 Jan 2013 08:04:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel.inc: repeat do_configure after do_compileconfigs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 08:04:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 356ae86a9b4c3b88777262757407ab4f8108d70a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=356ae86a9b4c3b88777262757407ab4f8108d70a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 21 21:19:32 2013 -0500

multi-kernel.inc: repeat do_configure after do_compileconfigs

Populate default defconfig into .config and process with oldconfig target

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 04bc987..e5ebe56 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -95,6 +95,8 @@ do_compileconfigs () {
 
       # Restore the regular 'defconfig'
       cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
+      cd ${S}
+      do_configure
     fi
 }
 


