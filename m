Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5708E0137D
	for <meta-ti@yoctoproject.org>; Tue, 14 May 2013 10:05:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 56AC452A39; Tue, 14 May 2013 17:05:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130514170507.56AC452A39@arago-project.org>
Date: Tue, 14 May 2013 17:05:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am-sysinfo: remove an old outdated svn version
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
X-List-Received-Date: Tue, 14 May 2013 17:05:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 9772c16b8b4e08bb58c645fdf93b67857cc21b49
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9772c16b8b4e08bb58c645fdf93b67857cc21b49

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue May  7 11:59:07 2013 -0400

am-sysinfo: remove an old outdated svn version

The recipe has been moved to meta-arago-extras long time ago. Moreover, SCM has
changed from svn to git, so this recipe is quite outdated.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am-sysinfo_svn.bb |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)

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


