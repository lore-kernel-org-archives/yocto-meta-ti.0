Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.557.1625018985131711730
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 19:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jv5O3zvw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15U29eHE010651;
	Tue, 29 Jun 2021 21:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625018980;
	bh=j3jYS2JitlOcZrm4uFG9hnEGsIkVWmTsowHJashOmjQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jv5O3zvwCAOXfDJAIOUNXohuRVH0XJjh9PtIoJZm92TRqFcSKcfDAimpAoIaMBbPk
	 u7HL4yrIyGU8zbjBjCm3z8kUM2IS+Em6EgLu8DQz6MGBGooJKF4WhASUHp44XZPkz7
	 uDKn1OhpiEwal97aQw+6W8avMxja1vTMEvNqs3Y0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15U29eXT023921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 21:09:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 21:09:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 21:09:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15U29eqm013195;
	Tue, 29 Jun 2021 21:09:40 -0500
Date: Tue, 29 Jun 2021 21:09:39 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>,
        Tom Rini
	<trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-sci-fw: k3-image-gen: Revert SPL address change for mainline
Message-ID: <20210630020939.uoi6j2ns6fsesvir@waffle>
References: <20210629203630.28915-1-nm@ti.com>
 <20210630000938.GA1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210630000938.GA1528@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 20:09-20210629, Denys Dmytriyenko wrote:
> On Tue, Jun 29, 2021 at 03:36:30PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> > Commit 02a2433c ("ti-sci-fw: Update image gen to latest") switched to a
> > newer commit in k3-image-gen that also picked up TISCI firmware release,
> > However, does include a change where the SPL address changed.
> > 
> > This switch in address has been queued for upstream in a future release
> > (v5.14 + u-boot 2021.10) and current mainline formal tags do not support
> > this address change. As a result, we have a broken AM64x mainline
> > support.
> > 
> > Revert this specific change from k3-image-gen for mainline alone for
> > now.
> > 
> > NOTE: This uses ARAGO_BRAND=mainline which is NOT accurate for meta-ti
> > which is distro independent, hence without appropriate changes while
> > using alternate distros, this change will not take effect.
> 
> Right, this flag is Arago Distro specific and it won't do anything for 
> people using meta-ti directly. Hopefully this can be fixed properly very 
> soon and this hack removed.

Yes, this is temporary - at least for one u-boot and kernel window :(

> One more cleaner approach would be to have a separate "mainline" branch 
> for k3-image-gen repo, where you have the correct address and mainline 
> recipe using it - that way it will work for meta-ti by itself...

> Another cleaner solution could be to pass SBL_LOADADDR from the recipe 
> itself to override the one weakly-assigned in the Makefile...

Honestly, I am really hoping this entire k3-image-gen stuff gets
into u-boot as buildman based solution and we should get rid of this
recipe. But, I dont have a clear timeframe for that yet.

I am hoping this is an aberration and should'nt be made as a standard
/ legitimate option by making a valid -mainline recipe or formalize a
framework to provide specific override option- hence the attempt to
engineer it as little as possible.

Let me know if we have a strong opinion on this, and I can try to
respin this.

> Meanwhile, I would suggest weakly-definint ARAGO_BRAND in the recipe, 
> as otherwise the variable will be undefined and may break parsing, i.e. 
> "undefined behavior":
> ARAGO_BRAND ?= ""

Yes, this definitely makes sense.

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
