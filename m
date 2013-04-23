Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 486C8E013C9
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 18:37:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AA93152A71; Tue, 23 Apr 2013 01:37:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130423013716.AA93152A71@arago-project.org>
Date: Tue, 23 Apr 2013 01:37:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : am33x-cm3: Update to latest cm3 release
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
X-List-Received-Date: Tue, 23 Apr 2013 01:37:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 35be5df266f6e443e7d5faedc7daec85a7d23720
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=35be5df266f6e443e7d5faedc7daec85a7d23720

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Apr 22 17:59:44 2013 -0500

am33x-cm3: Update to latest cm3 release

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 169789e..4829b78 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,9 +3,11 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "04.06.00.07"
-PR = "r1"
-SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
+PV = "04.06.00.10"
+PR = "r2"
+
+# SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
+SRCREV = "27ca4643e422245a95723de1df0247a00eada45b"
 BRANCH ?= "master"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"


