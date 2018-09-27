Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EA99E00CBC; Thu, 27 Sep 2018 08:23:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47689E00BDF
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNSGY128129
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061808;
	bh=ZjNmD418WHYw26A6Hc4N0hL6eoKaea5pYNXWEAZ/AW8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hrsF0iTZ7YUujUOodA1W3nrkZ8yefkuQxnSY9lHY1joNhFtDlyQIMnipeyql/eIGU
	J/GtlQ5GkSr4GCX1aWDX+RvHp9sEhYOogoQpI7ozO02TsVN6mvc9REnDHOdXUyNVuZ
	1lBAW3uj8dnwtqsTrCsXNolZ0Ebd0zWVFqJrjrzc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNSJd018746
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:28 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJV014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:35 -0400
Message-ID: <1538061764-54977-22-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 21/30] pruss-lld: pruss-lld-rtos: Update to version 01.00.00.11 and added k3 support for rtos
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
X-List-Received-Date: Thu, 27 Sep 2018 15:23:54 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 1 +
 recipes-bsp/pruss-lld/pruss-lld.inc         | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
index 5068286..b8db20e 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -3,6 +3,7 @@ SUMMARY = "TI RTOS low level driver library for PRUSS"
 inherit ti-pdk
 require recipes-bsp/pruss-lld/pruss-lld.inc
 
+COMPATIBLE_MACHINE_append = "|k3"
 PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 89e960d..dd5bd08 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -9,13 +9,13 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
 PRUSS_LLD_GIT_BRANCH = "master"
 PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.10"
-PRUSS_LLD_SRCREV = "a11714517887bda62fab76941f2f32207fad2b05"
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.11"
+PRUSS_LLD_SRCREV = "4319eb250685f672979d4d6cc80c40a56e1afa0d"
 
 BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
 SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PRUSS_LLD_SRCREV}"
-PV = "01.00.00.10"
+PV = "01.00.00.11"
 INC_PR = "r0"
 
-- 
1.9.1


