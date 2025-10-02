Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C52CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:55:18 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.9620.1759413314417162601
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=r0yka7EV;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DtDnU3297076;
	Thu, 2 Oct 2025 08:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413313; i=@ti.com;
	bh=t9M8od6msn1FwxNcJNQPzNtr5dVPhX5oCg0Q2Wak21k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r0yka7EV+wuAJiPA92cRXPlnXui0N73xO0Gq16WY9MY9J9NvSk0XE0Nsd5orz3lAl
	 BX+bQ3l1fw1Y3eXph3tH+A5fvkHDD5dz7Q6g45GwrQpsswGELAZo7lR0D/DnNS3mlf
	 yEt7385e89MvwegClw37oMZo4lPBT2sJkKF1UTrs=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DtDSK1273698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 08:55:13 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 08:55:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:55:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DtCcK080232;
	Thu, 2 Oct 2025 08:55:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id ACD6E1801A4; Thu,  2 Oct 2025 08:55:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] meta-ti-bsp: vpe-tests: Remove this recipe
Date: Thu, 2 Oct 2025 08:55:12 -0500
Message-ID: <20251002135512.122451-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251002135001.1819874-1-afd@ti.com>
References: <20251002135001.1819874-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:55:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19099

meta-ti / na / 20251002135001.1819874-1-afd

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
- Patch Series: [meta-ti][master][PATCH 1/2] meta-ti-bsp: vpe-tests: Remove this recipe
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:50:00 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: d4e57fd10044c8dbad579531cd083f007fb6e632

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: MD Danish Anwar <danishanwar@ti.com>
- Commit Subject: meta-ti-bsp: Add pruprp-fw for AM64xx
- Commit SHA: b22a780fead09cdb8ce7d827560831bed2cceb27

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




