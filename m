Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3969.1581384739768018683
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 17:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kmAq2Cqh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B1WIjp081944
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2020 19:32:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581384739;
	bh=Gj2jdUmCL7g0n54J/+FwHAueHu7nS91I5TwjryG9ZJs=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=kmAq2Cqh/u3ycILNDB8np6kefLR1LOeFuR/XAjW+yXm630M5Tz9D4mAIQ73Eq2O+d
	 xtG8NEIBc7RITh3++9ar9asWOixVIAzbwxWV3z0Q5oYUICnd4ofCHPkoPko2Lo6ooT
	 R1oXlz87l6GIQypYgUpAmXmrsAULY+Q3ojtiAOTM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01B1WIQX048753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2020 19:32:18 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 19:32:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 19:32:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B1WITP063318;
	Mon, 10 Feb 2020 19:32:18 -0600
Date: Mon, 10 Feb 2020 20:32:18 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Message-ID: <20200211013218.GE17543@beryl>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
 <20200203224309.19843-3-m-radhakrishnan2@ti.com>
 <15F005E2E8B9A198.9169@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15F005E2E8B9A198.9169@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping

On Mon, Feb 03, 2020 at 05:45:39PM -0500, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> On Mon, Feb 03, 2020 at 05:43:09PM -0500, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> > From: Mahesh Radhakrishnan <a0875154@UDA0875154>
> > 
> > The license as such has not changed, but moved to a License file which
> > is not expected to change frequently
> > ---
> >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > index 6a3d79c3..1f65149c 100644
> > --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > @@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.sciclient"
> >  PE = "1"
> >  
> >  LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> > +LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=c05dd6e04691b3339c447a7a21691705"
> 
> Do you want to drop beginline/endline since the entire file is the license now?
> 
> 
> >  COMPATIBLE_MACHINE = "k3"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> > -PR = "r0"
> > +PR = "r1"
> >  
> >  DEPENDS_append = " osal-rtos common-csl-ip-rtos"
> >  
> > -- 
> > 2.17.1
> > 
> 
> > 
> 

> 

