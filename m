Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3403E0043B
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2014 15:12:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9A6FE52A68; Thu, 13 Feb 2014 23:12:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140213231244.9A6FE52A68@arago-project.org>
Date: Thu, 13 Feb 2014 23:12:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update with I2C clock rate calculation fixes
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
X-List-Received-Date: Thu, 13 Feb 2014 23:12:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fae7d7ec8998f9e0977af21acb4850414b3f6fef
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fae7d7ec8998f9e0977af21acb4850414b3f6fef

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 13 18:06:40 2014 -0500

am33x-cm3: update with I2C clock rate calculation fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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


