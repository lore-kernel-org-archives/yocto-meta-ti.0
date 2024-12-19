Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B872E77193
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:07 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.139692.1734645244170890036
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Uk6DL49+;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs2k1377431
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645242;
	bh=zHX2E4Te7UINslbI+hNhaKMpS4IkKgORJpkNUmVcaXE=;
	h=From:To:Subject:Date;
	b=Uk6DL49+QU4DlTMm7Tgu3IkRkW0tvYWXOspQI7Tf+dmLMnW3/hLih0c7t5uTVgTnp
	 fMBmNmVs5dgq5D6wAyREEPNFM47JhARvyzhpHfZlXIbbU6JbbEwSnqkUIxwzMnu0/A
	 sLJkPvq/UuFypVJ33gaAE3TUlidh6zD3aB3ChPHU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs2Hw028121
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:02 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:02 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs2Gm017364;
	Thu, 19 Dec 2024 15:54:02 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT4-0007Rq-E1; Thu, 19 Dec 2024 15:54:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 00/13] Add meta-beagle layer
Date: Thu, 19 Dec 2024 15:53:49 -0600
Message-ID: <20241219215402.28324-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18147

Backport of the meta-beagle patches from master.

Denys Dmytriyenko (12):
  conf/machine: rename beagleplay machine to beagleplay-ti
  meta-beagle: create a separate layer for Beagle platforms
  meta-beagle: layer.conf: add lz4c to host tools list
  conf/machine: move "bb_org" BSP settings to meta-beagle
  conf/machine: split beagleplay config between meta-ti-bsp and
    meta-beagle
  conf/machine: move remaining Beagle platforms to meta-beagle
  u-boot-bb_org, linux-bb_org: move "bb_org" providers to meta-beagle
  linux-bb.org: update Beagle BSP to 6.1.83
  conf/machine: add BeagleY-AI platform
  linux-bb.org, u-boot-bb.org: rename recipes with version
  beagle-bsp, linux-bb.org, u-boot-bb.org: add support for 6.6 BSP
  linux-bb.org_6.6: disable FORTIFY_SOURCE for now

Ryan Eatmon (1):
  meta-beagle: Add SECURITY file

 {meta-ti-extras => meta-beagle}/COPYING.MIT   | 24 ++---
 {meta-ti-extras => meta-beagle}/README        | 10 +-
 {meta-ti-bsp => meta-beagle}/SECURITY         |  0
 meta-beagle/conf/layer.conf                   | 17 ++++
 .../conf/machine/beagle-x15.conf              |  5 +-
 .../conf/machine/beaglebone-ai64-k3r5.conf    | 11 ++-
 .../conf/machine/beaglebone-ai64.conf         | 22 +++--
 .../conf/machine/beaglebone.conf              |  5 +-
 meta-beagle/conf/machine/beagleplay-k3r5.conf | 11 +++
 meta-beagle/conf/machine/beagleplay.conf      | 78 +++++++++++++++
 meta-beagle/conf/machine/beagley-ai-k3r5.conf | 16 ++++
 meta-beagle/conf/machine/beagley-ai.conf      | 25 +++++
 .../conf/machine/include/beagle-bsp.inc       | 43 +++++++++
 .../u-boot/u-boot-bb.org_2023.04.bb           |  7 +-
 .../u-boot/u-boot-bb.org_2024.10.bb           | 12 +++
 .../linux/linux-bb.org-6.1}/defconfig         |  0
 .../linux/linux-bb.org-6.6}/defconfig         |  0
 .../linux/linux-bb.org-6.6/no-fortify.cfg     |  1 +
 .../recipes-kernel/linux/linux-bb.org_6.1.bb  | 19 ++--
 .../recipes-kernel/linux/linux-bb.org_6.6.bb  | 71 ++++++++++++++
 ...play-k3r5.conf => beagleplay-ti-k3r5.conf} |  1 -
 meta-ti-bsp/conf/machine/beagleplay-ti.conf   | 49 ++++++++++
 meta-ti-bsp/conf/machine/beagleplay.conf      | 96 -------------------
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 21 +---
 ...void-64-bit-division-in-ioc_timer_fn.patch | 56 -----------
 ...-gcc13-keep-large-values-in-a-new-en.patch | 54 -----------
 26 files changed, 382 insertions(+), 272 deletions(-)
 copy {meta-ti-extras => meta-beagle}/COPYING.MIT (86%)
 copy {meta-ti-extras => meta-beagle}/README (82%)
 copy {meta-ti-bsp => meta-beagle}/SECURITY (100%)
 create mode 100644 meta-beagle/conf/layer.conf
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beagle-x15.conf (89%)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64-k3r5.conf (66%)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64.conf (65%)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone.conf (92%)
 create mode 100644 meta-beagle/conf/machine/beagleplay-k3r5.conf
 create mode 100644 meta-beagle/conf/machine/beagleplay.conf
 create mode 100644 meta-beagle/conf/machine/beagley-ai-k3r5.conf
 create mode 100644 meta-beagle/conf/machine/beagley-ai.conf
 create mode 100644 meta-beagle/conf/machine/include/beagle-bsp.inc
 rename meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb => meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2023.04.bb (61%)
 create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
 copy {meta-ti-bsp/recipes-kernel/linux/linux-bb.org => meta-beagle/recipes-kernel/linux/linux-bb.org-6.1}/defconfig (100%)
 rename {meta-ti-bsp/recipes-kernel/linux/linux-bb.org => meta-beagle/recipes-kernel/linux/linux-bb.org-6.6}/defconfig (100%)
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
 rename meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb => meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb (76%)
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
 rename meta-ti-bsp/conf/machine/{beagleplay-k3r5.conf => beagleplay-ti-k3r5.conf} (88%)
 create mode 100644 meta-ti-bsp/conf/machine/beagleplay-ti.conf
 delete mode 100644 meta-ti-bsp/conf/machine/beagleplay.conf
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-blk-iocost-avoid-64-bit-division-in-ioc_timer_fn.patch
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-block-blk-iocost-gcc13-keep-large-values-in-a-new-en.patch

-- 
2.17.1


