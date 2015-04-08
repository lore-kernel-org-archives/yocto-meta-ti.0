Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95013E00954; Wed,  8 Apr 2015 15:44:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C94FE00837
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2015 15:43:59 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7523052A0D; Wed,  8 Apr 2015 22:43:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150408224359.7523052A0D@arago-project.org>
Date: Wed,  8 Apr 2015 22:43:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : uim: update and move from gitorious.org
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
X-List-Received-Date: Wed, 08 Apr 2015 22:44:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0c3976cc76e073af1c4c7126a77e176556757925
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0c3976cc76e073af1c4c7126a77e176556757925

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Apr  7 22:30:08 2015 +0000

uim: update and move from gitorious.org

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-connectivity/uim/uim_8.5.bb |   22 ++++++++++++++++++++++
 recipes-connectivity/uim/uim_git.bb |   19 -------------------
 2 files changed, 22 insertions(+), 19 deletions(-)

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


