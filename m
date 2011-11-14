Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D81CE00303
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:18:21 -0800 (PST)
Received: by wyg10 with SMTP id 10so1143535wyg.35
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2011 06:18:21 -0800 (PST)
Received: by 10.227.59.204 with SMTP id m12mr16401120wbh.14.1321280300878;
	Mon, 14 Nov 2011 06:18:20 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id x9sm25039808wbn.2.2011.11.14.06.18.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 06:18:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Nov 2011 15:18:14 +0100
Message-Id: <1321280294-5258-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2] bonescript, beaglebone-getting-started: move bone101 startup to proper recipe
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
X-List-Received-Date: Mon, 14 Nov 2011 14:18:22 -0000

Also bump SRCREV

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Changes since v1:
    Remove bone101 from getting started do_install
	Add bone101.service to bonescript SRC_URI

 recipes-misc/payload/beaglebone-getting-started.bb |   13 +++----------
 recipes-misc/payload/bonescript.bb                 |   15 +++++++++++----
 .../bone101.service                                |    0
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename recipes-misc/payload/{beaglebone-getting-started => bonescript}/bone101.service (100%)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index ea5b038..81d8ced 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r11"
+PR = "r12"
 
 inherit allarch
 
@@ -8,20 +8,13 @@ LICENSE = "GPLv2+ && MIT && PD && others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
 SRCREV = "70ff0ec0e2d44de35824577ab7b6da443dcc0e9a"
-SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git \
-           file://bone101.service"
+SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
 
 do_install() {
 	install -d ${D}${datadir}/${PN}
 	cp -a ${S}/* ${D}${datadir}/${PN}
-
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/bone101.service ${D}${base_libdir}/systemd/system
 }
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "bone101.service"
-
-FILES_${PN} += "${datadir}/${PN} ${base_libdir}/systemd/system"
+FILES_${PN} += "${datadir}/${PN}"
diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index bbce022..d9e3b01 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,16 +1,17 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r6"
+PR = "r8"
 
-inherit allarch
+inherit allarch systemd
 
 # Ask Jason
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-SRCREV = "0b264f3144cb6385e33346dec02692d71844898d"
+SRCREV = "c6c5f3b013eea425d3f4ee64d58b993289d2530f"
 SRC_URI = "git://github.com/jadonk/bonescript.git \
            file://bonescript-git \
+           file://bone101.service \
           "
 S = "${WORKDIR}/git"
 
@@ -23,8 +24,14 @@ do_install() {
 	install -d ${D}${localstatedir}/lib/cloud9/
 	cp -a ${S}/* ${D}${localstatedir}/lib/cloud9/
 	cp -a ${S}/.git ${D}${localstatedir}/lib/cloud9/
+
+	install -d ${D}${base_libdir}/systemd/system
+	install -m 0644 ${WORKDIR}/bone101.service ${D}${base_libdir}/systemd/system
 }
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "bone101.service"
+
+FILES_${PN} += ""${localstatedir} ${base_libdir}/systemd/system"
 RDEPENDS_${PN} = "nodejs cloud9"
 RRECOMMENDS_${PN} = "git"
-FILES_${PN} += "${localstatedir}"
diff --git a/recipes-misc/payload/beaglebone-getting-started/bone101.service b/recipes-misc/payload/bonescript/bone101.service
similarity index 100%
rename from recipes-misc/payload/beaglebone-getting-started/bone101.service
rename to recipes-misc/payload/bonescript/bone101.service
-- 
1.7.2.5


