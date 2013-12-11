Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60875E007DC
	for <meta-ti@yoctoproject.org>; Wed, 11 Dec 2013 10:35:36 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXN005SENMSB8OT@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 11 Dec 2013 12:35:17 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6CAF820264; Wed,
	11 Dec 2013 13:35:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Dec 2013 13:35:06 -0500
Message-id: <1386786908-6652-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1386786908-6652-1-git-send-email-denis@denix.org>
References: <1386786908-6652-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/4] am33x-cm3: update to v05.00.00.01 version
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
X-List-Received-Date: Wed, 11 Dec 2013 18:35:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/am33x-cm3_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index cfde2cf..260db16 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
-PV = "05.00.00.00"
-PR = "r1"
+PV = "05.00.00.01"
+PR = "r0"
 
-# SRCREV corresponds to tag v05.00.00.00
-SRCREV = "1628306779c05ee45f09d1d3131e722ddd3a5e2e"
+# SRCREV corresponds to tag v05.00.00.01
+SRCREV = "40cb75b9dd9ba15c6de1c15cbb7cce8f1a6588b8"
 BRANCH ?= "master"
 
 INITSCRIPT_NAME = "am335x-pm-firmware-load"
-- 
1.8.3.2


