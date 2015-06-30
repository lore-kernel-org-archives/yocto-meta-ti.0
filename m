Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19944E00A1E; Tue, 30 Jun 2015 11:55:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9418DE009A7
	for <meta-ti@yoctoproject.org>; Tue, 30 Jun 2015 11:55:32 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQR00B45TVYL7B0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 30 Jun 2015 13:55:16 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=sozttTNsAAAA:8	a=4uDbyseLMRfaKlBkk24A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A8C23161ABD;	Tue,
	30 Jun 2015 14:55:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 30 Jun 2015 14:55:10 -0400
Message-id: <1435690510-27499-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] layer.conf: add more modules to safe ABI list
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
X-List-Received-Date: Tue, 30 Jun 2015 18:55:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf                               | 3 +++
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb     | 0
 recipes-bsp/cppi-lld/cppi-lld_git.bb          | 0
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb | 0
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb      | 0
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb     | 0
 recipes-bsp/mmap-lld/mmap-lld_git.bb          | 0
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb     | 0
 recipes-bsp/qmss-lld/qmss-lld_git.bb          | 0
 9 files changed, 3 insertions(+)
 mode change 100755 => 100644 recipes-bsp/cppi-lld/cppi-lld-test_git.bb
 mode change 100755 => 100644 recipes-bsp/cppi-lld/cppi-lld_git.bb
 mode change 100755 => 100644 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb
 mode change 100755 => 100644 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb
 mode change 100755 => 100644 recipes-bsp/mmap-lld/mmap-lld-test_git.bb
 mode change 100755 => 100644 recipes-bsp/mmap-lld/mmap-lld_git.bb
 mode change 100755 => 100644 recipes-bsp/qmss-lld/qmss-lld-test_git.bb
 mode change 100755 => 100644 recipes-bsp/qmss-lld/qmss-lld_git.bb

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
-- 
2.2.0


