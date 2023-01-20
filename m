Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2262C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 23:24:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.147.1674257087368138547
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 15:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=luKmLJf/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30KNOhJY080809;
	Fri, 20 Jan 2023 17:24:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674257083;
	bh=LidVTkLbfn/pPuoHtuFO6GSXhYRCdBevtfmAnqPfgFI=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=luKmLJf/v0YMehVgAHpv3kYEN8PxjDciAP25taJLa/fzo+9JOOqoKa3YzM8R4HvnJ
	 t23NbWggFf9DosoYuVhs0SF5OlmW4lLok3SxWk9g9lxV9e+8st1u6S6fdydQVpYBG7
	 y700FMqVOfsEdZskiwX7EK8TvWhJ/7z02OQ91/m4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30KNOhfa091188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jan 2023 17:24:43 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 17:24:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 17:24:43 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30KNOgQQ112244;
	Fri, 20 Jan 2023 17:24:42 -0600
Date: Fri, 20 Jan 2023 17:24:37 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti] [master/kirkstone][PATCH]
 all: Graphics recipe overhaul
To: Denys Dmytriyenko <denis@denix.org>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <115TOR.S0E6VS3VSAUV@ti.com>
In-Reply-To: <20230120221120.GR22689@denix.org>
References: <20230119204026.1297616-1-rs@ti.com>
	<20230120182636.GP22689@denix.org> <SBSSOR.I33PHI6LU4AA@ti.com>
	<20230120221120.GR22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 23:24:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15618

On Fri, Jan 20 2023 at 05:11:20 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> Well, there are pros and cons to both approaches. And I would be more 
> inclined
> to agree with you that it is necessary to copy over the entire Mesa 
> recipes,
> if you were trying to apply patches on top of the upstream version. 
> But, you
> are completely changing SRC_URI and SRCREV anyway to point to your 
> own tree,
> so it doesn't matter very much what underlying version of the recipe 
> you start
> with. I do believe it would just work for the master with 22.2.3 
> version.
> Sure, recipes sometimes change significantly and break your bbappend, 
> but
> that's when it will be the time to consider carrying the full set of 
> older
> version, sometime in the future.
> 
> As an example, we've been carrying bbappends in meta-ti for upstream 
> optee and
> trunsted-firmware-a recipes from meta-arm - sometimes we fall behind 
> and stick
> to an older version, but sometimes we update to a newer version 
> earlier than
> upstream. That's been working for several years and quite successful 
> for the
> most part...
> 
> On the other side of the spectrum, there's ltp-ddt recipe that is 
> based on top
> of the upstream ltp recipe of a specific version. It's not exactly a 
> bbappend,
> but close enough. When upstream upgrades to a newer version, we end 
> up copying
> the specific previous version locally side-by-side. Later, when we 
> rebase
> ltp-ddt and catch up with the ltp version upstream, we can remove the
> duplicate.
> 
> In other words, *IF* we end up duplicating Mesa recipes locally, I'd 
> argue we
> should keep them unmodified and apply any modifications through 
> bbappend. If
> needed, you can make it version-specific, e.g. mesa_22.0.%.bbappend. 
> That way
> in kirkstone you only need this bbappend, but in langdale/mickledore 
> you may
> end up having a local copy of *unmodified* mesa_22.0.3.bb from 
> kirkstone along
> with this mesa_22.0.%.bbappend on top. In other words - if you 
> refrain from
> modifying the local duplicates of upstream files and keep them 
> intact, it
> would be much easier to maintain long term...

Well what do you recommend? Version pinning (through the copy in 
meta-ti) in addition to a bbappend, or just a version globed bbappend?



