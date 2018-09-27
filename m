Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8785E00C74; Thu, 27 Sep 2018 13:43:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A251BE00BC8
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:43:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKhcaw097784
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081018;
	bh=a8UfK/8gsnEw5LF9Qnu5/efxC0gqb0wsdABSF9doZvs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Es+trWzVTyyP+EuOov6B+NtuT5AqlDjETL7Cbi7lMt7jWOSJA/AracznjK+evGWst
	RfPejLyhNfNbPMJ7cw6kfYstjicaxLfg65MKCeQx1o89GACPGwZl7/j/mEczKDXuKy
	FyoeAZ0hWrpj/sKlX41m48yzG+TTbEWAFjemAAho=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhcf9030544
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:38 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:43:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:43:38 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhbi4003847
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 16:43:02 -0400
Message-ID: <1538081009-52859-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 03/30] osal: SRCREV update to 01.00.00.12.r1
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
X-List-Received-Date: Thu, 27 Sep 2018 20:43:49 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index f360244..5b38d7b 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -10,11 +10,11 @@ OSAL_GIT_BRANCH = "master"
 OSAL_GIT_DESTSUFFIX = "git/ti/osal"
 
 # Below commit ID corresponding to "DEV.OSAL.01.00.00.12"
-OSAL_SRCREV = "d93d8833e5e0bbd3e76f8618a4f717e3539a8d11"
+OSAL_SRCREV = "f9f47ad458a39201d822aa7f7e4774eb145ed451"
 
 BRANCH = "${OSAL_GIT_BRANCH}"
 SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${OSAL_SRCREV}"
 PV = "01.00.00.12"
-INC_PR = "r0"
+INC_PR = "r1"
-- 
1.9.1


