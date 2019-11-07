Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3C81E00E05; Thu,  7 Nov 2019 10:09:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C99EE008F5
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:47 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9ljW070473
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150187;
	bh=lFZaURfAeUSq2IrI+VE11NriEC8JuHQLV3DflVfATgc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=X7QmWaO7KHcr4o3ahJ+Lcv8CYcHM5u02OuRv8jVEL6jWmC8Et5s+KG+Qd9r76o0uf
	TgY29QAlab1rzU6/DsAW+CrL3qIXo3SH5GoL5cwEFsF1jzNW/gh5l3fniDRZ7HBTmt
	8E1zIsRRBWY8BysmBWDIlWZhD4omAHdhFqiIfMFM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9l1n121144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:47 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:31 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jI9067418;
	Thu, 7 Nov 2019 12:09:46 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:49:58 -0500
Message-ID: <1573149037-762-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 03/42] bcp-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:51 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
index dc5cef5..e199e28 100644
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI Bit Coprocessor (BCP) low level driver"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://bcp.h;beginline=1;endline=40;md5=4f6e6128dd075a89548c0287a39b8896"
@@ -8,22 +9,8 @@ LIC_FILES_CHKSUM = "file://bcp.h;beginline=1;endline=40;md5=4f6e6128dd075a89548c
 COMPATIBLE_MACHINE = "k2hk|k2l|c667x-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BCP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/bcp-lld.git"
-BCP_LLD_GIT_PROTOCOL = "git"
-BCP_LLD_GIT_BRANCH = "master"
-BCP_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
-
-# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.07B"
-BCP_LLD_SRCREV = "2a13d5e3b26180dd4f1010327f1daed9b3330752"
-
-BRANCH = "${BCP_LLD_GIT_BRANCH}"
-SRC_URI = "${BCP_LLD_GIT_URI};destsuffix=${BCP_LLD_GIT_DESTSUFFIX};protocol=${BCP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${BCP_LLD_SRCREV}"
-PV = "02.01.00.07B"
 PR = "r0"
 
-S = "${WORKDIR}/${BCP_LLD_GIT_DESTSUFFIX}"
 
 DEPENDS_append = " qmss-lld-rtos \
                    cppi-lld-rtos \
@@ -31,3 +18,4 @@ DEPENDS_append = " qmss-lld-rtos \
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "BCP LLD"
+TI_PDK_COMP = "ti.drv.bcp"
-- 
2.7.4


