Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14173D59F6D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 19:53:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.55457.1730922792967670511
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 11:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vk0SBeLz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6JrBMX099293;
	Wed, 6 Nov 2024 13:53:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730922791;
	bh=yLm+LcFBOSv7GlGXKu1kiG2plOxlSf2YsxbJqUee4Ms=;
	h=From:To:Subject:Date;
	b=Vk0SBeLzoVuY09B02h9RA24apVIp9IzEolYz6RS7vzHZkG1DmCeHHXqYsBXx4gZMl
	 34IMB7tqWKEvHhTtayqA5wYFRVhXL/kFeLTFYhRv8hBws9GAzr1DKlsbPbd+enn9MH
	 q+rxK0oM+KOdet+DEH+gJ0+BGTghLWZaXBXTpkPE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6JrBrs104158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 13:53:11 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 13:53:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 13:53:11 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6JrBmG120724;
	Wed, 6 Nov 2024 13:53:11 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t8m5X-0000Zy-7V; Wed, 06 Nov 2024 13:53:11 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] trusted-firmware-a: Update to DM_MANAGED suspend
Date: Wed, 6 Nov 2024 13:53:11 -0600
Message-ID: <20241106195311.2183-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Nov 2024 19:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18050

Update to commit 58b25570c9ef91753b14c2103f45f4be9dddb696, which adds
the DM_MANAGED suspend feature.

https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/58b25570c9ef91753b14c2103f45f4be9dddb696

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 157bdbc5..17f0f143 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,5 +1,5 @@
 PV:k3 = "2.11+git"
-SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"
+SRCREV_tfa:k3 = "58b25570c9ef91753b14c2103f45f4be9dddb696"
 LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
-- 
2.17.1


