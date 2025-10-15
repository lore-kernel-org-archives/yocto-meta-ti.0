Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559A5CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 05:30:20 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.8816.1760506218027897494
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 22:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fUn8M2aZ;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5UHN21324277
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 00:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506217; i=@ti.com;
	bh=cYBOJJhao4bCCmS5fcNs7606kvrKsxH6+WS+QrUl1iI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fUn8M2aZ27t2fYQfilE/Sg47U/KVY5sk+cAJRfPU3MXwc644f09GIoQMj1xB5mZJG
	 qzWZDDIfGb9lX2NZqxefaXVjICzpixliwB1Qhyz40jdX9ZAhvZS6WF3k8WnldzEjxd
	 QxbwJg33nVNkBH2hUnwpLoWf0O5NeD6a5kNrwaRE=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5UHBE989508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 00:30:17 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 00:30:16 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:30:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5UGYE723654;
	Wed, 15 Oct 2025 00:30:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C7CF313F538; Wed, 15 Oct 2025 00:30:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <khasim@ti.com>, <jm@ti.com>
Subject: Re: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Add overlay for EQEP
Date: Wed, 15 Oct 2025 00:30:16 -0500
Message-ID: <20251015053016.2377872-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251015052836.1579479-1-p-bhagat@ti.com>
References: <20251015052836.1579479-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 05:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19125

meta-ti / na / 20251015052836.1579479-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Add overlay for EQEP
    WARN: Commit message should not include directory path to recipe: conf: machine: am62dxx-evm: Add overlay for EQEP.
              conf:
              machine: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Add overlay for EQEP
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 15 Oct 2025 10:58:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 994160d65e91e4b98732e532a1137ea65ccd5fb3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEMP: Cleanup initramfs
- Commit SHA: 1c17231ad27cb522b44b5614f39caf9d0aa99330

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Add overlay for EQEP
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 15 Oct 2025 10:58:36 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 994160d65e91e4b98732e532a1137ea65ccd5fb3

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

scarthgap
=====================
PASS




