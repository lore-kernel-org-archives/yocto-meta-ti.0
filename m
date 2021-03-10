Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.381.1615396950278763743
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 09:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FyYtQ6+K;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6602C38C03CD
	for <meta-ti@yoctoproject.org>; Wed, 10 Mar 2021 17:22:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AHMOA8107151;
	Wed, 10 Mar 2021 11:22:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615396944;
	bh=VqfMjI5KIuZiUVU3XnX8R6yBAO7VLqzLLfqavBFXvRg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FyYtQ6+KYB63Ymq2vnG7VNPHwA9ttXCy1MIwEieNb6OwxNvvMFuAiYQtyxJuz4+tn
	 8Uo4UbIAx0PyV48iObMoOiWfrP53j/ivN1Hire801kHuz97+tWV6w/VA/i6YqP3tdA
	 MdnmVUb7wj228GlmDgxF7ZPVQ0oIrDcFfK/wtvfQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AHMO3u088801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Mar 2021 11:22:24 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 10
 Mar 2021 11:22:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 10 Mar 2021 11:22:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AHMMCB131051;
	Wed, 10 Mar 2021 11:22:22 -0600
Date: Wed, 10 Mar 2021 11:22:22 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <nikhil.nd@ti.com>, <meta-ti@yoctoproject.org>, <praneeth@ti.com>,
        <lokeshvutla@ti.com>, <kishon@ti.com>, <nsekhar@ti.com>,
        <hnagalla@ti.com>, <saurabhnarang@ti.com>
Subject: Re: [meta-ti][dunfell PATCH v2] recipes-bsp: wl18xx-fw: update SRCREV to latest
Message-ID: <20210310172222.qkssgid2arel3aky@sapling>
References: <20210310161337.31072-1-nikhil.nd@ti.com>
 <20210310171144.GW4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210310171144.GW4892@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 12:11-20210310, Denys Dmytriyenko wrote:
> On Wed, Mar 10, 2021 at 09:43:37PM +0530, Nikhil Devshatwar via lists.yoctoproject.org wrote:
> > Update the wl18xx firmware recipe to latest version 8.9.0.0.86
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Reviewed-by: Denys Dmytriyenko <denis@denix.org>
> 
> 
> > ---
> > 
> > Notes:
> >     Changes from v1:
> >     * Update the version in the recipe filename
> > 
> >  .../wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb}  | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >  rename recipes-bsp/wl18xx-fw/{wl18xx-fw_8.7.3.bb => wl18xx-fw_8.9.0.0.86.bb} (86%)
> > 
> > diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > similarity index 86%
> > rename from recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > rename to recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > index a52ec898..50b6c297 100644
> > --- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> > +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> > @@ -7,8 +7,7 @@ SRC_URI = " \
> >  	file://0001-Add-Makefile-to-install-firmware-files.patch \
> >  "

Just curious, is there a periodic upgrade plan in upstream [1] - last commit is
[2] ?


[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/ti-connectivity/wl18xx-fw-4.bin?id=d5f9eea5a251d43412b07f5295d03e97b89ac4a5
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
