Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D92F0E010AC; Fri,  6 Jul 2018 12:53:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED6AEE00E47
	for <meta-ti@yoctoproject.org>; Fri,  6 Jul 2018 12:53:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w66JrcQn089590
	for <meta-ti@yoctoproject.org>; Fri, 6 Jul 2018 14:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530906818;
	bh=FWKO7C4UJkqITicwzjNIgaZM7/yEsqmzfBU76EWCstk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Tky4jU7wYu6OYVCadqLugLWmohWSCSGxx6MfG9SjLPXQo7BXB3yskKZRP8Ks57QYL
	0dXb1xCnntWJ7dLgqXtbA6JOWG2Rx9XJE13q0opCyh+GTI7leQAoYoOzNEjooZGK3W
	WnKW6ngEpU1WX87FBQuQFJowZZouoTqaPtMSpsU0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w66JrcZK024794
	for <meta-ti@yoctoproject.org>; Fri, 6 Jul 2018 14:53:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 6 Jul 2018 14:53:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 6 Jul 2018 14:53:38 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w66JrccU018825;
	Fri, 6 Jul 2018 14:53:38 -0500
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w66Jrbx10181; Fri, 6 Jul 2018 14:53:37 -0500 (CDT)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 6 Jul 2018 14:53:28 -0500
Message-ID: <1530906808-11973-2-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530906808-11973-1-git-send-email-nsaulnier@ti.com>
References: <1530906808-11973-1-git-send-email-nsaulnier@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1 2/2] pru-icss_git.bb: fixed typo
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
X-List-Received-Date: Fri, 06 Jul 2018 19:53:41 -0000
Content-Type: text/plain

Deleted "A" from previous commit.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 1bd9d35fd655..5161e1f9dc4a 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -215,8 +215,6 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
 
-A
-
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


