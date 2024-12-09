Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB44E77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 10:13:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.97816.1733739216622990184
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 02:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UYg+3z9m;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ADZJr039640
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:13:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733739215;
	bh=ykQMx6E/CHrJkOoATDqUdpnIHUh1h4Eq3A6d9VoykJI=;
	h=From:To:CC:Subject:Date;
	b=UYg+3z9mK1dd0QNJyUfhQqVpgi8+xAZG+K4Kcea4JxEVcbEV01i7fVu/9cmsp6HvL
	 ZZUomr1MBA72YU0TFYSGGavQEAJWsXZmdCoV/o9H7kdneopEZ6zb6qGgdV5sCKIAn+
	 xrU0GEA2BznTLsG2e3h2D8i1HJdY7iaezK9wCOF8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9ADZUD026545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:13:35 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 04:13:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 04:13:35 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ADX05063363;
	Mon, 9 Dec 2024 04:13:34 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 0/2] omap-a15: Add
Date: Mon, 9 Dec 2024 15:40:33 +0530
Message-ID: <20241209101330.1893700-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 10:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18096

As per discussion in kirkstone version of the patch [0], sending this
series rebased for scarthgap/master as well.

The firmware is required for early boot of the remoteproc from SPL stage
of the bootloader. Copy the ipc firmware into the boot partition of the
wic images, where the bootloader expects it to be.

For this, add a deploy task for the firmware binary and also include the
file in IMAGE_BOOT_FILES for omap-a15.

[0]: https://lists.yoctoproject.org/g/meta-ti/message/18091

Aniket Limaye (2):
  meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
  conf: machine: omap-a15.inc: include ipu1 firmware in the boot
    partition

 meta-ti-bsp/conf/machine/include/omap-a15.inc    |  3 ++-
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.47.0


