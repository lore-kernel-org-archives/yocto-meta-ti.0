Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CA5BE00303
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 18:52:59 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1DA70529D2; Thu,  6 Feb 2014 02:52:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140206025259.1DA70529D2@arago-project.org>
Date: Thu,  6 Feb 2014 02:52:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update with FW version 0x185 aka 05.00.00.02
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
X-List-Received-Date: Thu, 06 Feb 2014 02:53:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: fe1f2777d030c774d7ea0046108de847b20c9fdc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fe1f2777d030c774d7ea0046108de847b20c9fdc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Feb  5 18:21:00 2014 -0500

am33x-cm3: update with FW version 0x185 aka 05.00.00.02

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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


