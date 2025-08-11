Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD68CA0EC1
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:10:34 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.43494.1754899825036929625
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 01:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GoSH0vo2;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57B8AN0w1067681;
	Mon, 11 Aug 2025 03:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754899823; i=@ti.com;
	bh=l7uovZ851CdNDBHvp2bdgNs4ZLHokyT9s6+pWCtf/wQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GoSH0vo2W8LIZsU8oqWrtjMvl7hKOPMOmdOGcUQZZDWVJ4GlGImlgGS+c0ujasq3m
	 nGUw7OjQQIBD6QA94iHD1ey53Kkn6g7RnoModsGjvme4yCDo5RnXKV/tWakk6nrD/d
	 vrkecUcGAhpl37hLnx9tPU6Vn4RxLRYAlRU3mmeM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57B8ANhX3573103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 03:10:23 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 03:10:23 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 03:10:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57B8ANZp1041419;
	Mon, 11 Aug 2025 03:10:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 03854180194; Mon, 11 Aug 2025 03:10:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508110100
Date: Mon, 11 Aug 2025 03:10:22 -0500
Message-ID: <20250811081022.1254053-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250811080631.3425949-1-lcpdbld@list.ti.com>
References: <20250811080631.3425949-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 11 Aug 2025 08:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18925

meta-ti / na / 20250811080631.3425949-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202508110100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 11 Aug 2025 03:06:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 429743160931eff3c8b88278efe5723e3890d4b9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: meta-beagle: conf/machine rework all DTB lists
- Commit SHA: 3b1f0aa728fb48bd03fdcb89e7137d5bcea7e2d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




