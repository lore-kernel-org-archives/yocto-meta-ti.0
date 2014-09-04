Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D76CDE007C1; Thu,  4 Sep 2014 09:20:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC18CE0076C
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 09:20:14 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 22BBF52A79; Thu,  4 Sep 2014 16:20:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140904162014.22BBF52A79@arago-project.org>
Date: Thu,  4 Sep 2014 16:20:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-mainline 3.14: update to the latest stable 3.14. 17 version
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
X-List-Received-Date: Thu, 04 Sep 2014 16:20:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: f4b716c066a954706fabb110e3dc8accac7d9e8a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f4b716c066a954706fabb110e3dc8accac7d9e8a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep  4 03:13:43 2014 +0000

linux-mainline 3.14: update to the latest stable 3.14.17 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-mainline_3.14.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
index bdb595d..1ad97e2 100644
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -32,9 +32,9 @@ S = "${WORKDIR}/git"
 
 BRANCH = "linux-3.14.y"
 
-# Corresponds to tag v3.14.8
-SRCREV = "0c5b3b80f7aeba9b8d25e12f7b321d148a1b1cb9"
-PV = "3.14.8"
+# Corresponds to tag v3.14.17
+SRCREV = "946de0e6b6ed49eacb03e3cddfcb1d774d6378ed"
+PV = "3.14.17"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


