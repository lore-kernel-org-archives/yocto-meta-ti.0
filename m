Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B48BC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:37:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3871.1707734269318794003
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 02:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UWbleYXx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CAbm5j097050
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:37:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707734268;
	bh=JbnUlrcW20/R8uopeOar8yn1vZX1cCA9fjK/Vai7uNo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UWbleYXxh2FUWlLn9VkxFq98xgLExXf9YCgaHW55iH1WDWEfnoOWkbaQ+ByS87xoK
	 nINhcXP+3GLAL8KcT5MevTLrETiKnB6FpFab5TxHG+yPjc75AgwzQP/YUZ6WhVrmd9
	 7v9QDsXry2JIdQdQa2Q+pLEkUZMKRd2QoB+TalnY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CAbmKe010140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:37:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 04:37:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 04:37:48 -0600
Received: from uda0497581.dhcp.ti.com (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CAbfmp105511;
	Mon, 12 Feb 2024 04:37:45 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][kirkstone][PATCH 1/2] meta-ti-bsp: optee: Upgrade to 4.1
Date: Mon, 12 Feb 2024 16:07:36 +0530
Message-ID: <20240212103737.4161809-2-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212103737.4161809-1-m-chawdhry@ti.com>
References: <20240212103737.4161809-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 10:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17470

Update all OP-TEE components to 4.1 tag. OP-TEE examples are already in
4.1 tag.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 0da37acf735f..0f1da594cd34 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
+PV = "4.1.0+git${SRCPV}"
+SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 2e4e53b7ed03..34f4c809c58a 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "2a5b1d1232f582056184367fb58a425ac7478ec6"
+PV = "4.1.0+git${SRCPV}"
+SRCREV = "012cdca49db398693903e05c42a254a3a0c0d8f2"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 48231a669d6a..0091ad5696d0 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.0.0+git${SRCPV}"
-SRCREV = "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
+PV = "4.1.0+git${SRCPV}"
+SRCREV = "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
-- 
2.43.0


