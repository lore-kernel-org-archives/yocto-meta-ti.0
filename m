Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.15342.1581972588857458544
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 12:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AC5BGVOV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HKnmHw079201
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2020 14:49:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581972588;
	bh=DBeX8WgsNQGdFpWsQb/bB5CjO1byZ/YEJiZQ6ZcCx+U=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=AC5BGVOVp/CuVCDXqXddXFJaHcuPhUbDUOgj8IkcaQPUxJ05xHe4X303Ay39mEW+e
	 QQL5KRSxcW6JPcrj7tBwfvtcntMn1xH05o8rcnuImElw6d1uHZfZa/mIQ+9uCUxY1m
	 GFG3deCeW9RnrvyioRhPqLb0gf75Mj1IE5hnBa1M=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HKnmI4099150
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Feb 2020 14:49:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 14:49:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 14:49:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HKnlsI027960;
	Mon, 17 Feb 2020 14:49:47 -0600
Date: Mon, 17 Feb 2020 15:49:47 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Message-ID: <20200217204947.GC720@beryl>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
 <20200203224309.19843-3-m-radhakrishnan2@ti.com>
 <15F005E2E8B9A198.9169@lists.yoctoproject.org>
 <15F2350AF6366026.19576@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15F2350AF6366026.19576@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping

On Mon, Feb 10, 2020 at 08:32:18PM -0500, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> Ping
> 
> On Mon, Feb 03, 2020 at 05:45:39PM -0500, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> > On Mon, Feb 03, 2020 at 05:43:09PM -0500, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> > > From: Mahesh Radhakrishnan <a0875154@UDA0875154>
> > > 
> > > The license as such has not changed, but moved to a License file which
> > > is not expected to change frequently
> > > ---
> > >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > index 6a3d79c3..1f65149c 100644
> > > --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > @@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.sciclient"
> > >  PE = "1"
> > >  
> > >  LICENSE = "BSD-3-Clause"
> > > -LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> > > +LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=c05dd6e04691b3339c447a7a21691705"
> > 
> > Do you want to drop beginline/endline since the entire file is the license now?
> > 
> > 
> > >  COMPATIBLE_MACHINE = "k3"
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  
> > > -PR = "r0"
> > > +PR = "r1"
> > >  
> > >  DEPENDS_append = " osal-rtos common-csl-ip-rtos"
> > >  
> > > -- 
> > > 2.17.1
> > > 
> > 
> > > 
> > 
> 
> > 
> 

> 

