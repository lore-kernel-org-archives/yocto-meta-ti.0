Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 555C9E01214
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 13:14:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 238EE52A6C; Wed, 17 Oct 2012 20:14:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121017201401.238EE52A6C@arago-project.org>
Date: Wed, 17 Oct 2012 20:14:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-tester: ship testaudio, fix depends
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
X-List-Received-Date: Wed, 17 Oct 2012 20:14:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 22dd38e65c8377819256c8d36ab613ae8d6b203a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=22dd38e65c8377819256c8d36ab613ae8d6b203a

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sun Aug 12 10:11:12 2012 +0200

beaglebone-tester: ship testaudio, fix depends

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 recipes-ti/beagleboard/beaglebone-tester.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 82c5a83..138fbc6 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "c748d157b9afbb71e6eadf1dca7a787a456c0149"
+SRCREV = "168a9604e170931d9de228f0d774f4fbda58aa37"
 
 S = "${WORKDIR}/git"
 
@@ -37,6 +37,10 @@ do_install() {
 	for i in ${S}/bone-tester/lib/* ; do
 		install -m 0755 ${i} ${D}${localstatedir}/lib/bone-tester/lib/
 	done
+
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/testaudio ${D}${bindir}
+
 }
 
 
@@ -44,7 +48,7 @@ FILES_${PN} += "${base_libdir}/systemd \
                 /boot \
                "
 
-RDEPENDS_${PN} = "iputils memtester"
+RDEPENDS_${PN} = "alsa-utils-aplay sox iputils memtester"
 RRECOMMENDS_${PN} = "kernel-module-g-zero \
                      kernel-module-g-mass-storage \
                      kernel-module-g-file-storage \


