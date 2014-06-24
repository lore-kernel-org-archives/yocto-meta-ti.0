Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 721C8E00576; Tue, 24 Jun 2014 16:35:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_DYNIP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A55ACE00524
	for <meta-ti@yoctoproject.org>; Tue, 24 Jun 2014 16:35:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6FD2052A70; Tue, 24 Jun 2014 23:35:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140624233509.6FD2052A70@arago-project.org>
Date: Tue, 24 Jun 2014 23:35:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-mainline: update to use linux-3.14. y stable branch
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
X-List-Received-Date: Tue, 24 Jun 2014 23:35:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ababf72d38a416a04d28306398307b66e215178e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ababf72d38a416a04d28306398307b66e215178e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun 24 09:16:20 2014 +0000

linux-mainline: update to use linux-3.14.y stable branch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-mainline_3.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-mainline_3.14.bb b/recipes-kernel/linux/linux-mainline_3.14.bb
index 1e8473a..bdb595d 100644
--- a/recipes-kernel/linux/linux-mainline_3.14.bb
+++ b/recipes-kernel/linux/linux-mainline_3.14.bb
@@ -30,7 +30,7 @@ COMPATIBLE_MACHINE = "ti33x|omap3"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "master"
+BRANCH = "linux-3.14.y"
 
 # Corresponds to tag v3.14.8
 SRCREV = "0c5b3b80f7aeba9b8d25e12f7b321d148a1b1cb9"


