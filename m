Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6894DE01481
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:02:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0714052AB3; Tue,  2 Jul 2013 16:02:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702160252.0714052AB3@arago-project.org>
Date: Tue,  2 Jul 2013 16:02:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : am33x-cm3: Add support for PG 2.1 silicon.
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
X-List-Received-Date: Tue, 02 Jul 2013 16:02:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 988bc0198862e11f1fcf2d2b75b5fcd31539edd5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=988bc0198862e11f1fcf2d2b75b5fcd31539edd5

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Thu Jun 27 10:57:33 2013 -0500

am33x-cm3: Add support for PG 2.1 silicon.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 3549fcd..9b36a9e 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "04.06.00.10"
-PR = "r3"
+PV = "04.06.00.11"
+PR = "r4"
 
-# SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
-SRCREV = "27ca4643e422245a95723de1df0247a00eada45b"
+# SRCREV corresponds to tag "AM335xPSP_04.06.00.11"
+SRCREV = "750362868d914702086187096ec2c67b68eac101"
 BRANCH ?= "master"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"


