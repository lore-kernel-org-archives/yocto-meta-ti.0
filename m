Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A792DE00EF4; Tue, 19 Apr 2016 15:06:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71765E00E79
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 15:06:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CB82B52A57; Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160419220558.CB82B52A57@arago-project.org>
Date: Tue, 19 Apr 2016 22:05:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : eudev: only install omap rules file for TI machines
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
X-List-Received-Date: Tue, 19 Apr 2016 22:06:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 161173fd66ecab996b9902f7b635918a6824703b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=161173fd66ecab996b9902f7b635918a6824703b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr 20 03:47:33 2016 +0000

eudev: only install omap rules file for TI machines

Play nice with other BSPs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/udev/eudev_%.bbappend |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
index fd0d99b..a23d015 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -2,8 +2,24 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " file://omap-tty.rules"
 
-PR_append = ".0"
+PR_append = ".1"
 
-do_install_append() {
+install_omap_rules() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
 }
+
+do_install_append_ti33x() {
+    install_omap_rules
+}
+
+do_install_append_ti43x() {
+    install_omap_rules
+}
+
+do_install_append_omap-a15() {
+    install_omap_rules
+}
+
+do_install_append_keystone() {
+    install_omap_rules
+}


