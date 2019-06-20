Return-Path: <angelabaker@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DF4BE009CF; Thu, 20 Jun 2019 15:36:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF479E0097C
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 15:36:18 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KMaIUd081442
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 17:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561070178;
	bh=sIoNriwTaWADoY+FJLkuN/8+OhX155q6eDd0spgOlGY=;
	h=From:To:CC:Subject:Date;
	b=OIcqu79Px3NDGsD+qHeWrsg4UgCl6iXXRInIh66Cw7XPep6TPVIjNSsBTQs06zvBz
	1L3xDBrs4/lbYQ0vedcrFMH2aQW2IW08llQx1X2L/jc4R/V/42sd79QaBp5HDkt4VA
	f0tULk8ryu8PBdXaC+d1AYAjIttl3EuLvV6ccwk4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KMaIC2120360
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 17:36:18 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 17:36:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 17:36:17 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KMaHdU050038;
	Thu, 20 Jun 2019 17:36:17 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x5KMaHm20238; Thu, 20 Jun 2019 17:36:17 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 20 Jun 2019 17:36:05 -0500
Message-ID: <1561070165-5304-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] ti-img-encode-decode: Add the ti-img-encode-decode recipe
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
X-List-Received-Date: Thu, 20 Jun 2019 22:36:27 -0000
Content-Type: text/plain

Add the recipe for the video decoder driver.

Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---

Note: This recipe depends on the linux kernel having the patches from the
multimedia feature tree merged.


 .../ti-img-encode-decode_1.0.0.bb                  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
new file mode 100644
index 0000000..65c3b67
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Kernel drivers for the IMG VXE384 MP2 and D5520 encoder/decoder found in TI SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRCREV = "306e85edce7969a4e017e12759be7ed763fda95c"
+
+EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+	install -m 644 ${S}/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+}
-- 
1.9.1


