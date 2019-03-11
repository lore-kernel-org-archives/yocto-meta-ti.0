Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7644EE00D89; Mon, 11 Mar 2019 14:02:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A5A1E00CCC
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 14:01:59 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BL1xen009870
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 16:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552338119;
	bh=yWMQHJPwnpF0QaM/aFYqxOkOebo5KOnGzrUXQiL0E7c=;
	h=From:To:CC:Subject:Date;
	b=Y/DYLa7Ej0SsMnX19kDhEA9bILH09tTFzxpLwn+sFfB1c3KBTZZpQmQN5Y2t9iJGh
	sTg8RZNM/dLDzraKA5xTdbj4OjXMWbA92CuW3pcpguJV6iy6b/3plCYIUKK4F/+cyi
	4V1ach8SFpoLE4+xM6lln5hGM5pquWOwd7kN6tsI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BL1xNL089501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2019 16:01:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 16:01:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 16:01:58 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BL1wQZ025857;
	Mon, 11 Mar 2019 16:01:58 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2019 17:01:56 -0400
Message-ID: <1552338116-25917-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] swtools: bump SRCREV
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
X-List-Received-Date: Mon, 11 Mar 2019 21:02:05 -0000
Content-Type: text/plain

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/swtools/swtools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
index 425a069..16a8cc0 100644
--- a/recipes-ti/swtools/swtools_git.bb
+++ b/recipes-ti/swtools/swtools_git.bb
@@ -15,7 +15,7 @@ PR = "r0"
 S = "${WORKDIR}/git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
-SRCREV = "881267836907de650edadc56b8e57ab45428021d"
+SRCREV = "d0c1022954b489d5f3d8d2f5c81d8c6a392f4af4"
 
 export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
 export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
-- 
1.9.1


