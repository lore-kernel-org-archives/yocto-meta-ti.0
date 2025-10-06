Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B12CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:55:18 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.32101.1759751711207961385
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 04:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u3F6Ek0z;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596Bt9Hp3989330;
	Mon, 6 Oct 2025 06:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759751709; i=@ti.com;
	bh=TomrfRTGJ3/6NNDIQ5dwpr7iw9/RkC38Fa5QwzGIK6M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=u3F6Ek0z7p0o07i1MTc2G5BTMxgGn8oUXVHJ4W+FFa8oWs8vj7tTSpzQy0Eu6kKdt
	 x4WrbFYoPZXpWqz0VrVQoVTmcL0bbZYAKkPcT6gAV+8j83ci+LjnnlT89kso0GDjlh
	 r8U99GnBlsbN8mXaEzpdRcnMAufNxZ8ewlcw7dos=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596Bt9ad2206068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 6 Oct 2025 06:55:09 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 06:55:09 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 06:55:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596Bt9jt3608114;
	Mon, 6 Oct 2025 06:55:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2BBAA13F52D; Mon,  6 Oct 2025 06:55:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>, <bb@ti.com>,
        <denys@konsulko.com>, <rs@ti.com>
Subject: Re: [master][PATCH v4 0/4] Add recipes to build initramfs image
Date: Mon, 6 Oct 2025 06:55:09 -0500
Message-ID: <20251006115509.3339518-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251006115010.1530509-1-m-shah@ti.com>
References: <20251006115010.1530509-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 06 Oct 2025 11:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19110

meta-ti / na / 20251006115010.1530509-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [master][PATCH v4 1/4] meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image
    ERROR: Commit message too long (> 80 chars): meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image. (COMMIT-MESSAGE-1)
        patch:44
            Subject: [master][PATCH v4 1/4] meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image
    
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image.
              meta-ti-bsp:
              conf:
              machine:
              include: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [master][PATCH v4 2/4] recipes-ti: initramfs: Make minimal initramfs image
    WARN: Commit message does not include file/recipe name: recipes-ti: initramfs: Make minimal initramfs image. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-ti: initramfs: Make minimal initramfs image.
              recipes-ti: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [master][PATCH v4 3/4] meta-ti-bsp: wic: Add initramfs path to to grub config
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: wic: Add initramfs path to to grub config. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: wic: Add initramfs path to to grub config.
              meta-ti-bsp:
              wic: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [master][PATCH v4 4/4] meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoC's
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoC's. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoC's.
              meta-ti-bsp:
              conf:
              machine:
              include: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch




