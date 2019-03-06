Return-Path: <x0038811@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9483E00DD1; Wed,  6 Mar 2019 00:33:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FEC8E00DCE
	for <meta-ti@yoctoproject.org>; Wed,  6 Mar 2019 00:33:28 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x268XSI5048516
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 02:33:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551861208;
	bh=VX8kRcz93KHL3w7LR+iSgXnnoyJTOdhcVErR51jtePo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ax0Cu4glC8hHkbwrTxjpwo3xPFrCebN61NEvV8uWrz1ufHVJi8IrEelwFSRIRkEnF
	Pkxuybkwj283cjsevoMgekCJjZYOOFMr/Wg6ZMTtlg1NjB1+pq4tGbXwXz+lMJ9bRH
	OwUTS9VrtE4ArGs5PdvSYSQ78aweJGkYa3lmuwjc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x268XSq7014217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 6 Mar 2019 02:33:28 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 02:33:27 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 02:33:27 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x268XP6G029527;
	Wed, 6 Mar 2019 02:33:26 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 6 Mar 2019 14:03:10 +0530
Message-ID: <1551861190-29766-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551861190-29766-1-git-send-email-x0038811@ti.com>
References: <1551861190-29766-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master 1/1] ipumm: Update SRCREV with codec fixes
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
X-List-Received-Date: Wed, 06 Mar 2019 08:33:29 -0000
Content-Type: text/plain

This upgrade brings in the following updates:
* MPEG2 Decoder Update to 01.00.18.01 from 01.00.17.01
* VC1 Decoder Update to 01.00.02.08 from 01.00.02.07

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index f967728..5cb38b0 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "e95e96e6d1e112a18d6935a8ede91fefeae70a8f"
+SRCREV = "e4872a8966a267d537399b1babc54e5f66ae8b3b"
 
 S = "${WORKDIR}/git"
 
 PV = "3.00.15.00"
-PR = "r3"
+PR = "r4"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1


