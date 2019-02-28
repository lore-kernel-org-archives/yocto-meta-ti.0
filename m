Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2084AE00D2F; Thu, 28 Feb 2019 06:41:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B90E7E00D2C
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 06:41:41 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1SEffLm115224
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 08:41:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551364901;
	bh=r3hH1zi46EhTxEoOU883ickbhTm677WOK5SD1IzFwek=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TnV/PEGqsRmy2sSk7q9OBFR5FIk+JVNteX8JdAdqRN4AjQYzbRnuzRrfpvtsKWZ+n
	Giu3xUQgDZaw15i5dX6hjRU47bLULDe0t1mHQU16ZT+K2sVdSUA0tUlt4Dyak2mOZP
	tnhHwUjaD5palSNBslN91ZxKkXU6CppEc9IjTn7c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1SEffRc090801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 08:41:41 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 28 Feb 2019 08:41:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 28 Feb 2019 08:41:40 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1SEfec1012290
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 08:41:40 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Feb 2019 09:41:31 -0500
Message-ID: <1551364892-9908-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551364892-9908-1-git-send-email-e-ruei1@ti.com>
References: <1551364892-9908-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master/thud][PATCH 1/2] ti-sgx-ddk-um: bump SRCREV to pickup the latest fixes and enhancements
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
X-List-Received-Date: Thu, 28 Feb 2019 14:41:43 -0000
Content-Type: text/plain

DDK1.17 clean up:
-um: Makefile cleanup

DDK 1.17 specific patches
- um: imgegl/egl_wl.c: pass the valid bpp to the get_size function and
  remove invalid check
- um: osfunc_um.c: fix compiler error at PVRSRVDetectPlatform() for AM3/4
- um: opengles2/tex.c: glCopyTexSubImage2D - Set destination stride
  correctly

DDK1.14 patches rebased
- um: nulldrm: map DBM buffers and populate meminfo
- um: nulldrm : Fix proper goto label in case of failure
- um: Fix the install path and scripts
- um: add support for UYVY format in wl_drm
- um: fix for compile error with PVR_DEBUG_MUTEXES=1
- um: pvr_drm.c: move the assert_reset from DrmRemove to DrmUnload
- um: Validate mutex before lock and unlock
- um: Fix for RefCounting with mutex held
- um: Set the default mutex type to pthread mutex


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index e1334e3..6144e27 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/rocko/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "ee266bb47c7b9b052d67e491fa8c28e301c36691"
+SRCREV = "271497b0f4747152bfa4775821e2ef33b4a894aa"
 
 TARGET_PRODUCT_k3 = "ti654x"
 
@@ -19,7 +19,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r30"
+PR = "r31"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"
-- 
1.9.1


