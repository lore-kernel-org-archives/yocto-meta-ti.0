Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16714E00C58; Wed, 14 Nov 2018 11:28:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54B65E00C59
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2018 11:28:15 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAEJSE78072139
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2018 13:28:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542223694;
	bh=0iWm5gXfEq8KxbkHTvHHA+ZHeyA/IlsRy+j00GRmFYs=;
	h=From:To:CC:Subject:Date;
	b=EL3stOvPrfZWFYCa+dQOypMnIEkoFNuIFGaKCU50NFPyrPu7iBA7ochjMEQUI6RBg
	92Zxy/kcxEr8QNQfp1ryFqQsqYCa2AXIgkZqSGb+siS0vpl67KqsC0GUm23ltspKWB
	Szk2sLq9Kmx+jUr6QGSB4BqD8sdrZAohQjITo0jQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAEJSEEQ070984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2018 13:28:14 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 14 Nov 2018 13:28:14 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 14 Nov 2018 13:28:14 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAEJSEIv026720;
	Wed, 14 Nov 2018 13:28:14 -0600
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.179.134])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	wAEJSEx15476; Wed, 14 Nov 2018 13:28:14 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Nov 2018 13:28:03 -0600
Message-ID: <20181114192804.7332-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] linux-ti-staging: update to ti2018.05-rc4 tag
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
X-List-Received-Date: Wed, 14 Nov 2018 19:28:17 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index 620b9c1e..a351ef8d 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "cbd4210a3af802dee7281705667b36bed455e1bb"
+SRCREV = "aab33cfa0d3aed1fb463f6a6e62236db6b04fc5f"
 PV = "4.14.79+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 0caf1ab9..c607296b 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -55,7 +55,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "ae8686a0d910688543aeddba3f90523bec4d50dc"
+SRCREV = "3438de34744b2eba32456bf8e3f44b19e3061331"
 PV = "4.14.79+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.19.1.856.g8858448bb4


