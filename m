Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E40FDE00D33; Fri, 29 Apr 2016 18:33:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6668FE00D2A
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 18:33:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9028A5299B; Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160430013317.9028A5299B@arago-project.org>
Date: Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : eudev: immediately tell kernel that userspace FW loading failed
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
X-List-Received-Date: Sat, 30 Apr 2016 01:33:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4b96409bccb7a674ab0cd0b31a540480bf13d2be
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4b96409bccb7a674ab0cd0b31a540480bf13d2be

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr 30 04:14:51 2016 +0000

eudev: immediately tell kernel that userspace FW loading failed

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/udev/eudev/firmware.rules |    3 +++
 recipes-core/udev/eudev_%.bbappend     |    7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes-core/udev/eudev/firmware.rules b/recipes-core/udev/eudev/firmware.rules
new file mode 100644
index 0000000..f7a08ce
--- /dev/null
+++ b/recipes-core/udev/eudev/firmware.rules
@@ -0,0 +1,3 @@
+# stub for immediately telling the kernel that userspace firmware loading
+# failed; necessary to avoid long timeouts with CONFIG_FW_LOADER_USER_HELPER=y
+SUBSYSTEM=="firmware", ACTION=="add", ATTR{loading}="-1"
diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
index a23d015..54cbf84 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -1,8 +1,11 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI_append = " file://omap-tty.rules"
+SRC_URI_append = " \
+    file://omap-tty.rules \
+    file://firmware.rules \
+"
 
-PR_append = ".1"
+PR_append = ".2"
 
 install_omap_rules() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/


