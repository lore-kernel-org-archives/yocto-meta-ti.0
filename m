Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3A39E017D3
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 10:09:29 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVJ003A8MAX1RK0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 31 Oct 2013 12:09:13 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8127F2001F; Thu,
	31 Oct 2013 13:08:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 31 Oct 2013 13:08:57 -0400
Message-id: <1383239337-31186-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] am33x-cm3: update to specify correct tag and branch
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
X-List-Received-Date: Thu, 31 Oct 2013 17:09:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
1.8.3.2


