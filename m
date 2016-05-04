Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EA74EE007EF; Wed,  4 May 2016 09:42:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7223E00870
	for <meta-ti@yoctoproject.org>; Wed,  4 May 2016 09:41:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B3D8A52A7F; Wed,  4 May 2016 16:41:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160504164157.B3D8A52A7F@arago-project.org>
Date: Wed,  4 May 2016 16:41:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : eudev: install the new firmware rule
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
X-List-Received-Date: Wed, 04 May 2016 16:42:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e9729ddb004b194fd9c4cfd4cc29302adb3da7ab
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e9729ddb004b194fd9c4cfd4cc29302adb3da7ab

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed May  4 10:38:02 2016 +0000

eudev: install the new firmware rule

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-core/udev/eudev_%.bbappend |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
index 54cbf84..620500b 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -5,24 +5,25 @@ SRC_URI_append = " \
     file://firmware.rules \
 "
 
-PR_append = ".2"
+PR_append = ".3"
 
-install_omap_rules() {
+install_ti_rules() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/firmware.rules ${D}${sysconfdir}/udev/rules.d/
 }
 
 do_install_append_ti33x() {
-    install_omap_rules
+    install_ti_rules
 }
 
 do_install_append_ti43x() {
-    install_omap_rules
+    install_ti_rules
 }
 
 do_install_append_omap-a15() {
-    install_omap_rules
+    install_ti_rules
 }
 
 do_install_append_keystone() {
-    install_omap_rules
+    install_ti_rules
 }


