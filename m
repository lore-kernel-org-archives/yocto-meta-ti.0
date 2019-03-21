Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28FEBE00D11; Thu, 21 Mar 2019 06:16:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E375E00D21
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:23 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGN1E068404
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174183;
	bh=5cjPqOrUCUgppYaaRj/aChL5VyHHYoK0u3Ffz3sGqA0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nzDx8mgmhDhD2UEADC4zEJFcWFuslHVtrQCM8jtcRmx8ohNNpQpZvTD5c0+lqjDiH
	Grx74O1jEbnDyeH4ItD73bLD5r/eRO/4342fN5bFi5w9ah20UbAcTxvN7DYy8ECx9S
	ZS7v51nqHEh2zJN+cQxmDinhSbQCqBtpStTveqW4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGNcG066904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:22 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHZv025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:16:01 -0400
Message-ID: <1553174173-28679-18-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 17/29] sciclient-rtos: SRCREV update to 01.00.00.02A
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
X-List-Received-Date: Thu, 21 Mar 2019 13:16:51 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 671cba3..1a19320 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -12,14 +12,14 @@ SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
 SCICLIENT_GIT_PROTOCOL = "git"
 SCICLIENT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.01"
-SCICLIENT_SRCREV = "ed65f5e855e1d6ad8db240eb0d454258e33ff90e"
+# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.02A"
+SCICLIENT_SRCREV = "e30f9c7dfadbb170921a6f9e34d8e5a5a21c1a18"
 
 BRANCH = "${SCICLIENT_GIT_BRANCH}"
 SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SCICLIENT_SRCREV}"
-PV = "01.00.00.01"
+PV = "01.00.00.02A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
-- 
1.9.1


