Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FF41E01728
	for <meta-ti@yoctoproject.org>; Tue, 29 Oct 2013 09:25:22 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVF00LYIUX2W8J2@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 29 Oct 2013 11:24:53 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E61632003E; Tue,
	29 Oct 2013 12:24:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 29 Oct 2013 12:24:35 -0400
Message-id: <1383063875-10561-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Dave Gerlach <d-gerlach@ti.com>, Russ Dill <Russ.Dill@ti.com>
Subject: [PATCH] am33x-cm3: update PM firmware for AM335x to 05.00.00.00
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
X-List-Received-Date: Tue, 29 Oct 2013 16:25:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Chase Maupin <chase.maupin@ti.com>
Cc: Carlos Hernandez <ceh@ti.com>
Cc: Russ Dill <Russ.Dill@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 9b36a9e..3be46b6 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "04.06.00.11"
-PR = "r4"
+PV = "05.00.00.00"
+PR = "r0"
 
-# SRCREV corresponds to tag "AM335xPSP_04.06.00.11"
-SRCREV = "750362868d914702086187096ec2c67b68eac101"
-BRANCH ?= "master"
+# SRCREV corresponds to the tip of next3 branch
+SRCREV = "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
+BRANCH ?= "next3"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"
 INITSCRIPT_PARAMS = "defaults 96"
-- 
1.8.3.2


