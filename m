Return-Path: <angelabaker@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49706E00D4A; Fri, 27 Sep 2019 14:00:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4385E00736
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 14:00:33 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RL0XV3125148
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 16:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569618033;
	bh=QumY85gtlEkc/Jp703ArHM2gAigV1ncUXzT/ZETFMOw=;
	h=From:To:CC:Subject:Date;
	b=BJuDJ5p/PocZ1vzrrwvSzqe8EvYETJImh2ERjFP5i7vw5dF/gdesi+29HTO0SJ1iu
	zt/jxnoFL30YLj4/RwOKPVbDs5CAb2vImg9vdkz471mx72JsClGqt802hm7ES8hyTe
	4sXt9uvHGurshAE3TEpImY+MasLE1tyTZPr+wQAs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RL0XAt105204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 16:00:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 16:00:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 16:00:32 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RL0WPE061391;
	Fri, 27 Sep 2019 16:00:32 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8RL0WZ02691; Fri, 27 Sep 2019 16:00:32 -0500 (CDT)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 27 Sep 2019 15:59:51 -0500
Message-ID: <1569617991-6826-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
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
X-List-Received-Date: Fri, 27 Sep 2019 21:00:34 -0000
Content-Type: text/plain

Pick up latest version of ti-img-encode-decode with fixes
for debug warnings.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
index 7285636..87ed70a 100644
--- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 COMPATIBLE_MACHINE = "j7-evm"
 
-SRCREV = "fc970634bdcf27577081dd7f49a67d9a53225a01"
+SRCREV = "fe07667a9405f17f04f5d26de5b0ba0626fec807"
 
 EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.9.1


