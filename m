Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51FBCE00D98; Tue,  6 Aug 2019 11:54:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 921F6E00D9B
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:40 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IseMA069534
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117680;
	bh=5aOoR8c3JGNTffTHQ4AZ3H2EepS4EEow37hf3svsBCk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Th+TfcJ4V1mEu9Myb4q2YtqUdQk4f/BeNkFqDZnVHPQqA9FxpkzIlBNHUEONuuIJ6
	+YUZlwPplLjJOcM2oon0Md5OwI3IutZn65BbBRY3ctchgRKRD6PBrrPnrq4zs7geq7
	2/Oas62gefjshn9Yqmfrs8tqWgRy7qkf+ao5LEs0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IseZ3030158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:39 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFr070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:16 -0400
Message-ID: <1565117660-52661-22-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 21/25] wdtimer-rtos: SRCREV update to 01.00.00.04A
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:41 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/wdtimer/wdtimer-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
index b884bdc..59ebf31 100644
--- a/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
+++ b/recipes-bsp/wdtimer/wdtimer-rtos_git.bb
@@ -13,14 +13,14 @@ WATCHDOG_TIMER_GIT_PROTOCOL = "git"
 WATCHDOG_TIMER_GIT_BRANCH = "master"
 WATCHDOG_TIMER_GIT_DESTSUFFIX = "git/ti/instrumentation/wdtimer"
 
-# Below commit ID corresponds to "DEV.WDTIMER.01.00.00.04"
-WATCHDOG_TIMER_SRCREV = "e25220ea8cb1c1d4bd5f5fb4fba37407d5730ffb"
+# Below commit ID corresponds to "DEV.WDTIMER.01.00.00.04A"
+WATCHDOG_TIMER_SRCREV = "5c382014ed02fdf054beb1dd0263758eb17c34e2"
 
 BRANCH = "${WATCHDOG_TIMER_GIT_BRANCH}"
 SRC_URI = "${WATCHDOG_TIMER_GIT_URI};destsuffix=${WATCHDOG_TIMER_GIT_DESTSUFFIX};protocol=${WATCHDOG_TIMER_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${WATCHDOG_TIMER_SRCREV}"
-PV = "01.00.00.04"
+PV = "01.00.00.04A"
 PR = "r0"
 
 S = "${WORKDIR}/git/ti/instrumentation/wdtimer"
-- 
1.9.1


