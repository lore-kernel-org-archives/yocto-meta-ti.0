Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97090E00992; Wed, 15 Feb 2017 13:09:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4374CE00970
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 13:09:39 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FL9dAS014442
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 15:09:39 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FL9dHX026544
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 15:09:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 15:09:38 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1FL9cbt002882;	Wed, 15 Feb 2017 15:09:38 -0600
Received: from uda0271916b.am.dhcp.ti.com (uda0271916b.am.dhcp.ti.com
	[128.247.77.97])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id v1FL9c315840;	Wed, 15 Feb 2017 15:09:38 -0600 (CST)
From: <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Wed, 15 Feb 2017 15:09:36 -0600
Message-ID: <1487192976-13080-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [for-morty PATCH] ti-gc320-driver: move to k4.9
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
X-List-Received-Date: Wed, 15 Feb 2017 21:09:41 -0000
Content-Type: text/plain

From: Gowtham Tammana <g-tammana@ti.com>

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 976904f..f292b10 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
-BRANCH = "ti-${PV}-k4.4"
+BRANCH = "ti-${PV}-k4.9"
 
-SRCREV = "7c0f4dc755dc2ecb95195ed42ef24fea16ef2667"
+SRCREV = "030df5ecf503ef3c83dca6e732e6d47d4a11cd4b"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"
-- 
2.7.4


