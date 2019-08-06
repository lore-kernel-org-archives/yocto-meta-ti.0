Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94CC3E00D88; Tue,  6 Aug 2019 11:54:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E4CEE00C9B
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:36 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsaBo063179
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117676;
	bh=3rx9Dh8nxIgV4jrbppiXs1vGBV5H5lTJ9VCEibjHChA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QRYmEruHN01/GHlcAhewjrMa8qFX9DaUBWTD46rqIpiyb1s1o6n78Gg5urwGRZlTL
	i4AWlKnljo3idtrQzGdDsZ5PShRMKtfspTfuJhVujm/69e06MXY97pGa9+EpDgd51R
	mOHQ3HKBQu3ShkOk4Ph//FonO+X+4wgsf0LGT/pM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IsaU1058355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:36 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:36 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFb070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:00 -0400
Message-ID: <1565117660-52661-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 05/25] faultmanagement-rtos: SRCREV update to 01.00.01.04A
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:37 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
index aed5637..bf8aba6 100644
--- a/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
+++ b/recipes-bsp/faultmanagement/faultmanagement-rtos_git.bb
@@ -13,14 +13,14 @@ FAULT_MANAGEMENT_GIT_PROTOCOL = "git"
 FAULT_MANAGEMENT_GIT_BRANCH = "master"
 FAULT_MANAGEMENT_GIT_DESTSUFFIX = "git/ti/instrumentation/fault_mgmt"
 
-# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.04"
-FAULT_MANAGEMENT_SRCREV = "f96fd9d9de8a6c658f444a0d5cabbdbbf43b34f0"
+# Below commit ID corresponds to "DEV.FAULT_MGMT.01.00.01.04A"
+FAULT_MANAGEMENT_SRCREV = "67becdff0e3d181ab7b8fada226f5737517c1c52"
 
 BRANCH = "${FAULT_MANAGEMENT_GIT_BRANCH}"
 SRC_URI = "${FAULT_MANAGEMENT_GIT_URI};destsuffix=${FAULT_MANAGEMENT_GIT_DESTSUFFIX};protocol=${FAULT_MANAGEMENT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${FAULT_MANAGEMENT_SRCREV}"
-PV = "01.00.01.04"
+PV = "01.00.01.04A"
 PR = "r0"
 
 S = "${WORKDIR}/${FAULT_MANAGEMENT_GIT_DESTSUFFIX}"
-- 
1.9.1


