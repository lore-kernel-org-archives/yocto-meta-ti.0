Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D7CC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 04:48:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3045.1648529326476928693
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 21:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 049FD40C1E;
	Tue, 29 Mar 2022 04:48:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeB3WmXsc5s9; Tue, 29 Mar 2022 04:48:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8B8440952;
	Tue, 29 Mar 2022 04:48:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F2B6A1748B6; Tue, 29 Mar 2022 00:48:39 -0400 (EDT)
Date: Tue, 29 Mar 2022 00:48:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Darren Etheridge <detheridge@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH 1/4] meta-ti: rename j7-evm to
 j721e-evm
Message-ID: <20220329044839.GM23554@denix.org>
References: <20220325184151.16940-1-afd@ti.com>
 <20220325192319.GF23554@denix.org>
 <7a5d0d19-6c27-cb67-dcad-acc7ff5c9aec@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a5d0d19-6c27-cb67-dcad-acc7ff5c9aec@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 04:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14564

On Fri, Mar 25, 2022 at 02:38:55PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> On 3/25/22 2:23 PM, Denys Dmytriyenko wrote:
> >On Fri, Mar 25, 2022 at 01:41:48PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> >>In many places we use "j7" the family when we should be using a
> >>specific SoC or EVM and vice-versa. For instance when including
> >>graphics drivers we add for all "j7" family, but what we really
> >>want is only for some specific j7 SoC.
> >>
> >>First step in untangling this is to make it clear that there is
> >>no SoC called j7. There is a SoC called j721e with a j721e-evm.
> >>
> >>Fix up this naming here.
> >
> >Heh, I was actually thinking of finally making such change myself lately! :)
> >
> >My main concern was about breaking downstream users of meta-ti who builds on
> >top of j7-evm platform. But it is probably a good time to get it into master
> >now, as recent layer restructuring already required downstream changes and
> >adjustments.
> 
> There are also some external docs on this that need updated but I
> can take a lead on that.
> 
> 
> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >
> >I looked over the changes in both patchsets and they seem fine.
> >I'm going to do a quick test locally though.
> 
> Thanks, that would be good, I have to admit my setup is not all the
> way back together yet so my testing here was very limited..

Ok, I was finally able to build all K3 platforms and couple legacy platforms 
with these patches aplied locally - everything seems fine!

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

