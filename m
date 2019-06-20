Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EA57E00DBA; Thu, 20 Jun 2019 05:36:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CF8AE00D39
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 05:36:08 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KCa7sZ065448
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 07:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561034167;
	bh=MmTdfcH4wu3pVIVi9dY4SangDPSzhl2rsJRHKmHFH3Q=;
	h=From:To:CC:Subject:Date;
	b=pA391YKYYc1I5JegHvLyYnnjfd6AkaDHkxe69iO6SfhQq8Yi+HXW/rFd0Hzve98mX
	W90gFIqlg8zlbVWU2eipuAyT3XE5CA2kQJZzlBlNbl4zeW6RHxrbkSu6aVsCC10MzB
	7rN5BozcyQ9ndv6eP3CisnvBdqrQBiKU/SxsZxNE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KCa7m0039269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 20 Jun 2019 07:36:07 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 07:36:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 07:36:07 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KCa60X082804; 
	Thu, 20 Jun 2019 07:36:06 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 20 Jun 2019 18:06:00 +0530
Message-ID: <1561034160-56544-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 1/1] img-pvr-drivers: specify SGX and Rogue as virtual providers for GPU driver
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
X-List-Received-Date: Thu, 20 Jun 2019 12:36:09 -0000
Content-Type: text/plain

- specify both SGX and Rogue drivers as virtual providers for GPU driver
- remove unused omapdrm-pvr provides

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb | 4 +++-
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb       | 8 ++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
index a79abfd..1c73362 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.10.5187610.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=15;endline=20;md5=0403c7dea01a2b8232
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -13,6 +13,8 @@ COMPATIBLE_MACHINE = "j7-evm"
 
 DEPENDS = "virtual/kernel"
 
+PROVIDES = "virtual/gpudriver"
+
 BRANCH = "linux/thud/k4.19/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=${BRANCH}"
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 2b1e1ee..8338ed7 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,18 +7,14 @@ inherit module
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 
-MACHINE_KERNEL_PR_append = "q"
+MACHINE_KERNEL_PR_append = "r"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/kernel"
 
-PROVIDES = "omapdrm-pvr"
-
-RPROVIDES_${PN} = "omapdrm-pvr"
-RREPLACES_${PN} = "omapdrm-pvr"
-RCONFLICTS_${PN} = "omapdrm-pvr"
+PROVIDES = "virtual/gpudriver"
 
 BRANCH = "ti-img-sgx/${PV}/k4.19"
 
-- 
1.9.1


