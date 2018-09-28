Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F7E8E00A0C; Fri, 28 Sep 2018 09:26:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B27BE00B9D
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQbKi130120
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151997;
	bh=fZ6wtqFM8EIqw5nps/jvjG2T86Q813pOcn2ee+kF1BM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LO891ft3GDE/KML7aMQ/4bVPNbfmmSLIrDMy5W3NhCSWw2hXz36L7pPifylqmZ64X
	22ckBZg9i6NqoXJFGIoQzACTsgMy8z3BiK7qtSuIcEMd5g4sxf4kL/BRCDr0ECigPT
	Nvx/IqWIIgtjk5TMMC5Und3xindrMO1HT1WKALqM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQbbZ000752
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:37 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMZ011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:24 -0400
Message-ID: <1538151990-44823-24-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 23/29] sciclient-rtos: SRCREV update
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index 73f642d..1eee3d6 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -12,15 +12,15 @@ SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
 SCICLIENT_GIT_PROTOCOL = "git"
 SCICLIENT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00A"
-SCICLIENT_SRCREV = "cf151766d4cef7f93b47e4822a1ce6f17dfb9339"
+# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
+SCICLIENT_SRCREV = "b865ba8a56b298048e21a26abb087c34113f5da1"
 
 BRANCH = "${SCICLIENT_GIT_BRANCH}"
 SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SCICLIENT_SRCREV}"
 PV = "01.00.00.00"
-PR = "r1"
+PR = "r2"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 
-- 
1.9.1


