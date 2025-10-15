Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27BACCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:05:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.14543.1760529911754323154
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 05:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Jcm6cKh3;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FC5A3l1396103;
	Wed, 15 Oct 2025 07:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760529910; i=@ti.com;
	bh=J5D3KCE45wdcsq3MwGNTGbaBTOE7M2BrnBHhljIRGgE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jcm6cKh3IXq2FS0wksDDBWjKx+vNRNNnlrQHIsJWETc6QEOx9eE3O9ZvauivjqIUN
	 cutMGQ1o6IAci7Y9Nh06OZF91CB2icyBVsK0rMrIuCu52EKyPhdbl8C9T7HArV8IKZ
	 Qk+DotAoEYnflxVUZ9jpYtmUpmqHPasvAPbmiRmM=
Received: from DFLE207.ent.ti.com (dfle207.ent.ti.com [10.64.6.65])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FC5AMs1205099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:05:10 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:05:10 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:05:10 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FC5AEo991483;
	Wed, 15 Oct 2025 07:05:10 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 43A1C13F52D; Wed, 15 Oct 2025 07:05:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>, <bb@ti.com>,
        <denys@konsulko.com>, <rs@ti.com>
Subject: Re: [master][PATCH v5 0/4] Add recipes to build initramfs image
Date: Wed, 15 Oct 2025 07:05:10 -0500
Message-ID: <20251015120510.3267392-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251015120032.288741-1-m-shah@ti.com>
References: <20251015120032.288741-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 12:05:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19131

meta-ti / na / 20251015120032.288741-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [master][PATCH v5 1/4] meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image
    ERROR: Commit message too long (> 80 chars): meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image. (COMMIT-MESSAGE-1)
        patch:44
            Subject: [master][PATCH v5 1/4] meta-ti-bsp: conf: machine: include: Add common module variable for TI Initramfs image
    
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
WARN - [master][PATCH v5 2/4] recipes-ti: initramfs: Make minimal initramfs image
    WARN: Commit message does not include file/recipe name: recipes-ti: initramfs: Make minimal initramfs image. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-ti: initramfs: Make minimal initramfs image.
              recipes-ti: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [master][PATCH v5 3/4] meta-ti-bsp: wic: Add initramfs path to to grub config
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: wic: Add initramfs path to to grub config. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: wic: Add initramfs path to to grub config.
              meta-ti-bsp:
              wic: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
WARN - [master][PATCH v5 4/4] meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoCs.
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoCs.. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: conf: machine: include: Build initramfs for all TI SoCs..
              meta-ti-bsp:
              conf:
              machine:
              include: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch




