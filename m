Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB3CE77192
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:07 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.139711.1734645244523197065
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RB6nqyPA;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3ed377435
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=x20gRk93POJEZEgOELgyPs8Gfw0D7yFSq4dcUOlcDYc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RB6nqyPA1uvduTU6DZ0BopsnTmgaWAExxiOlBvtagGu5xiohbqCKUVrmpJUS4/UGH
	 aHR1K0Dw15AphzcPeIg3ykqnDMVCM26JSLhPqbIsmjGKobaB0vefNLLbcZGPbtufQg
	 uA9H6GABPY4T+WHWadbf8j646RWJTHmakgxohsSo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3OU130299
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3qw017407;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007Yq-8i; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 07/13] u-boot-bb_org, linux-bb_org: move "bb_org" providers to meta-beagle
Date: Thu, 19 Dec 2024 15:53:56 -0600
Message-ID: <20241219215402.28324-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18150

From: Denys Dmytriyenko <denys@konsulko.com>

Move "bb_org" kernel and U-boot providers that use corresponding official
BeagleBoard.org trees into own meta-beagle layer.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb                     | 2 +-
 .../0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch | 0
 ...1-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch | 0
 .../recipes-kernel/linux/linux-bb.org/defconfig                 | 0
 .../recipes-kernel/linux/linux-bb.org_git.bb                    | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta-ti-bsp => meta-beagle}/recipes-bsp/u-boot/u-boot-bb.org_git.bb (92%)
 rename {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch (100%)
 rename {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch (100%)
 rename {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/linux-bb.org/defconfig (100%)
 rename {meta-ti-bsp => meta-beagle}/recipes-kernel/linux/linux-bb.org_git.bb (100%)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
similarity index 92%
rename from meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
rename to meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 13286564..0b23effc 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -1,4 +1,4 @@
-require u-boot-ti.inc
+require recipes-bsp/u-boot/u-boot-ti.inc
 
 SUMMARY = "BeagleBoard.org U-Boot"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch b/meta-beagle/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
rename to meta-beagle/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch b/meta-beagle/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
rename to meta-beagle/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig b/meta-beagle/recipes-kernel/linux/linux-bb.org/defconfig
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig
rename to meta-beagle/recipes-kernel/linux/linux-bb.org/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
rename to meta-beagle/recipes-kernel/linux/linux-bb.org_git.bb
-- 
2.17.1


