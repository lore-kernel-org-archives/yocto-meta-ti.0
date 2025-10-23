Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3406CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 20:30:19 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1183.1761251414856806114
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 13:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lCY2eJ+c;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NKUDtV610592;
	Thu, 23 Oct 2025 15:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761251413; i=@ti.com;
	bh=5Cah0LtxNsAFDqtL9c29EwRrWPf3XYW36MeCxvFlDI8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lCY2eJ+c1B1WFlUVRx8PwE4Yer6l3u2XwqryTEfnLryQO4GanE7LA2xr1H89ahh6e
	 9P87iowpgei++wL9oYT5fLPkn2tb9Rt20LOVaStbrfs10UButsFJD+txxnExu4cJV6
	 3GMQs6gSJc0sNCGTgNCn5zQ0/+6x2fFBCXjsp7Gw=
Received: from DFLE203.ent.ti.com (dfle203.ent.ti.com [10.64.6.61])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NKUDpk3382136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 15:30:13 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 15:30:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 15:30:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NKUCUu3432613;
	Thu, 23 Oct 2025 15:30:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DF9D313F52E; Thu, 23 Oct 2025 15:30:12 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] conf: machine: Include MCSPI overlay for am62p and am62 LP
Date: Thu, 23 Oct 2025 15:30:12 -0500
Message-ID: <20251023203012.3550051-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251023202542.1162172-1-jm@ti.com>
References: <20251023202542.1162172-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 20:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19163

meta-ti / na / 20251023202542.1162172-1-jm

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH v2] conf: machine: Include MCSPI overlay for am62p and am62 LP
    WARN: Commit message does not include file/recipe name: conf: machine: Include MCSPI overlay for am62p and am62 LP. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: machine: Include MCSPI overlay for am62p and am62 LP.
              conf:
              machine: (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v2] conf: machine: Include MCSPI overlay for am62p and am62 LP
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Thu, 23 Oct 2025 15:25:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b6355ef8f3cc31ce554c2cb218555c08e695727e

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




