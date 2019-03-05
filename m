Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EA4DE00D2B; Mon,  4 Mar 2019 17:03:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5F62E0090C
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 17:03:36 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2513aHO061098
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:03:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551747816;
	bh=dU2cMrEBovoLlN51AGwxqB3aAoRsVHdhCLipEG+1FT0=;
	h=From:To:CC:Subject:Date;
	b=RpmncgycyJ5hXGogdL8lwjFnqu9qYPQBsQzO8UnUHrTQTxzgpRFjVw5vAO2PVGZ78
	7ZFi20oXMYadKb+azHbLxf7etBHKUwSRLIZ5ZNe0xQ6jiOBdpBpXlLwoMPqiubWeuu
	dN6OLjbvoWo6bDcb/NNxs9/1F/HkSNx43dkA3Nfc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2513a2o092037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:03:36 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 19:03:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 19:03:35 -0600
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2513VVX014568;
	Mon, 4 Mar 2019 19:03:33 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <s-anna@ti.com>
Date: Mon, 4 Mar 2019 20:03:29 -0500
Message-ID: <1551747809-62717-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] ti-ipc: Update firmware image names
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
X-List-Received-Date: Tue, 05 Mar 2019 01:03:37 -0000
Content-Type: text/plain

The firmware names expected by driver is changed
am65x-mcu-r5f0-fw -> am65x-mcu-r5f0_0-fw
am65x-mcu-r5f1-fw -> am65x-mcu-r5f0_1-fw

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index a276f22..7f1cae0 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -131,11 +131,11 @@ pkg_postrm_${PN}-fw_omapl138 () {
 }
 
 pkg_postinst_${PN}-fw_am65xx-evm () {
-  update-alternatives --install /lib/firmware/am65x-mcu-r5f0-fw am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
-  update-alternatives --install /lib/firmware/am65x-mcu-r5f1-fw am65x-mcu-r5f1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/am65x-mcu-r5f0_0-fw am65x-mcu-r5f0_0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
+  update-alternatives --install /lib/firmware/am65x-mcu-r5f0_1-fw am65x-mcu-r5f0_1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f ${ALTERNATIVE_PRIORITY}
 }
 
 pkg_postrm_${PN}-fw_am65xx-evm () {
-  update-alternatives --remove am65x-mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f
-  update-alternatives --remove am65x-mcu-r5f1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f
+  update-alternatives --remove am65x-mcu-r5f0_0-fw ipc/ti_platforms_cortexR_AM65X_R5F0/messageq_single.xer5f
+  update-alternatives --remove am65x-mcu-r5f0_1-fw ipc/ti_platforms_cortexR_AM65X_R5F1/messageq_single.xer5f
 }
-- 
1.9.1


