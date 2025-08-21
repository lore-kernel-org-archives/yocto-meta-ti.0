Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E6BCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:45:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.844.1755791122387219552
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 08:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f+QAGjme;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LFjLL0517658
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 10:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755791121; i=@ti.com;
	bh=1q/CohoTF7hbrNauM2QqjXnZg84U9xBkyKHfa+DBjbI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f+QAGjme3YBGzfFyIOCybaYZfjPkJn2brb1xhFcmDoSY8G7JipTfKmMqAkAiIVee8
	 Hlke1zjS5tr5cnNugPLX8+tWOG8l39B43OYHp/VayzcyXn/MH/Y067HZXi/1dH7dVQ
	 o95U/33uHfLWCqfOujVWwmaNjrNjmR1zWnDdwIV0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LFjLKH2053099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 10:45:21 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 10:45:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 10:45:21 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LFjLLa2100920;
	Thu, 21 Aug 2025 10:45:21 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 3F5D9142E33; Thu, 21 Aug 2025 10:45:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
        <detheridge@ti.com>, <rs@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] ti-bsp: recipes-multimedia: Add  udev rules for VPU and JPEG encoder symlinks
Date: Thu, 21 Aug 2025 10:45:21 -0500
Message-ID: <20250821154521.972682-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821154136.627184-1-t-lannynd@ti.com>
References: <20250821154136.627184-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 15:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18952

meta-ti / na / 20250821154136.627184-1-t-lannynd

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v2] ti-bsp: recipes-multimedia: Add  udev rules for VPU and JPEG encoder symlinks
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Thu, 21 Aug 2025 10:41:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6e463fae33edc258f4da8913310f70f166d9725f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202508201111
- Commit SHA: 76f78bab9b6cd7d28bf28411783acfce0d746aca

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    ERROR: You must have a SUMMARY = "...". (SUMMARY-1)
        meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
    
    
    Code Summary
    ============
    
    SUMMARY-1
    -------------------------------------------
      All recipes require a SUMMARY.




