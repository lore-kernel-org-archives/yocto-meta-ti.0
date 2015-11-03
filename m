Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A918E00A92; Tue,  3 Nov 2015 12:57:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F12EEE00B2C
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 12:57:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4023B52AB4; Tue,  3 Nov 2015 20:57:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151103205744.4023B52AB4@arago-project.org>
Date: Tue,  3 Nov 2015 20:57:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.1.12 with latest merges
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
X-List-Received-Date: Tue, 03 Nov 2015 20:57:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bd37f936af17e258d030568fe725cc42c5d18361
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bd37f936af17e258d030568fe725cc42c5d18361

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Oct 31 04:35:54 2015 +0000

linux-ti-staging: update to 4.1.12 with latest merges

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 3bc43f4..c8c3f2c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "780c47e7ec4e024e9f7224b51234e545697896a5"
-PV = "4.1.10+git${SRCPV}"
+SRCREV = "8a6bfa3c90407b6588ec58724b0f6c3eefbca8fc"
+PV = "4.1.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"


