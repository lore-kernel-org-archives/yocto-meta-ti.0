Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7362AE00310
	for <meta-ti@yoctoproject.org>; Sun,  6 Nov 2011 01:07:08 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA68776j018008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 6 Nov 2011 02:07:07 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA6876QD013905
	for <meta-ti@yoctoproject.org>; Sun, 6 Nov 2011 02:07:06 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA687620013523
	for <meta-ti@yoctoproject.org>; Sun, 6 Nov 2011 02:07:06 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 6 Nov 2011 02:07:06 -0600
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pA6875gf010477;	Sun, 6 Nov 2011 02:07:06 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Nov 2011 01:50:45 -0600
Message-ID: <1320565846-518-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] beaglebone-tester: Update to latest with fixes
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
X-List-Received-Date: Sun, 06 Nov 2011 08:07:08 -0000
Content-Type: text/plain

  Hopefully the last round of minor fixes:
    * only leds 3 and 4 are touched, 1 and 2 are for system use
    * halt after test fail so that the user doesn't accidentaly corrupt the card
    * remove all usb gadget modules before test start

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 2db6e8c..1020172 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
           "
-SRCREV = "7c994dfe5d97d9385605bfafab9c0b967814bac5"
+SRCREV = "be5173d05cce4f914911366e5ddae1ff5c0af9cf"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


