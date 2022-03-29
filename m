Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3ADC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 04:50:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.2880.1648529456276309850
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 21:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B429540C1E;
	Tue, 29 Mar 2022 04:50:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JhuVFc7Xcck; Tue, 29 Mar 2022 04:50:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A3D440952;
	Tue, 29 Mar 2022 04:50:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 59A181748B6; Tue, 29 Mar 2022 00:50:51 -0400 (EDT)
Date: Tue, 29 Mar 2022 00:50:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 4/4] ti-sgx-ddk-um: only the am65xx
 member of the k3 family is supported
Message-ID: <20220329045051.GQ23554@denix.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325184151.16940-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325184151.16940-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 04:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14568

On Fri, Mar 25, 2022 at 01:41:51PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> The AM65xx is the only member of the K3 family with an SGX GPU.
> Be specific here to avoid confusion.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>

