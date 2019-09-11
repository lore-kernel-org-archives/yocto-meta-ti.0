Return-Path: <angelabaker@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CBABE00E0D; Wed, 11 Sep 2019 13:33:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BE58E00D8E
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 13:33:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BKXLM1124879
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 15:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568234001;
	bh=mVyqzfUWOp+/tLaktd6r4RUNybxH5eaCE6ivxVv/DMM=;
	h=From:To:CC:Subject:Date;
	b=qnd5AQ/HnNclTz7MQVVbRVFUjmlPjq0S1HfiBjQ9qf7u4hXPfKjsWO/hm/SKQsX1F
	NBx20AAoQPVoUHWOLGATOppO68XO99zma7B6BYaaIxBKDOr4caX/EDSXQpISTfVW9n
	Sr95fi6hP/Iqx3tjKyXtOdE6q7q2i/Hj1gdiLiow=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BKXLn1101703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 11 Sep 2019 15:33:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 11 Sep 2019 15:33:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 11 Sep 2019 15:33:20 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BKXKfd015504;
	Wed, 11 Sep 2019 15:33:20 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8BKXKZ05902; Wed, 11 Sep 2019 15:33:20 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 11 Sep 2019 15:08:51 -0500
Message-ID: <1568232531-10323-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: sunitan@ti.com
Subject: [thud][PATCH] ti-img-encode-decode: Update SRCREV and build encoder
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
X-List-Received-Date: Wed, 11 Sep 2019 20:33:23 -0000
Content-Type: text/plain

Pick up latest version of ti-img-encode-decode which
includes updates for decoder and addition of encoder.

Also update the recipe to build the encoder module.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb     | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
index c684103..0b84301 100644
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Kernel drivers for the IMG VXE384 MP2 and D5520 encoder/decoder found in TI SoCs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"
+LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 COMPATIBLE_MACHINE = "j7-evm"
 
-SRCREV = "1f85a7fb3b78c82b44038aaf29bfdb229aeb6bc8"
+SRCREV = "c7657d2ead0ca211ab307dd2f403621de5b3e80d"
 
 EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -19,7 +19,13 @@ SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protoco
 
 S = "${WORKDIR}/git"
 
+do_compile() {
+	oe_runmake all -C ${S}/linux/decoder
+	oe_runmake all -C ${S}/linux/encoder
+}
+
 do_install() {
 	install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
-	install -m 644 ${S}/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+	install -m 644 ${S}/linux/decoder/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
+	install -m 644 ${S}/linux/encoder/vxe-enc.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
 }
-- 
1.9.1


