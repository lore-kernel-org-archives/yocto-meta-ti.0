Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 846CBE00878; Tue,  7 Oct 2014 18:10:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6118DE0076C
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 18:10:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 98CA252A3F; Wed,  8 Oct 2014 01:10:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141008011015.98CA252A3F@arago-project.org>
Date: Wed,  8 Oct 2014 01:10:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-mainline 3.14: update to 3.14.20
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
X-List-Received-Date: Wed, 08 Oct 2014 01:10:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 02d7db614f16d418e6f6a0670c79962193eae911
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=02d7db614f16d418e6f6a0670c79962193eae911

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Oct  8 05:42:57 2014 +0000

linux-mainline 3.14: update to 3.14.20

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-mainline_3.14.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
index bff7627..32491b7 100644
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -32,9 +32,9 @@ S = "${WORKDIR}/git"
 
 BRANCH = "linux-3.14.y"
 
-# Corresponds to tag v3.14.19
-SRCREV = "af92ba8fd23cb5811d96b833bbb7133efefeb5b9"
-PV = "3.14.19"
+# Corresponds to tag v3.14.20
+SRCREV = "2023c00d650dfa409e58539596aca7d9deded824"
+PV = "3.14.20"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


