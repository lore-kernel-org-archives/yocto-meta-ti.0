Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86109E0142A
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2418D529A7; Fri, 11 May 2012 01:55:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015501.2418D529A7@arago-project.org>
Date: Fri, 11 May 2012 01:55:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: bump SRCREV for 2 CPPI1.4 fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2012 01:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 12bf8f2f92dfdb7050e4cb92a9968cc94c733f7e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=12bf8f2f92dfdb7050e4cb92a9968cc94c733f7e

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  8 15:10:19 2012 +0200

linux-ti33x-psp 3.2: bump SRCREV for 2 CPPI1.4 fixes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 458248e..593d6e7 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
-MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
+SRCREV = "baaa0c0425528486efcc70b7696dd6359f10b5bd"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


