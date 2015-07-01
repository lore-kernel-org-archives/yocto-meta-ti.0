Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 718AAE00A7B; Tue, 30 Jun 2015 18:44:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36FB8E009C8
	for <meta-ti@yoctoproject.org>; Tue, 30 Jun 2015 18:44:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 522CE52A22; Wed,  1 Jul 2015 01:44:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150701014420.522CE52A22@arago-project.org>
Date: Wed,  1 Jul 2015 01:44:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add more modules to safe ABI list
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
X-List-Received-Date: Wed, 01 Jul 2015 01:44:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 12b8d3c9ec9344135ddb461809ce6695f321a78c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=12b8d3c9ec9344135ddb461809ce6695f321a78c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jul  1 00:55:10 2015 +0000

layer.conf: add more modules to safe ABI list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf                               |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index abce730..ac0c854 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -13,5 +13,8 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-ipc \
     cmem-mod \
+    hplib-mod \
     gdbserverproxy-module-drv \
+    debugss-module-drv \
+    uio-module-drv \
 "
diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/cppi-lld/cppi-lld_git.bb b/recipes-bsp/cppi-lld/cppi-lld_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb b/recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
old mode 100755
new mode 100644
diff --git a/recipes-bsp/qmss-lld/qmss-lld_git.bb b/recipes-bsp/qmss-lld/qmss-lld_git.bb
old mode 100755
new mode 100644


