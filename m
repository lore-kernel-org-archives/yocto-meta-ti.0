Return-Path: <d-huang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39870E00994; Fri, 13 Sep 2019 13:58:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06145E00961
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 13:58:20 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DKwKB7024660
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 15:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568408300;
	bh=CW+wK2Hpa3cT57gCW6orIJyz08be9Guyj9D1i9UzDmU=;
	h=From:To:CC:Subject:Date;
	b=VvfgRqhtovrIc+6Ubf3it38v4rd7siF2FtOw0dwYISYrcYf6FembyuXR8jLskArjz
	ZGGkviY6yApkuFX1MgYjaDmFwqwZeB8Ngyh/5QinFxTuPjT2vRS5TdDUAz9R9VApOT
	ZQ2uD8lYy49nYMN5xXdYtUTirJf02n/36z1+PUMY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DKwK5v054242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 15:58:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 15:58:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 15:58:20 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DKwJ2o033004;
	Fri, 13 Sep 2019 15:58:19 -0500
Received: from ulb0226152.dhcp.ti.com (ulb0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DKwJZ26564; Fri, 13 Sep 2019 15:58:19 -0500 (CDT)
From: David Huang <d-huang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Sep 2019 15:58:12 -0500
Message-ID: <1568408292-13189-1-git-send-email-d-huang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH v2] videnc-test-app: Add the videnc-test-app recipe
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
X-List-Received-Date: Fri, 13 Sep 2019 20:58:22 -0000
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
index 000000000000..1725da7eb6d9
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
+SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
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


