Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BD1CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:40:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.41018.1761590417388814608
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 11:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SVa/3Ez2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RIeGSx2486409
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761590416; i=@ti.com;
	bh=Ldfnnb8yx3TR3Z/IW9G5GMqj7U5yGHRcJxe4AxZ0Tiw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SVa/3Ez2QhJ6AoTZaazhger2AnVFMscG1Xivv/59ARknzNNfJnuPUI0wDwN2L+3eY
	 d+5LvaUt40bF0DZc/SChzwr39yoxDgIE7PAcqMbAGIkyNiAHBz52bJPdkzpq7rzUfQ
	 zBEcHhoIqvemPbbtGBVK6wVPKekgDK5IUcJLg974=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RIeG0g1838033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:40:16 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 13:40:16 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 13:40:16 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RIeGUC4148968;
	Mon, 27 Oct 2025 13:40:16 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6E6341801A0; Mon, 27 Oct 2025 13:40:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Sabeeh Khan <sabeeh-khan@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH] meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.0.323
Date: Mon, 27 Oct 2025 13:40:16 -0500
Message-ID: <20251027184016.3710106-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251027183914.3955321-1-sabeeh-khan@ti.com>
References: <20251027183914.3955321-1-sabeeh-khan@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 18:40:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19185

meta-ti / na / 20251027183914.3955321-1-sabeeh-khan

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [scarthgap][PATCH] meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.0.323
    WARN: Commit message should not include directory path to recipe: meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.0.323.
              meta-ti-extras: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [scarthgap][PATCH] meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.0.323
- Submitter: From: Sabeeh Khan <sabeeh-khan@ti.com>
- Date: Date: Mon, 27 Oct 2025 13:39:14 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 012593d3d163f049c74d338f2ad142a6cc39c078

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: machine: Include MCSPI overlay for am62p and am62 LP
- Commit SHA: b5523559e61116526f4594ea44a7eef1a16a7b45

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    WARN: Include file should reference ${BPN}: optee-os-ti-version.inc (GUARD-3)
        meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend:2
            OPTEE_TI_VERSION:ti-soc = "optee-os-ti-version.inc"
    
    
    Code Summary
    ============
    
    GUARD-3
    -------------------------------------------
      The guard file should be named the same as the bbappend.  Feel free
      to use ${BPN} to make it easier.




