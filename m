Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3937E013AB
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:52 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id m13so468501wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:52 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.99.65 as permitted sender)
	client-ip=10.180.99.65; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.99.65 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.99.65])
	by 10.180.99.65 with SMTP id eo1mr18899924wib.13.1330350052542
	(num_hops = 1); Mon, 27 Feb 2012 05:40:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.99.65 with SMTP id eo1mr14862884wib.13.1330350052496;
	Mon, 27 Feb 2012 05:40:52 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id er8sm55347092wib.1.2012.02.27.05.40.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:26 +0100
Message-Id: <1330350029-29100-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm1PVKWEL1zH672zz+2jOvvmm7dAoczwFbTq4UU9xucsrLBWIuUu/zFnxcuoNTxjOfz2WqN
Subject: [BeagleBone][PATCH v3 08/11] gadget-init: remove ehrPWM polarity workaround
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
X-List-Received-Date: Mon, 27 Feb 2012 13:40:53 -0000

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


