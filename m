Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 200F7E00D15; Thu, 21 Mar 2019 06:16:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B065BE00D00
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:20 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGKd5017873
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174180;
	bh=5XiFekPHMmuQW64VnT/gJgOutPEFPcmTX12rguOtsdM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=B/OF1ZCLUcyi8mK3Xut2lja7X8LBMHZOjszl1D4TWPPSYxo55yZdfnT4UuSpv3868
	A3YqgdVtP2gwkg9e1I2G6XekhizTGKwNUNRKMQAc4OetUVcVo4jdCZx00MnbUxWYZy
	0tv86T8cnFNVBR7BoCecJekO/L3t66lsOnY8SrLA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGKCc043682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:20 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:19 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZk025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:15:50 -0400
Message-ID: <1553174173-28679-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 06/29] gpmc-lld-rtos:SRCREV udpate to 01.00.00.03A
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:22 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
index 912a797..b9f0088 100644
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
+++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
@@ -12,14 +12,14 @@ GPMC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpmc-lld.git"
 GPMC_LLD_GIT_PROTOCOL = "git"
 GPMC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.02"
-GPMC_LLD_SRCREV = "320b18c703f70e01ea1b487c7bf9c4e08e7ae2df"
+# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.03A"
+GPMC_LLD_SRCREV = "9169c04d80fae0a50734527e54ec4f4f53c3a1ef"
 
 BRANCH = "${GPMC_LLD_GIT_BRANCH}"
 SRC_URI = "${GPMC_LLD_GIT_URI};protocol=${GPMC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPMC_LLD_SRCREV}"
-PV = "01.00.00.02"
+PV = "01.00.00.03A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
-- 
1.9.1


