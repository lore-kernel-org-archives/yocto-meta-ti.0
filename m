Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F07FE00DBA; Fri, 14 Dec 2018 11:31:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12D50E00D6E
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:55 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVsQg040616
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815914;
	bh=6xL233Trpj/dmk4gqs4W9c0SSAa6/3GL5sHZR2ZIhWQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EB1AjOoDGLAkMqkTF6xF86IOWuWk+O6jZj4jmOVBLMVt5HoCfUZOn5qmP9apIhI6a
	RiPZV7GewhQBcBespsFVoFfcEQSqbm9QQ8FDQhf4nUAzols0FhHbxw0n3w0TvU31Kk
	by3cZlTxlmBBC37BdrvBIc68pCQaAtbN+qeGtD3I=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVstE019982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:54 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:54 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:54 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmdU031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:54 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:39 -0500
Message-ID: <1544815903-10792-31-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 30/34] nimu-rtos: Adding dependency to pruss-lld-rtos for k3
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/nimu-rtos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
index 101951b..1e3bc18 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -25,7 +25,7 @@ DEPENDS_append_k2g = " emac-lld-rtos"
 DEPENDS_append_c665x-evm = " emac-lld-rtos"
 DEPENDS_append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
 DEPENDS_append_omapl1 = " emac-lld-rtos"
-DEPENDS_append_k3 = " emac-lld-rtos"
+DEPENDS_append_k3 = " emac-lld-rtos pruss-lld-rtos"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
1.9.1


