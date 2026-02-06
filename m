Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94867EE20A1
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 13:12:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11200.1770383519831905880
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B5C840CD7;
	Fri,  6 Feb 2026 13:11:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AriLJpHizdbk; Fri,  6 Feb 2026 13:11:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ACEBC40CC3;
	Fri,  6 Feb 2026 13:11:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 630221785A9; Fri,  6 Feb 2026 08:11:50 -0500 (EST)
Date: Fri, 6 Feb 2026 08:11:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: PRC Automation <prc@list.ti.com>, meta-ti@lists.yoctoproject.org,
	Ryan Eatmon <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>,
	Shiva Tripathi <s-tripathi1@ti.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
Message-ID: <20260206131150.GC11121@denix.org>
References: <20260206054157.1848713-1-m-chawdhry@ti.com>
 <20260206054531.686299-1-prc@list.ti.com>
 <00e7d88a-944e-4d3d-964c-6016b7c8b258@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e7d88a-944e-4d3d-964c-6016b7c8b258@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 13:12:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19471

On Fri, Feb 06, 2026 at 11:27:07AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> 
> 
> On 2/6/2026 11:15 AM, PRC Automation wrote:
> >meta-ti / na / 20260206054157.1848713-1-m-chawdhry
> >
> >PRC Results: FAIL
> >
> >=========================================================
> >   check-yocto-patches: PASS
> >=========================================================
> >Patches
> >----------------------------------------
> >All patches passed
> >
> >
> >
> >=========================================================
> >   apply-yocto-patch: FAIL
> >=========================================================
> >scarthgap
> >=====================
> >Summary:
> >- Patch Series: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
> >- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
> >-From: Prasanth Babu Mantena <p-mantena@ti.com>
> >- Date: Date: Fri, 6 Feb 2026 11:11:57 +0530
> >-Date: Mon, 3 Nov 2025 12:42:57 +0530
> >- Num Patches: 1
> >- Mailing List (public inbox) Commit SHA: 4867c4a16703065551b17b5c96f88a0c7091114b
> >
> >Applied to:
> >- Repository: lcpd-prc-meta-ti
> >- Base Branch: scarthgap-wip
> >- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> >- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601300920
> >- Commit SHA: 5258ee2f903d8f1e0cbcb9d01488d08b57314009
> >
> >Patches
> >----------------------------------------
> >All patches applied
> >
> >master
> >=====================
> >Summary:
> >- Patch Series: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
> >- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
> >-From: Prasanth Babu Mantena <p-mantena@ti.com>
> >- Date: Date: Fri, 6 Feb 2026 11:11:57 +0530
> >-Date: Mon, 3 Nov 2025 12:42:57 +0530
> >- Num Patches: 1
> >- Mailing List (public inbox) Commit SHA: 4867c4a16703065551b17b5c96f88a0c7091114b
> >
> >Applied to:
> >- Repository: lcpd-prc-meta-ti
> >- Base Branch: master
> >- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> >- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602051800
> >- Commit SHA: c79f7b833ee92e42f5dcfd6a33a47a9399d1c575
> >
> >Patches
> >----------------------------------------
> >FAIL - [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
> >     error: patch failed: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc:1
> >     error: meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc: patch does not apply
> >     error: patch failed: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc:1
> >     error: meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc: patch does not apply
> >     error: patch failed: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc:1
> >     error: meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc: patch does not apply
> >     Applying: optee: Update to 4.9.0 tag
> >     Patch failed at 0001 optee: Update to 4.9.0 tag
> >
> 
> Ahh, I haven't checked it for master.. thought it would trivially
> apply there, made it on base branch of scarthgap (commit
> 5258ee2f903d8f1e0cbcb9d01488d08b57314009)..

FTR, meta-arm/master recently got updated to 4.9.0, so meta-ti should just 
match/remove SRCREVs.

-- 
Denys

