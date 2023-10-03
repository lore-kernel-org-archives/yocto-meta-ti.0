Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F82E7AD46
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:40:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.108150.1696340395769219274
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 06:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 039A140CBA;
	Tue,  3 Oct 2023 13:39:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7tY_ir-875F; Tue,  3 Oct 2023 13:39:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8778940CB8;
	Tue,  3 Oct 2023 13:39:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D107C163CC9; Tue,  3 Oct 2023 09:39:52 -0400 (EDT)
Date: Tue, 3 Oct 2023 09:39:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Boettger, Heiko" <heiko.boettger@karlstorz.com>
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Unable to mirror meta-ti due to branch-name HEAD
 forbidden in git since Nov 2019
Message-ID: <20231003133952.GB26382@denix.org>
References: <AM9PR01MB841284A902CEE0B9B199666F97C4A@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR01MB841284A902CEE0B9B199666F97C4A@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Oct 2023 13:40:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17046

On Tue, Oct 03, 2023 at 09:23:13AM +0000, Boettger, Heiko wrote:
> Hi,
> 
> there was a recent change in git that doesn't allow to use `HEAD` as a 
> branch name . Is it possible to remove the branch? The ref HEAD should still 
> be there. No other repository seems to have such a branch and we currently 
> face issues mirroring the meta-ti repository where GitLab refuses to accept 
> `HEAD` as a valid branch name.
> 
> See also 
> https://docs.gitlab.com/ee/user/project/repository/branches/#error-ambiguous-head-branch-exists 
> where GitLab states that this change was introduced in git 2.16.0 (around 4 
> years ago).

meta-ti already has many official public and non-public mirrors - from 
git.yoctoproject.org, to git.ti.com, to internal bitbucket, etc.

What you are doing is a local clone or even a fork, even if you are using 
it as a local mirror for your project. I would refrain from calling it a 
mirror in public due to possible confusion.

The existing official mirrors are all push based and are always up-to-date. 
Where your copy is pull based and depends on how often and for how long 
you are going to update it.

This has happened in the past, where people would make claims in public 
that meta-ti is dead and no longer maintained, as it hasn't been updated 
in years, linking to some obscure fork on github or gitlab that they came 
across somehow...

-- 
Denys

