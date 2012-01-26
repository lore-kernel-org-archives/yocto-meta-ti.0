Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25A3AE00597
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:11:28 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QKBQ4T006007
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:11:27 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBPHl014619
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 01:41:25 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 01:41:25 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKBIlK019414;
	Fri, 27 Jan 2012 01:41:24 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 14:11:14 -0600
Message-ID: <1327608676-4790-4-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
References: <1327608676-4790-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] matrix-gui-browser: port from arago overlay
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

* This package adds a simple web browser GUI application with
  no decorations used to display matrix on the local display.
* Ported from arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-ti/matrix/matrix-gui-browser_2.0.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/matrix/matrix-gui-browser_2.0.bb

diff --git a/recipes-ti/matrix/matrix-gui-browser_2.0.bb b/recipes-ti/matrix/matrix-gui-browser_2.0.bb
new file mode 100644
index 0000000..2574ace
--- /dev/null
+++ b/recipes-ti/matrix/matrix-gui-browser_2.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Simple Qt web display using webkit"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
+SECTION = "multimedia"
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


