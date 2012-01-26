Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C12C3E00597
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:11:28 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QKBP01031835
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:11:25 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBO9n014615
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 01:41:24 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 01:41:24 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBIlJ019414;
	Fri, 27 Jan 2012 01:41:23 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 14:11:13 -0600
Message-ID: <1327608676-4790-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
References: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] am-sysinfo: port to latest version from arago
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2012 20:11:28 -0000
Content-Type: text/plain

* Ported am-sysinfo from arago
* relocated from recipes-bsp/ti to recipes-ti/am-sysinfo
* Bumped the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/ti/am-sysinfo_svn.bb        |   23 -----------------------
 recipes-ti/am-sysinfo/am-sysinfo_svn.bb |   29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 23 deletions(-)
 delete mode 100644 recipes-bsp/ti/am-sysinfo_svn.bb
 create mode 100644 recipes-ti/am-sysinfo/am-sysinfo_svn.bb

diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
deleted file mode 100644
index d4f8740..0000000
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
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
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
diff --git a/recipes-ti/am-sysinfo/am-sysinfo_svn.bb b/recipes-ti/am-sysinfo/am-sysinfo_svn.bb
new file mode 100644
index 0000000..a5922dc
--- /dev/null
+++ b/recipes-ti/am-sysinfo/am-sysinfo_svn.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "AM SysInfo"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_sysinfo/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e714ab729cfe8177298af8a5a25d"
+
+SECTION = "system"
+
+PACKAGE_STRIP = no
+
+SRCREV = "16"
+PV = "1.0"
+PR = "r2+svnr${SRCPV}"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o oprofile_example/Debug/signal_parent oprofile_example/signal_parent.c
+    ${CC} ${CFLAGS} -DUSE_SIGNALS ${LDFLAGS} -o oprofile_example/Debug1/signal_parent.opt oprofile_example/signal_parent.c
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
+    install -m 0755 ${S}/oprofile_example/Debug/signal_parent ${D}/${bindir}
+    install -m 0755 ${S}/oprofile_example/Debug1/signal_parent.opt ${D}/${bindir}
+}
-- 
1.7.0.4


