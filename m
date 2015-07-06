Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD6E6E00A1A; Mon,  6 Jul 2015 01:28:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D690CE009BE
	for <meta-ti@yoctoproject.org>; Mon,  6 Jul 2015 01:28:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t668SbCE018277
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 03:28:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t668Sb3v030070
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 03:28:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:28:26 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t668SZPM005664;
	Mon, 6 Jul 2015 03:28:37 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 6 Jul 2015 13:58:33 +0530
Message-ID: <1436171313-7471-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1436171313-7471-1-git-send-email-a0393906@ti.com>
References: <1436171313-7471-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [[GRAPHICS PATCHES] [for daisy, master] 2/2] omap5-sgx-ddk-um-linux: Bug fixes for memory leak
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
X-List-Received-Date: Mon, 06 Jul 2015 08:28:39 -0000
Content-Type: text/plain

 * Fix memory leak in Wayland WSEGL
 * Refactor the code for print messages

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index f806ae8..2f3f6aa 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -4,9 +4,9 @@ LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git"
-SRCREV = "53be02a24a30a4c74eb48f2c84fda789bd95ab33"
+SRCREV = "b6e57ccf36fc8c36d988246bc7510f0dec42d991"
 
-PR = "r4"
+PR = "r7"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
-- 
1.7.9.5


