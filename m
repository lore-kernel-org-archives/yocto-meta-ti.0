Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E68CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 04:10:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.24864.1761538216565816570
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 26 Oct 2025 21:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GhlsxPM0;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59R4AEp41196850;
	Sun, 26 Oct 2025 23:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761538214; i=@ti.com;
	bh=fgNZztY2EUYgz7OtKftJeRm3ZINk059zWL2RBdeBLcU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GhlsxPM0927hQrwO9eC7l4ZgNrr5iTu/Ucli/9H7B8d82xfLChm+yGBAYuc/LZQ+2
	 QWIxd5HGlbGVAsQ7L5GkQDYuLtlLP8FDQ9dwO/rhSWLsKW11ptgKQrKYyP4TlWkRBs
	 SN2CCNETG+84h5YMVf/l6riX/TNIfWSansM5ly/w=
Received: from DFLE212.ent.ti.com (dfle212.ent.ti.com [10.64.6.70])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59R4AE0H1129521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 26 Oct 2025 23:10:14 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Oct
 2025 23:10:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Oct 2025 23:10:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59R4AEJg032298;
	Sun, 26 Oct 2025 23:10:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F194413F52D; Sun, 26 Oct 2025 23:10:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
Date: Sun, 26 Oct 2025 23:10:13 -0500
Message-ID: <20251027041013.1949111-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251027040535.3340080-1-v-singh1@ti.com>
References: <20251027040535.3340080-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 04:10:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19182

meta-ti / na / 20251027040535.3340080-1-v-singh1

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:41
            Subject: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
    
    WARN: Commit message does not include file/recipe name: meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license.
              ipc: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Mon, 27 Oct 2025 09:35:35 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e5866cc73c99bf188d4e27659922d80f51eaae7e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
- Commit SHA: a58677ffedd5733ce7eba266bc1ed981d90af2a0

Patches
----------------------------------------
FAIL - [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
    error: patch failed: meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb:1
    error: meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb: patch does not apply
    Applying: meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
    Patch failed at 0001 meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license




