Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B323E00B67
	for <meta-ti@yoctoproject.org>; Wed, 23 Apr 2014 14:55:40 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00JN77JTE360@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 23 Apr 2014 16:55:21 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B8FA4200AC; Wed,
	23 Apr 2014 17:55:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 23 Apr 2014 17:54:51 -0400
Message-id: <1398290092-20034-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398290092-20034-1-git-send-email-denis@denix.org>
References: <1398290092-20034-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] am33x-cm3, ti-msp430: update license from TI-BSD to BSD-3-Clause
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
X-List-Received-Date: Wed, 23 Apr 2014 21:55:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Per recommendation from OSRB and Legal.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb                   | 4 ++--
 recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 01d1273..42f20da 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 
-LICENSE = "TI-BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "05.00.00.03"
-PR = "r0"
+PR = "r1"
 
 # Make package machine specific due to different init scripts
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
index 0a48b17..dd493f8 100644
--- a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
+++ b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "eZ430 Chronos Tools - MSP430 Development Kit/Watch"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/EZ430-Chronos"
-LICENSE = "TI-BSD"
+LICENSE = "BSD-3-Clause"
 # We can't use the actualy source file, since it has space in its name :(
 LIC_FILES_CHKSUM = "file://eZ430-Chronos_CC_1_1.tcl;md5=59ba6ee0a26650ec660a4e65a9462806"
 
-- 
1.9.2


