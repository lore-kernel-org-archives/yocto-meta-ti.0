Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FA70E00C9B; Mon, 14 Oct 2019 08:28:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DB41E00805
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 08:28:25 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9EFSOIT025696
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 10:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571066904;
	bh=whH5z6CVaKB6MLrC8J1bSU39PgHdf9QAyIGTgAhJzRU=;
	h=From:To:Subject:Date;
	b=Hc7BQ6LzbyXQr9iGAfRDT35s0IwlitBt8MLXPCyqF2okpSFa8gIs+byef9pJM6iAW
	QjSBsMpUdWiGOTx3RgvxUIO318rhHdpFW4RH66TzqaLKosuABiXZOVDn+m0eGQ/hMs
	sULUBpfU7BF3uFFDIsbLVPLM4Fx/NZzZ4F9rENho=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9EFSOeZ056898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 10:28:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 14 Oct 2019 10:28:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 14 Oct 2019 10:28:24 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9EFSOnW010031
	for <meta-ti@yoctoproject.org>; Mon, 14 Oct 2019 10:28:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 14 Oct 2019 11:28:21 -0400
Message-ID: <1571066901-53634-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] mcasp-lld-rtos:SRCREV update to 01.01.00.15C
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
X-List-Received-Date: Mon, 14 Oct 2019 15:28:26 -0000
Content-Type: text/plain

---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
index cdd1027..808a02a 100644
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -13,14 +13,14 @@ MCASP_LLD_GIT_PROTOCOL = "git"
 MCASP_LLD_GIT_BRANCH = "master"
 MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
 
-# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15B"
-MCASP_LLD_SRCREV = "0322199e23fc90e4acdcd715076bae4e1afabbb7"
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15C"
+MCASP_LLD_SRCREV = "3b206c0081cc3e78122982948b40a16e2e24522c"
 
 BRANCH = "${MCASP_LLD_GIT_BRANCH}"
 SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MCASP_LLD_SRCREV}"
-PV = "01.01.00.15B"
+PV = "01.01.00.15C"
 PR = "r0"
 
 S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


