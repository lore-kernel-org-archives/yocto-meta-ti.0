Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A51F1E005B1
	for <meta-ti@yoctoproject.org>; Mon,  9 Dec 2013 10:40:58 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXJ00HCOYJW17A0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 09 Dec 2013 12:40:45 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9ADF620077; Mon,
	09 Dec 2013 13:40:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 09 Dec 2013 13:40:38 -0500
Message-id: <1386614438-10258-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: update to 3.12.4 with more fixes
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
X-List-Received-Date: Mon, 09 Dec 2013 18:41:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 8965941..7ab735d 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -31,8 +31,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "c077af8403a538e129164081cbe7527f22bb56b6"
-PV = "3.12.2"
+SRCREV = "1bf2cc89948f897a91ed48da999657555e7a386f"
+PV = "3.12.4"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
-- 
1.8.3.2


