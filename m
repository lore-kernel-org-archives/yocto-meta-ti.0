Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE907E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:12:58 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4248170wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:12:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.7.231 with SMTP id m7mr25031395wia.3.1329156778383;
	Mon, 13 Feb 2012 10:12:58 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id eq5sm48979407wib.2.2012.02.13.10.12.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:12:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 19:12:42 +0100
Message-Id: <1329156766-29776-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
References: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmHeFbV827/im1oyfDZhgOZ6/1wa26E3c1C3A9S/N1ucRpsn4ywpWOh12M/AmVPx4jR68aa
Subject: [PATCH 4/8] gadget-init: remove ehrPWM polarity workaround
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
X-List-Received-Date: Mon, 13 Feb 2012 18:12:59 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
-- 
1.7.2.5


