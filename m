Return-Path: <joelagnel@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8D52E0030F
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 09:03:05 -0800 (PST)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAFH34av019968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 11:03:05 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAFH34Wd007853
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 11:03:04 -0600 (CST)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAFH34bu000264
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2011 11:03:04 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 15 Nov 2011 11:03:04 -0600
Received: from localhost.localdomain (lta0207337a.am.dhcp.ti.com
	[10.247.19.199])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pAFH30JC026104;	Tue, 15 Nov 2011 11:03:04 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 15 Nov 2011 11:02:59 -0600
Message-ID: <1321376579-9475-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] gadget-init: Add image-version-info to info.txt
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
X-List-Received-Date: Tue, 15 Nov 2011 17:03:05 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/gadget-init.bb              |    2 +-
 .../gadget-init/update-image-info-on-mmcblk0p1.sh  |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 16137fa..d016c09 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Units to initialize usb gadgets"
 
-PR = "r12"
+PR = "r13"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
diff --git a/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh b/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
index 62aab39..a4daf73 100755
--- a/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
+++ b/recipes-ti/beagleboard/gadget-init/update-image-info-on-mmcblk0p1.sh
@@ -27,6 +27,10 @@ echo "/etc/angstrom-build-info:" >> /mnt/info.txt
 cat /etc/angstrom-build-info >> /mnt/info.txt
 
 echo >> /mnt/info.txt
+echo "/etc/image-version-info:" >> /mnt/info.txt
+cat /etc/image-version-info >> /mnt/info.txt
+
+echo >> /mnt/info.txt
 echo "opkg list-installed:" >> /mnt/info.txt
 opkg list-installed >> /mnt/info.txt
 
-- 
1.7.4.1


