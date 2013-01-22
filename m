Return-Path: <denys@ti.com>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61B3EE011CC
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 18:19:53 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH000MIJ94M3CS2@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 21 Jan 2013 20:19:34 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BF9B52001F; Mon,
	21 Jan 2013 21:19:33 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 21 Jan 2013 21:19:32 -0500
Message-id: <1358821172-559-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH] multi-kernel.inc: repeat do_configure after do_compileconfigs
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
X-List-Received-Date: Tue, 22 Jan 2013 02:19:53 -0000

Populate default defconfig into .config and process with oldconfig target

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/multi-kernel.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 04bc987..e5ebe56 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -95,6 +95,8 @@ do_compileconfigs () {
 
       # Restore the regular 'defconfig'
       cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
+      cd ${S}
+      do_configure
     fi
 }
 
-- 
1.8.1.1


