Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A81CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 15:55:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.15297.1761321316544960193
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 08:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HXtv2sFM;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OFtFUS1919269;
	Fri, 24 Oct 2025 10:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761321315; i=@ti.com;
	bh=25twJZCQAOLmfTHKq7aIO9N2+JmPU2P1RgZBJEWzrBY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HXtv2sFMC/wW3tSZ6cR2DEJIX02oqdakifmWLLHhYKEBnssKAu6BflO2DFzbbVwi5
	 SVJC2R+WdMg+JTO+ElHDEnQnnQpjbsguwqYHolc5P2do2bq9skH/6XJnNiSGGiuaiD
	 P19XQSqnYO3f+NS6+r/5o3bYbbDFK/onQc202qWQ=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OFtEOS3270569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 10:55:15 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 10:55:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 10:55:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OFtEdE562625;
	Fri, 24 Oct 2025 10:55:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9E63913F52E; Fri, 24 Oct 2025 10:55:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
Date: Fri, 24 Oct 2025 10:55:14 -0500
Message-ID: <20251024155514.3524771-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251024155356.19234-1-reatmon@ti.com>
References: <20251024155356.19234-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 15:55:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19172

meta-ti / na / 20251024155356.19234-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v2] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 24 Oct 2025 10:53:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 01dce1a41f3f821d31c8513e95f25bd7580b6589

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510240100
- Commit SHA: 6b9a2b322512ab94e67ef36249b6df2633b29b2d

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




