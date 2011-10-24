Return-Path: <joelagnel@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7837E0137B
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 21:15:26 -0700 (PDT)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9O4FPXZ027634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9O4FPpm024110
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9O4FP2O002929
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 23 Oct 2011 23:15:25 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9O4FLiw023860;	Sun, 23 Oct 2011 23:15:25 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 23 Oct 2011 22:59:23 -0500
Message-ID: <1319428763-9677-4-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
References: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: [PATCH meta-ti 3/3] beaglebone-tester: Update to latest and bump PR
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
X-List-Received-Date: Mon, 24 Oct 2011 04:15:27 -0000
Content-Type: text/plain

Added:
* PMIC tests
* EEPROM tests
* Memory tests
* GPIO 38 grounding check

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 1716122..9e65d65 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
           "
-SRCREV = "0806b54c1248b080953402728b0e420243fe844c"
+SRCREV = "fdeaf580e553a0968b777e75306aac3f6a73519e"
 
 S = "${WORKDIR}/git"
 
@@ -44,7 +44,7 @@ FILES_${PN} += "${base_libdir}/systemd \
                 /boot \
                "
 
-RDEPENDS_${PN} = "iputils"
+RDEPENDS_${PN} = "iputils memtester"
 RRECOMMENDS_${PN} = "kernel-module-g-zero \
                      kernel-module-g-file-storage \
                      kernel-module-smsc95xx"
-- 
1.7.0.4


