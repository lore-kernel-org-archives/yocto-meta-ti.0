Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.608.1625019090713518821
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 19:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SXqHKyo3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15U2BN9E011280;
	Tue, 29 Jun 2021 21:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625019083;
	bh=MGqjCGq1Kd0IQEQ4td3A6GHM9H+WrPXSwtthqQXHtIs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SXqHKyo3k+eeOyFQK4GAVtJEbZiarRZjCLG7LQXKrMZPXUtbtsoM06Aau+yS7FqXD
	 lvbmafqKgbtZPT96jymJ0TbEAvThTJOQstA7Q5NyIWS8WuUOi+2mJICjzVC9DPLVAs
	 BUCywww7qQmaK1hlSmrBIXrXUUwRIo8ajzIpAKFo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15U2BN9I120778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 21:11:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 21:11:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 21:11:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15U2BNLm001077;
	Tue, 29 Jun 2021 21:11:23 -0500
Date: Tue, 29 Jun 2021 21:11:23 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>,
        Tom Rini
	<trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to v5.13
Message-ID: <20210630021123.eadbiychvnjxfygo@coexist>
References: <20210629233703.26088-1-nm@ti.com>
 <20210630003055.GD1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210630003055.GD1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 20:30-20210629, Denys Dmytriyenko wrote:
> On Tue, Jun 29, 2021 at 06:37:03PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> > And lets work with the latest kernel and while at it bump the system up
> > to latest ti-upstream-tools repo to get:
> > * AM65x SR1.0 overlay support
> > * EFI configuration to allow for the eventual support
> > * Few more cleanups for new architectures that have popped in.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> 
> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
> 
> 
> > ---
> >  recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
> > index 6770adcae3f7..5d043da7fee1 100644
> > --- a/recipes-kernel/linux/linux-ti-mainline_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
> > @@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
> >  BRANCH = "master"
> >  TOOLS_BRANCH = "master"
> >  
> > -# 5.12 Mainline version
> > -SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
> > -PV = "5.12+git${SRCPV}"
> > +# 5.13 Mainline version
> > +SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
> > +PV = "5.13+git${SRCPV}"
> 
> BTW, the "+git${SRCPV}" part is to append the specific SRCREV or git SHA of 
> the kernel you are building to the resulting package version. That might be 
> useful in tracking the kernel binary on the target to a specific SHA, as well 
> as with binary feeds.
> 
> But if you only use official releases, you might want to drop it, as you'd 
> trust that SRCREV you specify for 5.13 always corresponds to the release SHA 
> in Linus' tree :) Just makes the package name and version much shorter...
> 

hehe, the history of v5.12-rc1-dontuse comes to mind for now. I think we
can leave as is for now.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
