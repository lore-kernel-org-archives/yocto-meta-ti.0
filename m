Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E63CE0043B
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2014 15:08:34 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0Y007UTIXGC780@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 13 Feb 2014 17:08:15 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8A13E201BF; Thu,
	13 Feb 2014 18:08:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 13 Feb 2014 18:08:03 -0500
Message-id: <1392332883-31699-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] am33x-cm3: update with I2C clock rate calculation fixes
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
X-List-Received-Date: Thu, 13 Feb 2014 23:08:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 4c395c7..01d1273 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
-PV = "05.00.00.02"
-PR = "r2"
+PV = "05.00.00.03"
+PR = "r0"
 
 # Make package machine specific due to different init scripts
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# SRCREV corresponds to tag v05.00.00.02
-SRCREV = "11107db2f1e9e58ee75d4fe9cc38423c9a6e4365"
+# SRCREV corresponds to tag v05.00.00.03
+SRCREV = "a0ddffb63147e2079a08944c0e399c75538201a9"
 BRANCH ?= "master"
 
 # This init script is only used for older kernels that do not support
-- 
1.8.3.2


