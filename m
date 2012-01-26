Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77B48E01371
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 10:46:38 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QIkaia018943
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 12:46:37 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QIkaLY006171
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 00:16:36 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 00:16:36 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QIkSQH011887;
	Fri, 27 Jan 2012 00:16:35 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Jan 2012 12:46:24 -0600
Message-ID: <1327603585-5599-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] refresh-screen: add package from arago
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
X-List-Received-Date: Thu, 26 Jan 2012 18:46:38 -0000
Content-Type: text/plain

* This package adds a utility to force a screen refresh after
  graphics applications are executed.  This is to prevent left
  over graphics artifacts from being displayed in matrix.
* Ported from arago overlay

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...ix-gui-browser_2.0.bb => refresh-screen_2.0.bb} |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
 copy recipes-ti/matrix/{matrix-gui-browser_2.0.bb => refresh-screen_2.0.bb} (52%)

diff --git a/recipes-ti/matrix/matrix-gui-browser_2.0.bb b/recipes-ti/matrix/refresh-screen_2.0.bb
similarity index 52%
copy from recipes-ti/matrix/matrix-gui-browser_2.0.bb
copy to recipes-ti/matrix/refresh-screen_2.0.bb
index 602487b..3a3ad5e 100644
--- a/recipes-ti/matrix/matrix-gui-browser_2.0.bb
+++ b/recipes-ti/matrix/refresh-screen_2.0.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "Simple Qt web display using webkit"
-HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
+DESCRIPTION = "Simple Application to force a screen refresh"
+HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
 SECTION = "multimedia"
@@ -10,16 +10,16 @@ RDEPENDS += "qt4-embedded-fonts"
 
 PR = "r0"
 
-SRCREV = "db2e6b10e5a14358b6120a4a28de2f9d591bc55c"
+SRCREV = "ba27273f0d61dd71589db380f785f091b7ad3efe"
 BRANCH ?= "master"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
 inherit qt4e
 
 do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/matrix_browser ${D}/${bindir}
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
 }
-- 
1.7.0.4


