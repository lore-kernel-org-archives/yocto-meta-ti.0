Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09A9AE00B83
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 10:49:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B327552AAB; Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140424174904.B327552AAB@arago-project.org>
Date: Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3, ti-msp430: update license from TI-BSD to BSD-3-Clause
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
X-List-Received-Date: Thu, 24 Apr 2014 17:49:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 758b4becfcc3f2693229a774a1d056bcea33b891
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=758b4becfcc3f2693229a774a1d056bcea33b891

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 24 03:54:51 2014 +0000

am33x-cm3, ti-msp430: update license from TI-BSD to BSD-3-Clause

Per recommendation from OSRB and Legal.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb                   |    4 ++--
 recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb |    2 +-
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
 


