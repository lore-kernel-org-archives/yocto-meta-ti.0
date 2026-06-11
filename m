Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54EDCD98CF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:03:16 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49677.1781193792977192572
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 09:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=ZFwTLdsr;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BA4342271D;
	Thu, 11 Jun 2026 18:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781193790;
	bh=4/jc2B9H7+T4C7DAM9BRJMHTc417Ul/3gaK1PvU5g0U=; h=From:To:Subject;
	b=ZFwTLdsrT67XAc2o1hzSXPgcvKcga5y7KoZaIDFOM8CiJngEBTvCh4+5YNINdfZwS
	 xhuRbpeOpNRrOwE5Z4Nsprlt5gJ/QiG+cgiLozwptewMISwnHJQjdfnrLmMKrO+lKo
	 vOOol9ayeAwV5ZlvQnmGxnYp4Oi4KY2gsCv+1buUyzY/lDABVWES8DBbATGK69Hula
	 sBoA2F1rJDeizOCEIroSt35zXoR0dJz7yhWg6oI35Nn4PkSmr0AhfqGtxUeREOzet6
	 dQQMZHZ1vN+qr5uKHaDKeZBliNhNdvhcJa3wuUvoFxBFEqpr4kx0hdRLEaavEpK9eh
	 WQAalnnziqxJg==
Date: Thu, 11 Jun 2026 18:03:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Denys Dmytriyenko <denis@denix.org>
Cc: s-tripathi1@ti.com, meta-ti@lists.yoctoproject.org, reatmon@ti.com,
	praneeth@ti.com, vishalm@ti.com, k-malarvizhi@ti.com,
	francesco@dolcini.it
Subject: Re: [meta-ti][master][PATCH] optee-ftpm: Update commit to include TA
 panic fix
Message-ID: <20260611160306.GA8508@francesco-nb>
References: <20260611152123.2494690-1-s-tripathi1@ti.com>
 <20260611154631.GQ23325@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611154631.GQ23325@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 16:03:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20030

On Thu, Jun 11, 2026 at 11:46:31AM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 11, 2026 at 08:51:23PM +0530, Shiva Tripathi via lists.yoctoproject.org wrote:
> > Bump to commit e3b1e426 which includes graceful degradation of fTPM TA
> > when RPMB storage is unavailable, preventing TA panic and memory dumps.
> 
> Is it also needed for wrynose?

As Toradex, yes, we would need it also in wrynose.

Francesco


