Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E95E0E01691
	for <meta-ti@yoctoproject.org>; Fri,  1 Nov 2013 13:15:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1476552A94; Fri,  1 Nov 2013 20:15:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131101201530.1476552A94@arago-project.org>
Date: Fri,  1 Nov 2013 20:15:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am33x-cm3: update to specify correct tag and branch
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
X-List-Received-Date: Fri, 01 Nov 2013 20:15:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 058a386cd13397ae0d27583381636f2c641cdb9e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=058a386cd13397ae0d27583381636f2c641cdb9e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Oct 31 13:08:19 2013 -0400

am33x-cm3: update to specify correct tag and branch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 3be46b6..cfde2cf 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -4,11 +4,11 @@ LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
 PV = "05.00.00.00"
-PR = "r0"
+PR = "r1"
 
-# SRCREV corresponds to the tip of next3 branch
+# SRCREV corresponds to tag v05.00.00.00
 SRCREV = "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
-BRANCH ?= "next3"
+BRANCH ?= "master"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"
 INITSCRIPT_PARAMS = "defaults 96"


