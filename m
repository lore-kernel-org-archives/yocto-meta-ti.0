Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBDEEED61A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 16:42:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25897.1694796175714405249
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 09:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C23340C50;
	Fri, 15 Sep 2023 16:42:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0H4eSgoNRgd; Fri, 15 Sep 2023 16:42:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D42E040C46;
	Fri, 15 Sep 2023 16:42:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E4AF7163CAB; Fri, 15 Sep 2023 12:42:45 -0400 (EDT)
Date: Fri, 15 Sep 2023 12:42:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: "Balagopalakrishnan, Anand" <anandb@ti.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
	"Eatmon, Ryan" <reatmon@ti.com>,
	"Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
	"Gupta, Gyan" <g-gupta@ti.com>,
	"Khasim, Syed Mohammed" <khasim@ti.com>,
	"Pothukuchi, Vijay" <vijayp@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Message-ID: <20230915164245.GB7013@denix.org>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org>
 <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
 <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Sep 2023 16:42:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16988

On Fri, Sep 15, 2023 at 11:17:11AM -0500, Bajjuri, Praneeth wrote:
> 
> 
> On 9/14/2023 8:47 PM, Balagopalakrishnan, Anand wrote:
> >Hi Denys,
> >
> >This is only needed for v7 platforms like AM3 / AM4 and possibly AM57x also. CONFIG_PREEMPT is enabled by default on arm64 platforms like AM65x.
> >
> >Praneeth will send a kernel patch for TI kernel. This meta-ti patch is meant to unblock anyone who wants to enable SGX drive in the meanwhile.
> 
> 
> This patch can be abandoned .
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.1.y-cicd&id=e025e31126fff01ded59d901af916abe87646ca6
> enables CONFIG_PREEMPT

Praneeth,

Slight offtopic, but I was wondering what are the rules now for changes like 
this modifying upstream multi_v7_defconfig directly, vs. going into one of the  
config fragments in kernel/configs/?

-- 
Denys

