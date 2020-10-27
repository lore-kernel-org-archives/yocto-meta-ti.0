Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.8352.1603766521688431573
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 19:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iVxrsAsj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2g0mP095643;
	Mon, 26 Oct 2020 21:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603766520;
	bh=aWfUGtFaq1Zy3gIspJ1IFIm23gN8h/yGMcdIFmLxGY0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iVxrsAsjU+DKbz/BoSZ6LLirzIIK/9L20LKR+9rPKid4uJ0JebninozamHr7pRhhe
	 1s+YWtQkFGa+n3wreH4VH+1If3Kmab8ksjzi2j455VISgF1T79MS4Ug6i0sHP7Q1B2
	 dCslW3hDIrM6H/EJ3QhotCo4ISVVz5KAtpVTAcvM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2g0VM070204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2020 21:42:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 21:41:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 21:41:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2fxHJ060660;
	Mon, 26 Oct 2020 21:41:59 -0500
Date: Mon, 26 Oct 2020 22:41:59 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <s-anna@ti.com>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 2/2] ti-rpmsg-char: Mark these recipes to be TI SOC specific
Message-ID: <20201027024159.GP19741@beryl>
References: <20201025065934.3308920-1-raj.khem@gmail.com>
 <20201025065934.3308920-2-raj.khem@gmail.com>
 <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
MIME-Version: 1.0
In-Reply-To: <03f490f1-ff1a-b3fc-6511-00b8d707eb6e@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 26, 2020 at 09:19:29PM -0500, Suman Anna via lists.yoctoproject.org wrote:
> Hi Raj,
> 
> On 10/25/20 1:59 AM, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-ti/ipc/ti-rpmsg-char.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> > index b41e68eb..d08031cb 100644
> > --- a/recipes-ti/ipc/ti-rpmsg-char.inc
> > +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> > @@ -13,3 +13,6 @@ SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
> >  PV = "0.1.0+git${SRCPV}"
> >  
> >  S = "${WORKDIR}/git"
> > +
> > +COMPATIBLE_HOST ?= "null"
> > +COMPATIBLE_HOST_ti-soc = "(.*)"
> > 
> 
> This looks ok, but I am trying to understand why this is needed in general (am
> still getting familiar with OE). Aren't the recipes processed only on
> packagegroups that include them?

Suman,

Some people like Khem do world builds - kind of like building kernel with 
"allyesconfig" to see any conflicts or incompatibilities...

-- 
Denys
