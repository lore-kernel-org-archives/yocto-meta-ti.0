Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972DACCD1AF
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 20:05:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.22768.1761077117185767409
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Oct 2025 13:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sI/GYETY;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59LK5EA7092973;
	Tue, 21 Oct 2025 15:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761077114; i=@ti.com;
	bh=2Ub/5U7goFz/L41GZwMx2O4HeDwq6v2JPiFDnLvNsKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sI/GYETYmLJzhDUg/banQ30D0fxxwlUvgEIw6pclIsqd+06zo7hqmxqrXtIrKIz1u
	 A3015VD7npBZjq6JhoHk21andhP609qnHvlqoLMXvS33CBVuDHsMg1Kdonq/+VGpwT
	 ok/DspiSsAUG4wnfhm2kRn2p9RkPME2VTFEtE8fg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59LK5EbN1389536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 21 Oct 2025 15:05:14 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 21
 Oct 2025 15:05:14 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 15:05:14 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59LK5ECI2876492;
	Tue, 21 Oct 2025 15:05:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1A5F513F538; Tue, 21 Oct 2025 15:05:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
Date: Tue, 21 Oct 2025 15:05:14 -0500
Message-ID: <20251021200514.2190304-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251021200247.52202-1-denis@denix.org>
References: <20251021200247.52202-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Oct 2025 20:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19150

meta-ti / na / 20251021200247.52202-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
    ERROR: Invalid branch specifier: "patch". (META-3)
        patch:30
            Subject: [patch][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
    
    WARN: Commit message does not include file/recipe name: u-boot-bb.org: upgrade 2025.07 -> 2025.10. (COMMIT-MESSAGE-2)
        patch
WARN - [master][PATCH 2/2] linux-bb.org: update to 6.12.43
    WARN: Commit message does not include file/recipe name: linux-bb.org: update to 6.12.43. (COMMIT-MESSAGE-2)
        patch




