Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC13ECCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 18:16:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.938.1761243358483340548
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 11:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q7DtIM7C;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NIFtqh595591;
	Thu, 23 Oct 2025 13:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761243356; i=@ti.com;
	bh=z2CQQm3p6HZYIw+DfQbtPsvy+nAUe6jEBzoYUxZYgYI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q7DtIM7CQgKnYN9jQwm2PIDv26nOL7AJjwxdghV9QVRimZGz5YW/4V9EocErKrK8z
	 NEv7fiF/lGsJfHOX+zW/4sax8xgCU78ArU7YPnit/6KTPGKno5oQ72LPXkqAgGIkmT
	 Iqxwu1Jjw82IYL/NUzol8w9aXsBPMQto+ajrJykI=
Received: from DLEE204.ent.ti.com (dlee204.ent.ti.com [157.170.170.84])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NIFtcn2894510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 13:15:55 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 13:15:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 13:15:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NIFPa13283682;
	Thu, 23 Oct 2025 13:15:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9D28913F538; Thu, 23 Oct 2025 13:15:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [master][PATCH] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
Date: Thu, 23 Oct 2025 13:15:25 -0500
Message-ID: <20251023181525.3536647-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251023181013.25365-1-denis@denix.org>
References: <20251023181013.25365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 18:16:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19157

meta-ti / na / 20251023181013.25365-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
    WARN: Commit message does not include file/recipe name: packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 23 Oct 2025 14:10:13 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e5168559f0afa34f5b9a12215cfc418a2b6c77c5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
- Commit SHA: 0473044cc244ce98ccd0300e5c8086433e5e520d

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/conf/machine/include/am62axx.inc:15
            TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  = "kernel-module-tps6594-i2c"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/conf/machine/include/am62axx.inc:16
            TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  = "kernel-module-tps6594-i2c"
    
    
    Code Summary
    ============
    
    APPEND-2
    -------------------------------------------
      :append simply takes the specified string and concatenates it
      directly to the variable.  Most of the time we want there to spaces
      between entries.  This check flags us to check if the missing space
      is actually needed.




