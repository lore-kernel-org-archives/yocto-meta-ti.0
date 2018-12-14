Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B6DAE00C58; Fri, 14 Dec 2018 11:31:50 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8338CE00B77
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:49 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVn6U040528
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815909;
	bh=MINI8zqTylMHjyeZSP+DUni3lLTg4Z7iq/6Wx32hSqI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jxK8wRG8tn6kcQbTrcln41jctxTJGaqUPNkey8nTE5P4bP4PCdddejcgslspFKkvA
	kYZ5UyWbsM6AmtyKKvs61SY5NhpBbR6KkzaB4T+XMMZgjC7I0S7yB+uR2WswPNUZhK
	yLQniVW2N1hUHt/vKoqkAt0PtTQRNNkyoLe55R6s=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVn4k087383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:49 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:48 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmd2031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:48 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:11 -0500
Message-ID: <1544815903-10792-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 02/34] bcp-lld-rtos: SRCREV update to 02.01.00.07A
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:50 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
index 6806687..61b4dfc 100644
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
@@ -13,14 +13,14 @@ BCP_LLD_GIT_PROTOCOL = "git"
 BCP_LLD_GIT_BRANCH = "master"
 BCP_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
 
-# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.07"
-BCP_LLD_SRCREV = "84c34a7e79a017c39319daa453cea6ea1b45751c"
+# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.07A"
+BCP_LLD_SRCREV = "da66f02398ebef70f69a8703e6755985010eb422"
 
 BRANCH = "${BCP_LLD_GIT_BRANCH}"
 SRC_URI = "${BCP_LLD_GIT_URI};destsuffix=${BCP_LLD_GIT_DESTSUFFIX};protocol=${BCP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BCP_LLD_SRCREV}"
-PV = "02.01.00.07"
+PV = "02.01.00.07A"
 PR = "r0"
 
 S = "${WORKDIR}/${BCP_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


