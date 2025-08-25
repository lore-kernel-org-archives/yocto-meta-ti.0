Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAC8CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 06:42:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.33278.1756104173058143051
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 24 Aug 2025 23:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RQdO3Uxu;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57P6gqWb1232740
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 01:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756104172; i=@ti.com;
	bh=SCk3Bu2Vf8nqbDXOlHPHWjsxBP6eQXjR5B2Efm3I+Gw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RQdO3UxufTascsW/asR0yonQrptJHZmPHQuC+rDbP3JrMa4eBNeWTHi3Tco8ZF3l4
	 djCIBxAJ5hWETUkQzK7HK5T95oV20BBBOLCnG7NHMOIoplROJ+KTPl0J9oQ6cCrHCM
	 Nd3kzVodfrTRbsKbdDLV3K0zJXTDSNlD92nV/v+w=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57P6gqD0983754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 01:42:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 01:42:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 01:42:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57P6gqXR3172893;
	Mon, 25 Aug 2025 01:42:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0A85913F52F; Mon, 25 Aug 2025 01:42:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] conf: machine: Include merged device trees in the list of generated dtbs
Date: Mon, 25 Aug 2025 01:42:52 -0500
Message-ID: <20250825064252.2091919-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250825063449.3639186-1-j-sahu@ti.com>
References: <20250825063449.3639186-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Aug 2025 06:42:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18965

meta-ti / na / 20250825063449.3639186-1-j-sahu

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
- Patch Series: [meta-ti][scarthgap/master][PATCH] conf: machine: Include merged device trees in the list of generated dtbs
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Mon, 25 Aug 2025 12:04:49 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2b41b4713cd3e3abd2aa54d86790abd02e1d5b30

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Commit SHA: c2b58f991f2175f7b0bfa14a2bce042bfe4610c5

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-ti][scarthgap/master][PATCH] conf: machine: Include merged device trees in the list of generated dtbs
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Mon, 25 Aug 2025 12:04:49 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2b41b4713cd3e3abd2aa54d86790abd02e1d5b30

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
- Commit SHA: 6059a084f6c8ae0aa1d76abb922949c8bb6dbb09

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS

master
=====================
PASS




