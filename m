Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39467E0074B; Wed, 22 Aug 2018 17:25:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB28BE005B1
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:25:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N0PBbe058371
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534983911;
	bh=FLg+IP3hwDcs9ZKvQso3dsf6HfgRzPHzct0vQQJdOvU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yPwWNsUKKRQwYL0wpOoUhoS5WRTP8hahkfpWyxo8GWBv8jBH7dLWs6K+P/5U9Q0vY
	FEdxWSJnX9liC6x0lpBQmYDNLLjd6o0Kik+8dpoC8ATkN2nYkgymoBfOrel6WzgwAX
	TH8Yel9sFdHIuSblMX5MEdGMFxZcAnhf9wIAi20Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N0PB2V006212
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 19:25:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 19:25:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 19:25:10 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N0P6bV005182;
	Wed, 22 Aug 2018 19:25:10 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <hzhang@ti.com>
Date: Wed, 22 Aug 2018 20:25:03 -0400
Message-ID: <1534983904-16386-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534983904-16386-1-git-send-email-sam.nelson@ti.com>
References: <1534983904-16386-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v3 3/4] osal: Update to new version 1.0.0.12
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
X-List-Received-Date: Thu, 23 Aug 2018 00:25:12 -0000
Content-Type: text/plain

Adds support for k3 platform

NOTE:
License checksum change is just due to addition of current year
2018 to copyright

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
Update to k3
---
---
 recipes-bsp/osal/osal-rtos_git.bb | 2 +-
 recipes-bsp/osal/osal.inc         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos_git.bb
index b150760..62d1f99 100644
--- a/recipes-bsp/osal/osal-rtos_git.bb
+++ b/recipes-bsp/osal/osal-rtos_git.bb
@@ -3,7 +3,7 @@ require recipes-bsp/osal/osal.inc
 
 PR = "${INC_PR}.0"
 
-COMPATIBLE_MACHINE_append = "|c66x"
+COMPATIBLE_MACHINE_append = "|c66x|k3"
 
 S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
 
diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index 16cf1fa..f360244 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -1,5 +1,5 @@
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=ae7b9f0410f26c80dcf790ef3f622fad"
+LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=6fbde6922f8bca1e6cd371d3c2faa4f9"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -9,12 +9,12 @@ OSAL_GIT_PROTOCOL = "git"
 OSAL_GIT_BRANCH = "master"
 OSAL_GIT_DESTSUFFIX = "git/ti/osal"
 
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.11"
-OSAL_SRCREV = "6113a74a2aded1aa1c339708d39b2e47e74263e9"
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.12"
+OSAL_SRCREV = "d93d8833e5e0bbd3e76f8618a4f717e3539a8d11"
 
 BRANCH = "${OSAL_GIT_BRANCH}"
 SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${OSAL_SRCREV}"
-PV = "01.00.00.11"
+PV = "01.00.00.12"
 INC_PR = "r0"
-- 
1.9.1


