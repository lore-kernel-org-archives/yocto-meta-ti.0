Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F77D59F7F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 22:53:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.59289.1730933626253571758
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 14:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WF00X0Vm;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6MriqZ107501;
	Wed, 6 Nov 2024 16:53:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730933624;
	bh=f8OefrqF0xjPXhlQFZbGaB3QzlceM7sdds6QrQx5ZqE=;
	h=From:To:Subject:Date;
	b=WF00X0VmBZov/GiEzX7C0YtDxmBQXa+A7XLmyH53/xlhUCg6P5sxEKMApwM9SKFCi
	 G04DyxGGd5wDa/i2iFqt+A/eqhWq0gYz03/tuMwR7YWzdZRBj/FXzNYY1IYT86Z6o/
	 B005BXO11eRU8UbK6bHeVL+xQX6iGmZLUPy/N/6Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6Mri27075047
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 16:53:44 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 16:53:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 16:53:44 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6MriUN028183;
	Wed, 6 Nov 2024 16:53:44 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t8ouG-0003Hv-4Z; Wed, 06 Nov 2024 16:53:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a: Update to DM_MANAGED suspend
Date: Wed, 6 Nov 2024 16:53:44 -0600
Message-ID: <20241106225344.12599-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Nov 2024 22:53:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18051

Update to commit 58b25570c9ef91753b14c2103f45f4be9dddb696, which adds
the DM_MANAGED suspend feature.

https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/58b25570c9ef91753b14c2103f45f4be9dddb696

Also change the docs/license.rst checksum.  The license file was
modified to include a reference to the pydevicetree project which uses
the Apache License 2.0.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add license checksum change.

 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 157bdbc5..ebb13bbd 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -1,6 +1,6 @@
 PV:k3 = "2.11+git"
-SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"
-LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
+SRCREV_tfa:k3 = "58b25570c9ef91753b14c2103f45f4be9dddb696"
+LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
 SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 COMPATIBLE_MACHINE:k3 = "k3"
 TFA_BUILD_TARGET:k3 = "all"
-- 
2.17.1


