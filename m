Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6927EE01308
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:11:29 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QKBRjt008362
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:11:28 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBRG0014623
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 01:41:27 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 01:41:27 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBIlL019414;
	Fri, 27 Jan 2012 01:41:26 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 14:11:15 -0600
Message-ID: <1327608676-4790-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
References: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] refresh-screen: add package from arago
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
X-List-Received-Date: Thu, 26 Jan 2012 20:11:29 -0000
Content-Type: text/plain

* This package adds a utility to force a screen refresh after
  graphics applications are executed.  This is to prevent left
  over graphics artifacts from being displayed in matrix.
* Ported from arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/matrix/refresh-screen_2.0.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/matrix/refresh-screen_2.0.bb

diff --git a/recipes-ti/matrix/refresh-screen_2.0.bb b/recipes-ti/matrix/refresh-screen_2.0.bb
new file mode 100644
index 0000000..3a3ad5e
--- /dev/null
+++ b/recipes-ti/matrix/refresh-screen_2.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Simple Application to force a screen refresh"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
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
+SRCREV = "ba27273f0d61dd71589db380f785f091b7ad3efe"
+BRANCH ?= "master"
+
+SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+inherit qt4e
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
+}
-- 
1.7.0.4


