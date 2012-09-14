Return-Path: <denys@ti.com>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84C12E01438
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 23:13:58 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAB007GRTARQWVF@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 14 Sep 2012 01:13:40 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9C37A2004C; Fri,
	14 Sep 2012 02:13:39 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 14 Sep 2012 02:13:37 -0400
Message-id: <1347603217-10160-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] layer.conf: lower layer priority from 10 to 6
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
X-List-Received-Date: Fri, 14 Sep 2012 06:13:58 -0000

Lowering layer priority from 10 to 6 aligns meta-ti with other BSP layers
and also allows distributions to override our recipes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4afb4f3..faa4ac0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-ti = "10"
+BBFILE_PRIORITY_meta-ti = "6"
-- 
1.7.8.6


