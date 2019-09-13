Return-Path: <d-huang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81D2BE00973; Fri, 13 Sep 2019 13:39:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 546C7E00961
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 13:39:40 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DKddP7045359
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 15:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568407179;
	bh=C5C7FDicbXv6bG2k6fSWNv2c0jc67sipTYsYe6DphIg=;
	h=From:To:CC:Subject:Date;
	b=JYFARztlrPdvp+RLYlO1iZn6oQtDGxHfWOdHIMcFql5TquvgMQ0vX3D0wEG8bf527
	I1fn/UazprN7AWPG/sqzRrThMxMY9DDqEISYvTSn11tb3QtcMGmBH50sFoXVisUMVc
	fkBmxUAI+QCrQOHn9xyx2TtNGppUcrbtBbaxzw5w=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DKddGW007643
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 15:39:39 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 15:39:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 15:39:38 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DKddIg127614;
	Fri, 13 Sep 2019 15:39:39 -0500
Received: from ulb0226152.dhcp.ti.com (ulb0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DKddZ12629; Fri, 13 Sep 2019 15:39:39 -0500 (CDT)
From: David Huang <d-huang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Sep 2019 15:39:30 -0500
Message-ID: <1568407170-2041-1-git-send-email-d-huang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] videnc-test-app: Add the videnc-test-app recipe
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
X-List-Received-Date: Fri, 13 Sep 2019 20:39:43 -0000
Content-Type: text/plain

The videnc-test-app provides the video encoder test app
(tienc_encode) for j7-evm.

Signed-off-by: David Huang <d-huang@ti.com>
---
 .../ti-img-encode-decode/videnc-test-app_1.0.0.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb

diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
new file mode 100644
index 000000000000..f0bd77a84ff2
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=3545dd5bdf513840937d38c10b866605"
+
+DEPENDS = "libdrm"
+
+inherit autotools pkgconfig
+
+PR = "r0"
+SRCREV = "a089cc21943a40acfe3cce25637f59d3997db6b4"
+
+EXTRA_OEMAKE = "CC="${CC}""
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
1.9.1


