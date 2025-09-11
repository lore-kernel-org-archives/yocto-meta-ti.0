Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A484CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 20:45:27 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.29.1757623526276374616
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jMy+5pK5;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BKjNgu373238;
	Thu, 11 Sep 2025 15:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757623523; i=@ti.com;
	bh=k1HPE6qaRG8L4v9V2NVtaMmBu+PfpwNBQQ2Dblg98pA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jMy+5pK55EIG8GfaVWWVTZhSEfSsQn1vF4w/nrY0eCMf9p/WcEmyJe7PkO96ruKg2
	 t0+7rPAPSkS/XffUo1snk64+5dam5UTCKVWtR6Xlzk4avm3N14v17WDyytQeOW+mj9
	 qR3WttFxhnXuavrRBW+uoQdxl9vK+onJZTWNfs70=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BKjNtR2252133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 15:45:23 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 15:45:22 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 15:45:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BKjN0d1511253;
	Thu, 11 Sep 2025 15:45:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0622413F52C; Thu, 11 Sep 2025 15:45:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509111148
Date: Thu, 11 Sep 2025 15:45:22 -0500
Message-ID: <20250911204523.1062129-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250911204318.3955706-1-lcpdbld@list.ti.com>
References: <20250911204318.3955706-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 20:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18996

meta-ti / na / 20250911204318.3955706-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509111148
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509111148. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509111148
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 11 Sep 2025 15:43:18 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cd266ffe3032a97f5daaefbade4497ba7db15897

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: meta-ti-bsp: wic: Add a new GRUB config for ti platforms
- Commit SHA: 72dd3f4788ad8d3bff53c939eb0c2f7f258a6fcc

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




