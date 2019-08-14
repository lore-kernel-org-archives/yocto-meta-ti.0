Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3165AE00C87; Wed, 14 Aug 2019 12:00:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7981DE00E0E
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2019 12:00:51 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7EJ0oEF025665
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2019 14:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565809250;
	bh=fEUJBqG+3ptFWICISiHzWNDiUuG5Lic2mc8DD/p4n8E=;
	h=From:To:Subject:Date;
	b=Sa59MgJ9eCfhAOQ+UB+WYT4jVnrq5iPTrGNgiYR8u3BWD1BR0jTXWCEaH4nU/yg9d
	sySBXyMJe/BD7QFCM2n5ct8avCgPcPRVz3UvrtrccPPcz5hHqen9y+UJhxfDowLi+8
	xxtxcZHTlanL/UGkH8Z9cnuFSfwjpxtc5QhwNSF4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7EJ0oTM041099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2019 14:00:50 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 14 Aug 2019 14:00:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 14 Aug 2019 14:00:50 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7EJ0oif112655
	for <meta-ti@yoctoproject.org>; Wed, 14 Aug 2019 14:00:50 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Aug 2019 15:00:47 -0400
Message-ID: <1565809247-38099-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] udma-lld-rtos: Adding support for J7-evm
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
X-List-Received-Date: Wed, 14 Aug 2019 19:00:58 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
index e18c4aa..5391a03 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -36,7 +36,8 @@ UDMA_LLD_ROOTPATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/udma"
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
 export PDK_UDMA_ROOT_PATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages"
 
-TI_PDK_LIMIT_BOARDS_k3 = "am65xx_evm"
+TI_PDK_LIMIT_BOARDS_am65xx = "am65xx_evm"
+
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "UDMA LLD"
-- 
1.9.1


