Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5455DC4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:37:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3807.1707734266127750215
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 02:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xXn8ONsZ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CAbjwe116216
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:37:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707734265;
	bh=Fr3yzro685H/al0VtVuLvzOqpBtCn0NI9nAVKhUSa8M=;
	h=From:To:CC:Subject:Date;
	b=xXn8ONsZz5SsBbyAh+VIK4KjF9okooIZjOGoZZ8hu1VbREVlgsVIOiY6OkUPwpqVd
	 MrO9VoTjRQ1P6VlqdzEpg5SVDU8R0CMPqlPvZRfOKAq5rcf0EG/byw8BSzeslpFXNW
	 0liviBX8STk4x3fenwYAIFK4WM7xNRJ/Qbr2OwFg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CAbjuq069550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 04:37:45 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 04:37:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 04:37:45 -0600
Received: from uda0497581.dhcp.ti.com (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CAbfmo105511;
	Mon, 12 Feb 2024 04:37:42 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Manorit Chawdhry
	<m-chawdhry@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/2] ATF/OP-TEE Upgrade
Date: Mon, 12 Feb 2024 16:07:35 +0530
Message-ID: <20240212103737.4161809-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 10:37:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17469

Forgot the prefixes last time so sending it again.

Manorit Chawdhry (2):
  meta-ti-bsp: optee: Upgrade to 4.1
  meta-ti-bsp: trusted-firmware-arm: Update to master

 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++--
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0


