Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A444E00C43; Tue,  2 Jul 2019 06:57:39 -0700 (PDT)
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
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 974EFE0097C
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 06:57:37 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62DvbX6027446
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 08:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562075857;
	bh=Duc5SDbe3S/1kZDX2e7NGRAWCBV5PLRMAjYFxgWCrWU=;
	h=From:To:Subject:Date;
	b=sI7sjfyrLCUMIjOgrF1raVkX1DIbA6B4R1iQomDnhu2yg76lrqstbcIJWztAEe3Vv
	PpAQlPz1F87E8pQGLT8xn/q94uphcc6MpoFehUWZ/jrodnY/B55ixv1BY6Tue00EJW
	CT9AgjYHBzqUideHbVojdGnULOaNI9gPxeXiJNZE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62DvbF4116376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 08:57:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 08:57:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 08:57:36 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62DvaSt010976
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 08:57:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 2 Jul 2019 09:57:32 -0400
Message-ID: <1562075852-14829-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] usb-lld-rtos: SRCREV update to 01.00.00.18A
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
X-List-Received-Date: Tue, 02 Jul 2019 13:57:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
index d8dfc42..5507575 100644
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -12,14 +12,14 @@ USB_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/usb.git"
 USB_LLD_GIT_PROTOCOL = "git"
 USB_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.18"
-USB_LLD_SRCREV = "726ddde8b40af06756cbb3de9f19d602a53a537a"
+# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.18A"
+USB_LLD_SRCREV = "2a90c39be49f2732b3ca08b322c51d0a977ea510"
 
 BRANCH = "${USB_LLD_GIT_BRANCH}"
 SRC_URI = "${USB_LLD_GIT_URI};protocol=${USB_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${USB_LLD_SRCREV}"
-PV = "01.00.00.18"
+PV = "01.00.00.18A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos"
-- 
1.9.1


