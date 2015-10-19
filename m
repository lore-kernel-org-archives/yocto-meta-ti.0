Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91A16E0050E; Mon, 19 Oct 2015 10:48:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF23CE0048C
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 10:48:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JHmKjc013975
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:48:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JHmKSH016058
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:48:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 12:48:20 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JHmK7w025556;	Mon, 19 Oct 2015 12:48:20 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 13:48:17 -0400
Message-ID: <1445276897-7421-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] common-csl-ip: Update new version for Keystone2 02.01.01.00
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
X-List-Received-Date: Mon, 19 Oct 2015 17:48:24 -0000
Content-Type: text/plain

- Removed extra line

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index cbf2c3c..6355165 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-
 BRANCH="master"
 BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
 
 SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
 
-# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
-SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
+# commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.01.00A
+SRCREV = "17bb083f0d5ed4ad6f38c991210a6a8e9aaf9c56"
 
 # commit ID corresponds to PROCESSOR-SDK-ALPHA-1
 SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"
-- 
1.7.9.5


