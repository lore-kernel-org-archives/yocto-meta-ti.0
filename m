Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7EF7E00C55; Thu, 23 Jun 2016 05:48:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C6B2E00C4B
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 05:48:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5NClg4b006458
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 07:47:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCmUII028305
	for <meta-ti@yoctoproject.org>; Thu, 23 Jun 2016 07:48:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Jun 2016 07:48:30 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5NCmS1d024737;
	Thu, 23 Jun 2016 07:48:29 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Jun 2016 18:17:41 +0530
Message-ID: <1466686061-6326-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libdce: add API for query remote proc information
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
X-List-Received-Date: Thu, 23 Jun 2016 12:48:34 -0000
Content-Type: text/plain

This update contains two main changes:
 * Fix for multimedia playback failure with core dumped
 * New API addition for querying remote proc information

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.10.01.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
index aa61cb6..7adb961 100644
--- a/recipes-multimedia/libdce/libdce_3.00.10.01.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
@@ -7,7 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
+SRCREV = "f83e785d2b98404fed9e3a6264bf4945c65abd12"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
+
+PR = "r1"
-- 
1.9.1


