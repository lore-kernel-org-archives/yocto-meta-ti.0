Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7A26E01420
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9EECD52AAD; Fri, 11 May 2012 01:55:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015501.9EECD52AAD@arago-project.org>
Date: Fri, 11 May 2012 01:55:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : uim: userspace app to manage wl12xx firmware loading
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
X-List-Received-Date: Fri, 11 May 2012 01:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 285aeaee513969ca7a79a344c75d0f590b722cb9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=285aeaee513969ca7a79a344c75d0f590b722cb9

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon May  7 17:57:40 2012 +0200

uim: userspace app to manage wl12xx firmware loading

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-connectivity/uim/uim_git.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/recipes-connectivity/uim/uim_git.bb b/recipes-connectivity/uim/uim_git.bb
new file mode 100644
index 0000000..c8265e9
--- /dev/null
+++ b/recipes-connectivity/uim/uim_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "User Mode Initialization Manager for wl12xx devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://uim.c;startline=4;endline=12;md5=16a9d6e829218481f8a61797fe2be2e2"
+
+# Doesn't have a version, so we'll make one up
+PV = "0.0"
+
+SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
+SRC_URI = "git://gitorious.org/uim/uim.git"
+
+S= "${WORKDIR}/git"
+
+do_install() {
+	oe_runmake install DESTDIR=${D}
+}
+
+# connman has a plugin to handle all this
+RCONFLICTS_${PN} += "connman-plugin-tist"
+RRECOMMENDS_${PN} = "linux-firmware-wl12xx"


