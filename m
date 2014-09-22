Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85175E00566; Mon, 22 Sep 2014 11:39:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C85FE0034C
	for <meta-ti@yoctoproject.org>; Mon, 22 Sep 2014 11:39:28 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCB00LMGFTJIW70@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 22 Sep 2014 13:39:20 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 97B48200AC; Mon,
	22 Sep 2014 14:39:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 22 Sep 2014 14:39:19 -0400
Message-id: <1411411159-25810-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] linux-mainline: update to version 3.14.19
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
X-List-Received-Date: Mon, 22 Sep 2014 18:39:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-mainline_3.14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
index 1ad97e2..bff7627 100644
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -32,9 +32,9 @@ S = "${WORKDIR}/git"
 
 BRANCH = "linux-3.14.y"
 
-# Corresponds to tag v3.14.17
-SRCREV = "946de0e6b6ed49eacb03e3cddfcb1d774d6378ed"
-PV = "3.14.17"
+# Corresponds to tag v3.14.19
+SRCREV = "af92ba8fd23cb5811d96b833bbb7133efefeb5b9"
+PV = "3.14.19"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
2.0.4


