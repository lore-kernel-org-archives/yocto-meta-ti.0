Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD43CE00AB9; Fri, 28 Sep 2018 09:26:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 724ADE00A0C
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQb8n078256
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151997;
	bh=T51/mZE7jp8y3xapnMsnAl1qWr6xM7HKA5wOjf2gnyg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LsDK08C23/JIuKQG2Fgj2E5MepsQ0r3jeQXCVD7v/hTaqGtoaWpxTTJ9CiTXNvjmS
	eApLz1Qf9VKxgxdEbM21TW+77GdXtUcewfJR4iePXjxMvNuzBiqYzqZz2GBcyRCwKa
	jGbHhXT+r4nqfniTvaM0yZoFQW9SXRWXINpxIAkY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQb6M000737
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:36 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMV011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:20 -0400
Message-ID: <1538151990-44823-20-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 19/29] pcie-lld-rtos: Update to version 02.03.00.01 and added k3 support
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:39 -0000
Content-Type: text/plain

The license checksum change is due to copyright year change

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
index 1b7218a..35a0cbc 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -3,9 +3,9 @@ SUMMARY = "TI RTOS low lever driver for Peripheral Interconnect Express (PCIE)"
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=c094db055596498ba803933936611eb2"
+LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=566a784d78790a716d641764d5d60b74"
 
-COMPATIBLE_MACHINE = "omap-a15|keystone|c66x"
+COMPATIBLE_MACHINE = "omap-a15|keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PCIE_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pcie-lld.git"
@@ -13,16 +13,19 @@ PCIE_LLD_GIT_PROTOCOL = "git"
 PCIE_LLD_GIT_BRANCH = "master"
 PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
 
-# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.13"
-PCIE_LLD_SRCREV = "bf8d3a22c03a5f273321c284fa1737072eca3f77"
+# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.01"
+PCIE_LLD_SRCREV = "61759fc238600e3d5506ce86db1f6b604334edf8"
 
 BRANCH = "${PCIE_LLD_GIT_BRANCH}"
 SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PCIE_LLD_SRCREV}"
-PV = "02.02.00.13"
+PV = "02.03.00.01"
 PR = "r0"
 
+DEPENDS_append_k3 = " udma-lld-rtos \
+"
+
 S = "${WORKDIR}/${PCIE_LLD_GIT_DESTSUFFIX}"
 
 export PDK_PCIE_ROOT_PATH ="${WORKDIR}/build"
-- 
1.9.1


