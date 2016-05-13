Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 252ABE00CFA; Fri, 13 May 2016 07:20:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 989B1E00CEA
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 07:19:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4DEJwjj011680
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 09:19:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4DEJwum023327
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 09:19:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 13 May 2016 09:19:58 -0500
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4DEJu4A013651;	Fri, 13 May 2016 09:19:57 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 May 2016 19:49:53 +0530
Message-ID: <1463149194-8292-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1] ti-sgx-ddk-um: update srcrev and bump PR
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
X-List-Received-Date: Fri, 13 May 2016 14:20:03 -0000
Content-Type: text/plain

* rebuild SGX user mode driver with GCC 5.3

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 80612d6..0021884 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "e91d6d37c28ae63c350fff9c91705fd315491093"
+SRCREV = "8d4ba04a2da59989b21aacca9defdf387e321695"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r10"
+PR = "r11"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"
-- 
1.7.9.5


