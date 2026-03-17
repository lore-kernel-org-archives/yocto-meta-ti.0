Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173EDFF6E9B
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:53:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2066.1773788001632807945
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F404140C56;
	Tue, 17 Mar 2026 22:53:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPog7xBFWjwA; Tue, 17 Mar 2026 22:53:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B270C40A20;
	Tue, 17 Mar 2026 22:53:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E23E17A3CD; Tue, 17 Mar 2026 18:53:17 -0400 (EDT)
Date: Tue, 17 Mar 2026 18:53:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] layer.conf: Update the layers to
 support wrynose
Message-ID: <20260317225317.GL11121@denix.org>
References: <20260317223608.1973962-1-reatmon@ti.com>
 <20260317224047.3892383-1-prc@list.ti.com>
 <20260317224210.GK11121@denix.org>
 <47cc1b8d-8b38-46fc-b395-cfce064a1aef@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47cc1b8d-8b38-46fc-b395-cfce064a1aef@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19756

On Tue, Mar 17, 2026 at 05:48:58PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 3/17/2026 5:42 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 17, 2026 at 05:40:47PM -0500, PRC Automation via lists.yoctoproject.org wrote:
> >>meta-ti / na / 20260317223608.1973962-1-reatmon
> >>
> >>PRC Results: FAIL
> >>
> >>=========================================================
> >>   check-yocto-patches: PASS
> >>=========================================================
> >>Patches
> >>----------------------------------------
> >>All patches passed
> >>
> >>
> >>
> >>=========================================================
> >>   apply-yocto-patch: PASS
> >>=========================================================
> >>master
> >>=====================
> >>Summary:
> >>- Patch Series: [meta-ti][master][PATCH] layer.conf: Update the layers to support wrynose
> >>- Submitter: From: Ryan Eatmon <reatmon@ti.com>
> >>- Date: Date: Tue, 17 Mar 2026 17:36:08 -0500
> >>- Num Patches: 1
> >>- Mailing List (public inbox) Commit SHA: 4dd012ad40961d0b94f9fc5a7a2e2e80ac191885
> >>
> >>Applied to:
> >>- Repository: lcpd-prc-meta-ti
> >>- Base Branch: master-wip
> >>- Commit Author: Ryan Eatmon <reatmon@ti.com>
> >>- Commit Subject: layer.conf: Update the layers to support wrynose
> >>- Commit SHA: 0dde7f7b5ac2b93fabf28f6de445fa5d2067ee93
> >>
> >>Patches
> >>----------------------------------------
> >>All patches applied
> >>
> >>
> >>
> >>=========================================================
> >>   check-yocto-repo: PASS
> >>=========================================================
> >>master
> >>=====================
> >>PASS
> >>
> >>
> >>
> >>=========================================================
> >>   yocto-check-layers: FAIL
> >>=========================================================
> >>master - FAIL
> >>=====================
> >>ERROR: Layer meta-arm is not compatible with the core layer which only
> >>supports these series: wrynose (layer is compatible with whinlatter)
> >
> >And we are going to suffer from other layers catching up for a while...
> 
> I'm locking down oe-layersetup temporarily...

+1

This will help with CI/CD. I'll try to communicate this to others when I can.

-- 
Denys

