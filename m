Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 070B5E009AD; Tue,  7 Apr 2015 09:30:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73753E0099B
	for <meta-ti@yoctoproject.org>; Tue,  7 Apr 2015 09:30:27 -0700 (PDT)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMG00J8I36B66S0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 07 Apr 2015 11:30:11 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=NqFmqHZM c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=lRxpQPx1AAAA:8 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=-9mUelKeXuEA:10
	a=e9J7MTPGsLIA:10 a=sozttTNsAAAA:8	a=NIc2ozAC1_UNjdlfXq4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EB4F3200F4;	Tue,
	7 Apr 2015 12:30:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 07 Apr 2015 12:30:08 -0400
Message-id: <1428424208-22709-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] uim: update and move from gitorious.org
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
X-List-Received-Date: Tue, 07 Apr 2015 16:30:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-connectivity/uim/uim_8.5.bb | 22 ++++++++++++++++++++++
 recipes-connectivity/uim/uim_git.bb | 19 -------------------
 2 files changed, 22 insertions(+), 19 deletions(-)
 create mode 100644 recipes-connectivity/uim/uim_8.5.bb
 delete mode 100644 recipes-connectivity/uim/uim_git.bb

diff --git a/recipes-connectivity/uim/uim_8.5.bb b/recipes-connectivity/uim/uim_8.5.bb
new file mode 100644
index 0000000..ac9dc51
--- /dev/null
+++ b/recipes-connectivity/uim/uim_8.5.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Shared Transport Line Discipline User Mode initialisation Manager Daemon"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://uim.c;beginline=1;endline=18;md5=9f0bbfbc10c67689e81a523e2976c31e"
+
+INITSCRIPT_NAME = "uim-sysfs"
+INITSCRIPT_PARAMS = "defaults 03"
+
+inherit update-rc.d
+
+SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"
+SRC_URI = "git://git.ti.com/ti-bt/uim.git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 uim ${D}${bindir}
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 scripts/uim-sysfs ${D}${sysconfdir}/init.d
+}
diff --git a/recipes-connectivity/uim/uim_git.bb b/recipes-connectivity/uim/uim_git.bb
deleted file mode 100644
index c8265e9..0000000
--- a/recipes-connectivity/uim/uim_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "User Mode Initialization Manager for wl12xx devices"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://uim.c;startline=4;endline=12;md5=16a9d6e829218481f8a61797fe2be2e2"
-
-# Doesn't have a version, so we'll make one up
-PV = "0.0"
-
-SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
-SRC_URI = "git://gitorious.org/uim/uim.git"
-
-S= "${WORKDIR}/git"
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
-
-# connman has a plugin to handle all this
-RCONFLICTS_${PN} += "connman-plugin-tist"
-RRECOMMENDS_${PN} = "linux-firmware-wl12xx"
-- 
2.2.0


