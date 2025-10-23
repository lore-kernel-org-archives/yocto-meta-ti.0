Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0615DCCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:35:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1291.1761251712824049739
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 13:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xkiYnttv;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NKZC06617942;
	Thu, 23 Oct 2025 15:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761251712; i=@ti.com;
	bh=yFveJXYkPL05bOf2euSQte2v/C7tOo8DPErUvtbY67g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xkiYnttvm9yeYuIyTrO7kHRNZLu6thlXGX0rsylNTqOzidE4zEOVchgt6000oQ/o+
	 N04cefBOPKt+4z/jRi3nUOYFXuUix83O7BfSyEnxq6Xi2Qw8M+qlFTUeQVh12/SK8v
	 DJ1cDq3mS5AfHfIGHRYM+u+EtVQV3qQQLdTWeMlA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NKZBHC3384287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 23 Oct 2025 15:35:11 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 23
 Oct 2025 15:35:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 15:35:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NKZBYX3437623;
	Thu, 23 Oct 2025 15:35:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7C8E616A265; Thu, 23 Oct 2025 15:35:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
Date: Thu, 23 Oct 2025 15:35:11 -0500
Message-ID: <20251023203511.3550877-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251023202947.26604-1-denis@denix.org>
References: <20251023202947.26604-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 20:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19164

meta-ti / na / 20251023202947.26604-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [scarthgap][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
    WARN: Commit message does not include file/recipe name: u-boot-bb.org: upgrade 2025.07 -> 2025.10. (COMMIT-MESSAGE-2)
        patch
WARN - [scarthgap][PATCH 2/2] linux-bb.org: update to 6.12.43
    WARN: Commit message does not include file/recipe name: linux-bb.org: update to 6.12.43. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [scarthgap][PATCH 1/2] u-boot-bb.org: upgrade 2025.07 -> 2025.10
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 23 Oct 2025 16:29:46 -0400
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 35d2b8c61c4fa76eb645143e16cdb20de9c97d93

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: conf: am335x-evm and am437x-evm: Bump up max_leb_cnt
- Commit SHA: e56e34653dac9181449669db60a616912e0f6fb5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




