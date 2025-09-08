Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5394CAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.10351.1757328913756467937
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 03:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UZoqb9IR;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588AtDIG3850588
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757328913; i=@ti.com;
	bh=MMnGbCKwLZH1BCCegrVekL9obEiY7Tp2xvHikIXP980=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UZoqb9IRt97jQqiHgtOxK1VS3DaPZ24cKrFex26liFQPp7uq577uq7NcmG3PZ0DiO
	 M4uM+w2QwFy7KBNZBHgPqoI3giPpfg+i9Q9E18OkTC2np/9IJBccSnqE8MiWVKC5JT
	 bR8HrTVp2xsBnz0Ftj9lGmFsCmbfXB+S6Sz+1Jd8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588AtDQn2911197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 8 Sep 2025 05:55:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 05:55:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 05:55:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588AtCi7481573;
	Mon, 8 Sep 2025 05:55:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DC7D513F529; Mon,  8 Sep 2025 05:55:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>
Subject: Re: [master][PATCH 0/1] Add recipes to build initramfs image
Date: Mon, 8 Sep 2025 05:55:12 -0500
Message-ID: <20250908105512.3270129-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250908105315.19583-1-m-shah@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 08 Sep 2025 10:55:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18982

meta-ti / na / 20250908105315.19583-1-m-shah

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
- Patch Series: [master][PATCH 0/1] Add recipes to build initramfs image
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Mon, 8 Sep 2025 16:23:13 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c607a2ea4fc8808bb3da64e42d635284f0ee6602

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: optee-ftpm: Add TI version override for ftpm
- Commit SHA: 106d575e5879911420c5ad4d486bda3e8164f4c9

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




