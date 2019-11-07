Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 386F6E00E1E; Thu,  7 Nov 2019 10:09:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 063ACE003E1
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:53 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9rO9020119
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150193;
	bh=n/j4hyYUhinmuZBz3yT/anvn88i2snCIZhCD7jLV0b8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TPZsCqnody/6/lya0SXmb54l2olj3bJTV3tVC+GABRDkvpaYQAWZAUGqpnBYXFYBN
	wjqfG5sdFzV+wsM9ciI7mQkAGMLQnPZosxQgP6f61L8Mw+rKr6gVRSisRR7Rjk+Y4T
	mLRTpl4k/6+gEI45kv6Tq+aC9OKK+aQgQGtYylqc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9r7R121301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:53 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:37 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIT067418;
	Thu, 7 Nov 2019 12:09:52 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:18 -0500
Message-ID: <1573149037-762-24-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 23/42] pcie-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
index 51a24e7..70bd724 100644
--- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
+++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low lever driver for Peripheral Interconnect Express (PCIE)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=566a784d78790a716d641764d5d60b74"
@@ -8,25 +9,11 @@ LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=566a784d78790a716d6
 COMPATIBLE_MACHINE = "omap-a15|keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PCIE_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pcie-lld.git"
-PCIE_LLD_GIT_PROTOCOL = "git"
-PCIE_LLD_GIT_BRANCH = "master"
-PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
-
-# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.05"
-PCIE_LLD_SRCREV = "3cdbb5e4e4ccced496a4ca91b203965fafffc3e9"
-
-BRANCH = "${PCIE_LLD_GIT_BRANCH}"
-SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${PCIE_LLD_SRCREV}"
-PV = "02.03.00.05"
 PR = "r0"
 
 DEPENDS_append_k3 = " udma-lld-rtos \
 "
 
-S = "${WORKDIR}/${PCIE_LLD_GIT_DESTSUFFIX}"
 
 export PDK_PCIE_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
@@ -36,3 +23,4 @@ TI_PDK_XDCMAKE = "0"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "PCIe LLD"
+TI_PDK_COMP = "ti.drv.pcie"
-- 
2.7.4


