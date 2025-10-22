Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D4BCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 07:50:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.3688.1761119414443249010
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 00:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iD4LWOyp;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59M7oDBs216970;
	Wed, 22 Oct 2025 02:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761119413; i=@ti.com;
	bh=tZo3/Hqqd/eAonpO0P+zFgbjL6a9FLo++w/4kosVcdo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iD4LWOypk0FRz41KMDPRDJd7jini+flk6f8uS5FWRO2SC+9UYbnqYS6ysg/lUjLP9
	 jE44h80k5Oh/Eie7XD+h+fuuRl0uOoKwr1Vwh8zac3oS0O3VZdsMi0uhN+mKrTfyDV
	 s1nKa5nP3/WLCWCtgrduxf7uX7h9Xi3xndgiYP1U=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59M7oDAI1764385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 02:50:13 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 02:50:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 02:50:13 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59M7oDmu873530;
	Wed, 22 Oct 2025 02:50:13 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 08670180194; Wed, 22 Oct 2025 02:50:13 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510220100
Date: Wed, 22 Oct 2025 02:50:13 -0500
Message-ID: <20251022075013.4079013-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251022074851.1115311-1-lcpdbld@list.ti.com>
References: <20251022074851.1115311-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Oct 2025 07:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19154

meta-ti / na / 20251022074851.1115311-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510220100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.master.202510220100. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510220100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 22 Oct 2025 02:48:51 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9d01b713dca630ff8db894b596d83b6c2d42a208

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 20db2e351fa4fb615b39b69eae8658ee252b03ed

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




