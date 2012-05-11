Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66277E01426
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id ECFC152AAC; Fri, 11 May 2012 01:55:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015500.ECFC152AAC@arago-project.org>
Date: Fri, 11 May 2012 01:55:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: switch to userspace governor for beaglebone, ondemand seems to cause problems on a small percentage of boards
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
Commit: d5e0cd58d4c6344abf076ae660a645607d938805
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d5e0cd58d4c6344abf076ae660a645607d938805

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon May  7 14:09:16 2012 +0200

linux-ti335x-psp 3.2: switch to userspace governor for beaglebone, ondemand seems to cause problems on a small percentage of boards

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    4 ++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c5e447f..315b658 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -481,8 +481,8 @@ CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_STAT_DETAILS=y
 # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index de3129d..458248e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


