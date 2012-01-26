Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A742AE0030F
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 11:33:33 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QJXVBq008409
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 13:33:32 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QJXUbk011191
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 01:03:30 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 01:03:30 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QJXRUq016260;
	Fri, 27 Jan 2012 01:03:29 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 13:33:26 -0600
Message-ID: <1327606406-17069-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] arm-benchmarks: port of am-benchmarks from arago
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
X-List-Received-Date: Thu, 26 Jan 2012 19:33:33 -0000
Content-Type: text/plain

* Ported the am-benchmarks recipe from arago and changed the name
  to arm-benchmarks.
* Updated the SRCREV to pickup licensing file

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Fixed DESCRIPTION field to use ARM instead of AM to match the
      recipe name.

---
 recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb |   26 +++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb

diff --git a/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb b/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
new file mode 100644
index 0000000..598bb73
--- /dev/null
+++ b/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "ARM Benchmarks"
+HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
+SECTION = "system"
+
+SRCREV = "76"
+PR = "r0+svnr${SRCPV}"
+
+SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_compile() {
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export ARCH=${TUNE_PKGARCH}
+	# build the release version
+	make release 
+}
+
+do_install() {
+	export ARCH=${TUNE_PKGARCH}
+	make DESTDIR=${D} install
+}
+
+RDEPENDS += matrix-gui-armbenchmarks-demos
-- 
1.7.0.4


