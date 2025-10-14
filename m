Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5F5CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:53:07 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1562.1760478780887842456
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 14:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=E9NynCzo;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EKASH41229078;
	Tue, 14 Oct 2025 15:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760472628; i=@ti.com;
	bh=7vx+xtMrevDdpuT+V4YvY+2tzg0PTPh7mutDykKgc8s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E9NynCzok8iFnYqt8lN5M/3DLWQaoqkFFchK0PsHj4fRnCebwPb6Gvo42n82zBYiK
	 98U0I80Nd9raeOUDfBbp2DEFV+ENzYSVwY/0+OhmozENQtGQc0xG17vrXZe8UU9Gcm
	 iDROU1ur+ktHDQ7wbusjn66zDywIwuVOhjG8ek4w=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EKAS8g270425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 15:10:28 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 15:10:28 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 15:10:28 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EKASCl333293;
	Tue, 14 Oct 2025 15:10:28 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 30423D6F29; Tue, 14 Oct 2025 15:10:28 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] 1/2 conf: machine: Include MCSPI overlay for am62p and am62 LP
Date: Tue, 14 Oct 2025 15:10:28 -0500
Message-ID: <20251014201028.1070733-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251014200702.933617-1-jm@ti.com>
References: <20251014200702.933617-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Oct 2025 21:53:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19123

meta-ti / na / 20251014200702.933617-1-jm

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] 1/2 conf: machine: Include MCSPI overlay for am62p and am62 LP
    WARN: You should be adding dtb files to KERNEL_DEVICETREE_PREFIX and not KERNEL_DEVICETREE (KERNEL-DEVICETREE-1)
        patch:76
            +    ti/k3-am62x-sk-mcspi-loopback.dtbo \
    
    WARN: You should be adding dtb files to KERNEL_DEVICETREE_PREFIX and not KERNEL_DEVICETREE (KERNEL-DEVICETREE-1)
        patch:88
            +    ti/k3-am62x-sk-mcspi-loopback.dtbo \
    
    WARN: Commit message does not include file/recipe name: 1/2 conf: machine: Include MCSPI overlay for am62p and am62 LP. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: 1/2 conf: machine: Include MCSPI overlay for am62p and am62 LP.
              conf:
              machine: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] 1/2 conf: machine: Include MCSPI overlay for am62p and am62 LP
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 14 Oct 2025 15:07:01 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5f5a425ac346395afd7b188e8a17f29056d72ed7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-ti-extras: dsptop: Explicitly allow build for AM57x
- Commit SHA: c8c3142da3517745c28232b4c910988235c721b0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




