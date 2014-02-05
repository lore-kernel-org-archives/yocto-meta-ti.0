Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D2F0E00280
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 15:22:40 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0J00AYEQ8S4IE0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 05 Feb 2014 17:22:19 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EF221201BF; Wed,
	05 Feb 2014 18:22:03 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 05 Feb 2014 18:22:02 -0500
Message-id: <1391642522-22676-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] am33x-cm3: update with FW version 0x185 aka 05.00.00.02
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
X-List-Received-Date: Wed, 05 Feb 2014 23:22:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 1e99595..175cbfb 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "05.00.00.01"
+PV = "05.00.00.02"
 PR = "r1"
 
 # Make package machine specific due to different init scripts
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# SRCREV corresponds to tag v05.00.00.01
-SRCREV = "40cb75b9dd9ba15c6de1c15cbb7cce8f1a6588b8"
+# SRCREV corresponds to tag v05.00.00.02
+SRCREV = "11107db2f1e9e58ee75d4fe9cc38423c9a6e4365"
 BRANCH ?= "master"
 
 # This init script is only used for older kernels that do not support
-- 
1.8.3.2


