Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA01CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:55:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.9618.1759413314014092362
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eEanaAz2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DtDnj2892514;
	Thu, 2 Oct 2025 08:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413313; i=@ti.com;
	bh=Ws2zsMGxoCJlRBXPzA36JPMkmrJF2Ad8uB3DvA5sc7Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eEanaAz2XmSad6I+O+eKWmgp6FZALr6RH2MPZoDOrERyp9DPICQlA+Btq8PSDXNUm
	 0qDYLKbzFpU+LbjKnS5+T8WJJf0pJSzsElCJ0xhTcKkhvpR0N4OMKUvNqSU2JPSAgw
	 0Vbr4XK5gOqg0m3KJIDwxWVLYRWiPuLY4FVG2wQY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DtD0g3643129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:55:13 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:55:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:55:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DtCJw1921019;
	Thu, 2 Oct 2025 08:55:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C1BEA1801A4; Thu,  2 Oct 2025 08:55:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH 1/2] meta-ti-bsp: vpe-tests: Remove this recipe
Date: Thu, 2 Oct 2025 08:55:12 -0500
Message-ID: <20251002135512.122494-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251002135212.1820365-1-afd@ti.com>
References: <20251002135212.1820365-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19098

meta-ti / na / 20251002135212.1820365-1-afd

PRC Results: PASS

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
- Patch Series: [meta-ti][scarthgap][PATCH 1/2] meta-ti-bsp: vpe-tests: Remove this recipe
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:52:11 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: af1552aa964c5afd4a149e8a079d7a68a3e25bea

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: MD Danish Anwar <danishanwar@ti.com>
- Commit Subject: meta-ti-bsp: Add pruprp-fw for AM64xx
- Commit SHA: 69aaa6f1f8f608e22353d38ec6629ded743c4dec

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




