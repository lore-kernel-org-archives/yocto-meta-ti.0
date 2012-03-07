Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57B49E013A2
	for <meta-ti@yoctoproject.org>; Wed,  7 Mar 2012 13:52:52 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E96BD529B6; Wed,  7 Mar 2012 21:52:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120307215250.E96BD529B6@arago-project.org>
Date: Wed,  7 Mar 2012 21:52:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: enable CONFIG_WATCHDOG_NOWAYOUT for beaglebone
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
X-List-Received-Date: Wed, 07 Mar 2012 21:52:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: edc2621facf8147e02f7a3d929220106d5bd94db
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=edc2621facf8147e02f7a3d929220106d5bd94db

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Mar  7 09:36:22 2012 +0100

linux-ti33x-psp 3.2: enable CONFIG_WATCHDOG_NOWAYOUT for beaglebone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    4 ++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c5b80d1..782f52d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1769,8 +1769,8 @@ CONFIG_SENSORS_W83627HF=m
 CONFIG_SENSORS_W83627EHF=m
 # CONFIG_THERMAL is not set
 CONFIG_WATCHDOG=y
-# CONFIG_WATCHDOG_CORE is not set
-# CONFIG_WATCHDOG_NOWAYOUT is not set
+CONFIG_WATCHDOG_CORE=y
+CONFIG_WATCHDOG_NOWAYOUT=y
 
 #
 # Watchdog Device Drivers
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index b2f706a..79a315a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


