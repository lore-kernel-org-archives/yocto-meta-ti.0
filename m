Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC041CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 20:05:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4667.1756325118436070945
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Aug 2025 13:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fVNQvT2O;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RK5GN91822269;
	Wed, 27 Aug 2025 15:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756325116; i=@ti.com;
	bh=i9Vs2v2tiVdUhCXKy2wDnjJQxaqCCGx3A4H8GMBcGXM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fVNQvT2OYkUv82qnko9/iQwsqEiPQ9L6wfigrOpkmY3/ujSslCnT/Esqu8Q7GlcaK
	 82z8jzwU+MmwgnDDIxFTwr26UR3O4x7Rz4HHmBdbvOSZcB/Rp/AT6ouaHsap4Lut9x
	 MbYlkWsKbS+DfOP2HODCivTK2c+aGANPD1vSkL/c=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RK5Gkl2942306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 27 Aug 2025 15:05:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 15:05:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 15:05:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RK5GCa3623830;
	Wed, 27 Aug 2025 15:05:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 24A44180193; Wed, 27 Aug 2025 15:05:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508271122
Date: Wed, 27 Aug 2025 15:05:16 -0500
Message-ID: <20250827200516.3467028-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250827200031.3477210-1-lcpdbld@list.ti.com>
References: <20250827200031.3477210-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 27 Aug 2025 20:05:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18974

meta-ti / na / 20250827200031.3477210-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508271122
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 27 Aug 2025 15:00:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ebef0a25aa1d2ac69133bddae5663bf048881b63

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: conf: machine: Include merged device trees in the list of generated dtbs
- Commit SHA: 17b6b9d666bd1dbf852a939fbf33a462abfc8d86

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




