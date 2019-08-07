Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E424E00D9B; Wed,  7 Aug 2019 10:03:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85F23E00D67
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2019 10:03:11 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77H3Bgq077123
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 12:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565197391;
	bh=qu+iZ1si73y85igG8At9jqCqvqfBwVtTRmbg0SJQD6I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mjOh7ouF9Y+y92muZT0+Idml6og5L9aa9tSV0jDCHY/PRzRn6xqP0cT8FDM+MPlZ/
	t0pmMjPELW5Di5w2VTPSn8fvsfmJjkiLJR3KyxVl/8qIqFD7sHmF4faRhmcG2OMG2E
	9YBYaXi5FQ0/kLSGrvSUNz+OHILb59d0o5VSajEc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77H3B6O077786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 12:03:11 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 7 Aug 2019 12:03:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 7 Aug 2019 12:03:10 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77H3A8W130772
	for <meta-ti@yoctoproject.org>; Wed, 7 Aug 2019 12:03:10 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 7 Aug 2019 13:03:04 -0400
Message-ID: <1565197384-57542-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565197384-57542-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565197384-57542-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ipc-transport: SRCREV update to 02.00.00.02A
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
X-List-Received-Date: Wed, 07 Aug 2019 17:03:12 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ipc/ipc-transport.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
index 25c49e7..0c1edef 100644
--- a/recipes-ti/ipc/ipc-transport.inc
+++ b/recipes-ti/ipc/ipc-transport.inc
@@ -4,12 +4,12 @@ IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
 IPC_TRANSPORT_GIT_PROTOCOL = "git"
 IPC_TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.02"
-IPC_TRANSPORT_SRCREV = "8cb22733115f7c1ee1e1cf3f7d704158080f383c"
+# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.02A"
+IPC_TRANSPORT_SRCREV = "f75e2e29b9b1b63443a0c82493e41dd2f771c6f5"
 
 BRANCH = "${IPC_TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${IPC_TRANSPORT_GIT_URI};protocol=${IPC_TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${IPC_TRANSPORT_SRCREV}"
-PV = "02.00.00.02"
+PV = "02.00.00.02A"
 INC_PR = "r0"
-- 
1.9.1


