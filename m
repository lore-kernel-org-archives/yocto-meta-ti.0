Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9D08E002A7
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 22:14:56 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A6C68529D2; Thu,  6 Feb 2014 06:14:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140206061456.A6C68529D2@arago-project.org>
Date: Thu,  6 Feb 2014 06:14:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update md5 for license reformat, fix CC unset issue
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
X-List-Received-Date: Thu, 06 Feb 2014 06:14:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: e786a9e186b62862d20ecb3f33c47172d184fd20
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e786a9e186b62862d20ecb3f33c47172d184fd20

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  6 01:11:50 2014 -0500

am33x-cm3: update md5 for license reformat, fix CC unset issue

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 175cbfb..4c395c7 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 
 LICENSE = "TI-BSD"
-LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
+LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "05.00.00.02"
-PR = "r1"
+PR = "r2"
 
 # Make package machine specific due to different init scripts
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -36,7 +36,7 @@ SCRIPT_ti43x = "init-am43x-cm3"
 S = "${WORKDIR}/git"
 
 do_compile() {
-	make CC="${TARGET_CC}" CROSS_COMPILE="${TARGET_PREFIX}"
+	make CROSS_COMPILE="${TARGET_PREFIX}"
 }
 
 do_install() {


