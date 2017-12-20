Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08739E00CE8; Wed, 20 Dec 2017 13:23:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 773D6E008FB
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 13:23:01 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBKLN1Ts020128
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 15:23:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513804981;
	bh=Z4VCK+MBFCp1qqxC41dupQrcA4USCQqvTdLlM4Of8t4=;
	h=From:To:Subject:Date;
	b=mtgF9xJoB+aFfjX+Mtgwyj3FhSoabYH4yTPXm1UvCXLg1XG+QnCUK19duhPjeUxn2
	RzNMIdN6N0ALQmTSUmCMAMU1pb5hyug5G2dpoyQgE7E8xoNsAcbkogwTB8o1FAwDIA
	HyhHuBwgkKq9dzZIOdQiuU06cQ8AINZrPJnXdFMk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBKLN13w032604
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 15:23:01 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 20 Dec 2017 15:23:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 20 Dec 2017 15:23:01 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBKLN0Vj014660
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 15:23:01 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Dec 2017 16:22:59 -0500
Message-ID: <1513804979-7617-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] osal-rtos: Adding support for c66x
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
X-List-Received-Date: Wed, 20 Dec 2017 21:23:03 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-rtos_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos_git.bb
index da421b6..b150760 100644
--- a/recipes-bsp/osal/osal-rtos_git.bb
+++ b/recipes-bsp/osal/osal-rtos_git.bb
@@ -3,6 +3,8 @@ require recipes-bsp/osal/osal.inc
 
 PR = "${INC_PR}.0"
 
+COMPATIBLE_MACHINE_append = "|c66x"
+
 S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
 
 DEPENDS_append_ti33x = " starterware-rtos"
-- 
1.9.1


