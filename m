Return-Path: <angelabaker@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 503FCE00D74; Tue,  2 Jul 2019 10:43:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC63EE00C02
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 10:42:59 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62HgxEg004871
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562089379;
	bh=V8PrCToQEDrsWqpHFK8RN6tWWl+LwtwSPCni+Y9JZ5o=;
	h=From:To:CC:Subject:Date;
	b=r8IIKAWEz+TT3JNRJDHRcZYGxbArt2msCBPZJ5l5oj8VYycq+sltyN4L/lemew0PZ
	Xs/XVBA4FNS8JdbldXgGeti6TrjQ45pgXlsT8efcDqYjyItbKZcxHmi2b0DnWnOjup
	k7xzcjwr+QXRy1X5ibnJ6V5RXhAwZsjOncSubJIM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62HgxW1093893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 12:42:59 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 12:42:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 12:42:58 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62HgwkV085901;
	Tue, 2 Jul 2019 12:42:58 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x62Hgwm12005; Tue, 2 Jul 2019 12:42:58 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 2 Jul 2019 12:42:36 -0500
Message-ID: <1562089356-13712-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: sunitan@ti.com
Subject: [thud][PATCH] ti-img-encode-decode: Update SRCREV to pick up latest
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
X-List-Received-Date: Tue, 02 Jul 2019 17:43:00 -0000
Content-Type: text/plain

Pick up latest version of ti-img-encode-decode which
fixes compilation warnings/errors with RT-Linux.

Also add "COMPATIBLE_MACHINE" to the recipe.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
index 65c3b67..c684103 100644
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -4,10 +4,12 @@ LIC_FILES_CHKSUM = "file://common/dq.c;beginline=1;endline=16;md5=e015e28ff5e885
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-SRCREV = "306e85edce7969a4e017e12759be7ed763fda95c"
+COMPATIBLE_MACHINE = "j7-evm"
+
+SRCREV = "1f85a7fb3b78c82b44038aaf29bfdb229aeb6bc8"
 
 EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


