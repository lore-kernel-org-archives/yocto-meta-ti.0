Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045A7CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:55:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1668.1755795318988673489
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 09:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zIklOPoG;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LGtHxt056062;
	Thu, 21 Aug 2025 11:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755795317; i=@ti.com;
	bh=phB27wn7XdkoZ2k4U8Ee3KeDVaiWdj+HFThpwTk+uQ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zIklOPoGb9fewQjRrK29vDikRBeM3tjefVsoHroPxlVHfRtYfvGtuIjUakIzn7wEB
	 XmpJuovDb6lVcmG//Fy+Oy4sJZ6uMYH+8voadeUcdl4eQE2O8UXSgdbssK7aWc+0H5
	 v6WmC+DOvae2bJB7M+//IiqvLFgP/hMajOp9GHO8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LGtHhH2266693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 11:55:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 11:55:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 11:55:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LGtHGZ2178117;
	Thu, 21 Aug 2025 11:55:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 084791801A2; Thu, 21 Aug 2025 11:55:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-ipc-examples-linux: Add missing SUMMARY
Date: Thu, 21 Aug 2025 11:55:17 -0500
Message-ID: <20250821165517.2206932-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250821165204.27550-1-reatmon@ti.com>
References: <20250821165204.27550-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 16:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18957

meta-ti / na / 20250821165204.27550-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-ipc-examples-linux: Add missing SUMMARY
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 21 Aug 2025 11:52:04 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 15ac18c4451da3321074c358bc1023d041be1e9f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Bryan Brattlof <bb@ti.com>
- Commit Subject: conf: machine: add optee-os into am62lxx-evm builds
- Commit SHA: 5f428c58a52b4c08139809327ba223212f986a86

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-ipc-examples-linux: Add missing SUMMARY
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 21 Aug 2025 11:52:04 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 15ac18c4451da3321074c358bc1023d041be1e9f

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
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

scarthgap
=====================
PASS




