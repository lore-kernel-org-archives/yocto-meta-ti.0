Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EA25E016D8
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2013 12:04:55 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVR000CA93UN7U0@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Nov 2013 14:04:43 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 532D72004C; Mon,
	04 Nov 2013 15:04:42 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 04 Nov 2013 15:04:41 -0500
Message-id: <1383595481-19111-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] layer.conf: prepend instead of append to sort before oe-core in BBPATH
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
X-List-Received-Date: Mon, 04 Nov 2013 20:04:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

This helps avoid bblayers.conf ordering issues, when temporarily overriding
files from oe-core in meta-ti.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index faa4ac0..e39bd85 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,5 +1,5 @@
 # We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
+BBPATH =. "${LAYERDIR}:"
 
 # We have a recipes directory, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
-- 
1.8.3.2


