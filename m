Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D51BE00749
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:11 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4135982wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:10 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.99 as permitted sender)
	client-ip=10.180.107.99; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.99 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.99])
	by 10.180.107.99 with SMTP id hb3mr24687187wib.5.1329820270997
	(num_hops = 1); Tue, 21 Feb 2012 02:31:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.107.99 with SMTP id hb3mr20530632wib.5.1329820270945;
	Tue, 21 Feb 2012 02:31:10 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q2sm21611788wiy.7.2012.02.21.02.31.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:31:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:22 +0100
Message-Id: <1329820224-28112-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnxw8ggRL5Kci8DzfASvdX+xbyi0sxF54Oe0IYuvOxcnkDhaw7cWCkYRshxeWX8cJJ0/YCg
Subject: [Beagleboard.org][PATCH v2 08/10] gadget-init: remove ehrPWM polarity workaround
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
X-List-Received-Date: Tue, 21 Feb 2012 10:31:11 -0000

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


