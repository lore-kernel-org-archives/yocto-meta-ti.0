Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32C4EE0149A
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 09:02:16 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMF008WNR6IL9M1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 May 2013 11:01:45 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4791520088; Tue,
	07 May 2013 12:01:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 07 May 2013 12:01:27 -0400
Message-id: <1367942487-22136-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] am-sysinfo: remove an old outdated svn version
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
X-List-Received-Date: Tue, 07 May 2013 16:02:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

The recipe has been moved to meta-arago-extras long time ago. Moreover, SCM has
changed from svn to git, so this recipe is quite outdated.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti/am-sysinfo_svn.bb | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 recipes-bsp/ti/am-sysinfo_svn.bb

diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
deleted file mode 100644
index b73a884..0000000
--- a/recipes-bsp/ti/am-sysinfo_svn.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "AM SysInfo"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_sysinfo/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
-
-SECTION = "system"
-
-SRCREV = "5"
-PV = "1.0"
-PR = "r1+svnr${SRCPV}"
-
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
-
-S = "${WORKDIR}/trunk"
-
-do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
-}
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
-}
-- 
1.8.2.1


