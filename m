Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EA1CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 16:34:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22629.1760546041496690671
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 09:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kQMbf3k9;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: j-sahu@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FGY02I1805819
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760546041;
	bh=JYCbT6wu7a4W+Dwf247toAcmocmgLN5aVyieJw+v2kw=;
	h=From:To:CC:Subject:Date;
	b=kQMbf3k9G6WGKoydCCwN23ciSfMS2uIWqL/bBsahA0E6eLB7kYolyvAE9LVdCAZEW
	 pYZ+qAKLNNozqegXxZXkOQrd5d9WNM+8opWc4+GXZ3J4EQNjVRi/DGcLFGnj1jDD7z
	 fBq0U9Z+fkoqgi+drzurcAOF6NeGxEkc8PeD/9Cw=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FGY0wM958340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:34:00 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 11:34:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 11:34:00 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FGXxaf2261961;
	Wed, 15 Oct 2025 11:33:59 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
Date: Wed, 15 Oct 2025 22:03:36 +0530
Message-ID: <20251015163336.3955455-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 16:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19134

New features added require another increase to max_leb_cnt

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index 029e761b..cc5d87d7 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 16000"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 18000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
index 248add70..bbe956f2 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 8000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 10000"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-- 
2.34.1


