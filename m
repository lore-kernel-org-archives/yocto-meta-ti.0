Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D283ECA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:15:14 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.582.1755792912866518986
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 09:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hJAvANq5;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LGFCs0050533
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 11:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755792912; i=@ti.com;
	bh=a9uFGo3l/iqwoF3tUpeM7jqa5GUfy0UHrjSbIk6oJ1o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hJAvANq5ouvvvMkkweT4HBl7yXDIGfqo6MX/9zUNSz/6y+FJHzdUiIH2G7ARcQts9
	 70A8MGN65VjXxRjHTs9zaOYZWmdcqAGll3hmQWy34ifUSJdaacwLQHA7EP4tKy0E9T
	 KCPJKnfCyR/krpuzTxQKyuvyy9BGaaEnNyOJv5DY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LGFCWx2248111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 11:15:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 11:15:11 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 11:15:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LGFBAq2625064;
	Thu, 21 Aug 2025 11:15:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9B5C913F536; Thu, 21 Aug 2025 11:15:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-ti][master][PATCH v2] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
Date: Thu, 21 Aug 2025 11:15:11 -0500
Message-ID: <20250821161511.2202128-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821160944.845890-1-t-lannynd@ti.com>
References: <20250821160944.845890-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 16:15:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18954

meta-ti / na / 20250821160944.845890-1-t-lannynd

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
- Patch Series: [meta-ti][master][PATCH v2] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Thu, 21 Aug 2025 11:09:44 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d61d95cd5fb1eaf5701735e40824b9fa77fccc2b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Bryan Brattlof <bb@ti.com>
- Commit Subject: conf: machine: add optee-os into am62lxx-evm builds
- Commit SHA: 5f428c58a52b4c08139809327ba223212f986a86

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    ERROR: You must have a SUMMARY = "...". (SUMMARY-1)
        meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
    
    
    Code Summary
    ============
    
    SUMMARY-1
    -------------------------------------------
      All recipes require a SUMMARY.




