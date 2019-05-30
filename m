Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5848BE009FA; Thu, 30 May 2019 07:34:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C1AFE009FA
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 07:34:01 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4UEY1ni006238
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 09:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559226841;
	bh=vXDYt/dvtKGanX8ioeS6AcaFiQoocRPsIDL11fgcGYQ=;
	h=From:To:Subject:Date;
	b=L7rhHFrfdw2WPuQRPTAr6Lkv5b7wccf8/Abgku9cf6bVK92vzUql2Ol+UkpaebnEq
	ATN1d6VrFjDF2igrgqG+xcUQTtIlYFjUAicXoU9pRO47YDqfEZfRINdSgVhyZLl3N8
	p0fiW/NWRnjx94AHof5wNAZ9uGGJvAozOQ/cPGdc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4UEY186093344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 09:34:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 30 May 2019 09:34:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 30 May 2019 09:34:01 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4UEY1ij082817
	for <meta-ti@yoctoproject.org>; Thu, 30 May 2019 09:34:01 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 30 May 2019 10:33:47 -0400
Message-ID: <20190530143347.35175-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-sgx-ddk-um: bump SRCREV to pick up the fix for AM5 performance degradation
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
X-List-Received-Date: Thu, 30 May 2019 14:34:03 -0000
Content-Type: text/plain

-um: opengles2: disable GLES2MOVEBUFFERMEMTODEVICE

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 7b4f2ec2..02c9b750 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -10,7 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/thud/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "b0db45b7f74312afbff3e30c334e899e9c9d1338"
+SRCREV = "9e63d5ac0b40d6a70463173c597122b6645c8a95"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
@@ -22,7 +22,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r32"
+PR = "r33"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"
-- 
2.17.1


