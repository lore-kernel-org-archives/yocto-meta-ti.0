Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD756E013A3
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7EC7552A54; Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141230.7EC7552A54@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : gadget-init: remove ehrPWM polarity workaround
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c3c095c83f498a55f65ad72195e8f05d39c84a07
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c3c095c83f498a55f65ad72195e8f05d39c84a07

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Feb 10 09:45:51 2012 +0100

gadget-init: remove ehrPWM polarity workaround

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/beagleboard/gadget-init.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 150ff8e..016877d 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r16"
+PR = "r18"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -35,14 +35,11 @@ do_install() {
 
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/*.sh ${D}${bindir}
-
-	install -d ${D}${sysconfdir}/tmpfiles.d
-	echo "w    /sys/class/pwm/ehrpwm.1:0/polarity -    -    -    -   1" > ${D}${sysconfdir}/tmpfiles.d/lcd7.conf
 }
 
 PACKAGES =+ "${PN}-storage ${PN}-network ${PN}-udhcpd"
 
-FILES_${PN} = "${sysconfdir}/tmpfiles.d"
+ALLOW_EMPTY_${PN} = "1"
 
 FILES_${PN}-storage = "${base_libdir}/systemd/system/storage-gadget-init.service \
                        ${base_libdir}/systemd/system/basic.target.wants/storage-gadget-init.service \


