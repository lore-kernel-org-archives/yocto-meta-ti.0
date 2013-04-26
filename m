Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 363D8E0151A
	for <meta-ti@yoctoproject.org>; Fri, 26 Apr 2013 13:08:32 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLV00C78P9EQ5V3@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 26 Apr 2013 15:08:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7B17A20024; Fri,
	26 Apr 2013 16:08:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 26 Apr 2013 16:07:59 -0400
Message-id: <1367006879-12633-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
In-reply-to: <1367006879-12633-1-git-send-email-denis@denix.org>
References: <1367006879-12633-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot-ti-staging: update to ti2013.04.00 release
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
X-List-Received-Date: Fri, 26 Apr 2013 20:08:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
index 685dcd0..5fbd0c9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH
 
 BRANCH ?= "ti-u-boot-2013.01.01"
 
+# This commit corresponds to ti2013.04.00 release tag
 SRCREV = "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
 
 SPL_BINARY = "MLO"
-- 
1.8.2.1


