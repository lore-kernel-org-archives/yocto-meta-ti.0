Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DFDBE00597
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 10:46:35 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QIkWIP012392
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:46:33 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QIkVuE006167
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 00:16:32 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 00:16:31 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QIkSQG011887;
	Fri, 27 Jan 2012 00:16:30 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 12:46:23 -0600
Message-ID: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Thu, 26 Jan 2012 18:46:35 -0000
Content-Type: text/plain

* This package adds a simple web browser GUI application with
  no decorations used to display matrix on the local display.
* Ported from arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/matrix/matrix-gui-browser_2.0.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/matrix/matrix-gui-browser_2.0.bb

diff --git a/recipes-ti/matrix/matrix-gui-browser_2.0.bb b/recipes-ti/matrix/matrix-gui-browser_2.0.bb
new file mode 100644
index 0000000..602487b
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-browser_2.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Simple Qt web display using webkit"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
+SECTION = "multimedia"
+PRIORITY = "optional"
+
+# Make sure that QT font libraries have been installed
+RDEPENDS += "qt4-embedded-fonts"
+
+PR = "r0"
+
+SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
+BRANCH ?= "master"
+
+SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit qt4e
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/matrix_browser ${D}/${bindir}
+}
-- 
1.7.0.4


