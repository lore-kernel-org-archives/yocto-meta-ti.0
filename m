Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.12842.1634663007708056701
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 10:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 073D040BE9;
	Tue, 19 Oct 2021 17:03:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5B-1MU12aGH; Tue, 19 Oct 2021 17:03:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D71C7406B5;
	Tue, 19 Oct 2021 17:03:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3DA61174698; Tue, 19 Oct 2021 13:03:22 -0400 (EDT)
Date: Tue, 19 Oct 2021 13:03:22 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: vigneshr@ti.com
Cc: yogeshs@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] [meta-ti][master/dunfell][PATCH v2] ti-linux-fw: Support common inc for all firmware
Message-ID: <20211019170322.GM10132@denix.org>
References: <20211019131951.18210-1-yogeshs@ti.com>
 <727cc120-9113-42d6-f1dd-d4d9f31d9b6f@ti.com>
MIME-Version: 1.0
In-Reply-To: <727cc120-9113-42d6-f1dd-d4d9f31d9b6f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 19, 2021 at 08:46:29PM +0530, Vignesh Raghavendra via lists.yoctoproject.org wrote:
> 
> 
> On 10/19/21 6:49 PM, Yogesh Siraswar via lists.yoctoproject.org wrote:
> > Change to support common INC for all firmware
> > This will help with:
> > 1) Eliminating requirement to change multiple recipes for firmware
> > update
> > 2) This will help support AUTOREV
> > 
> > Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> > ---
> 
> [...]
> > diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> > index d447df33..246b872e 100644
> > --- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> > +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> > @@ -1,9 +1,9 @@
> >  SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
> >  
> > -LICENSE = "TI-TFL"
> > -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> > +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >  
> > -PV = "08.00.00.20"
> > +PV = "${PRUETH_FW_AM65x_SR2_VERSION}"
> 
> Should be
> 
> 	PV = "${PRUETH_FW_AM65x_VERSION}"

Also, "AM65x" lower case "x" here


> > +PR = "${INC_PR}.0"
> >  
> >  CLEANBROKEN = "1"
> >  
> [...]
> > diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > similarity index 75%
> > rename from recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> > rename to recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > index 9ce9f6c8..a910af2c 100644
> > --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> > +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > @@ -4,9 +4,18 @@ LICENSE = "TI-TFL"
> >  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >  
> >  PV = "2021.05"
> > -INC_PR = "r0"
> > -# RTOS firmware version
> > +INC_PR = "r1"
> > +
> > +# Firmware versions
> >  CORESDK_RTOS_VERSION = "08.00.00.32"
> > +SERDES_FW_VERSION = "3.3.0.2c"
> > +NETCP_SA_FW_VERSION = "1.0.0"
> > +NETCP_PA_FW_VERSION = "3.0.2.3"
> > +QMSS_PDSP_FW_VERSION = "1.0.0.9"
> > +PRUETH_FW_AM65X_VERSION = "08.00.00.20"
> 
> ^^^

AM65X has uppercase X here. better to be consistent.


> > +PRUETH_FW_AM65x_SR2_VERSION = "02.02.09.03"
> > +GOODIX_FW_VERSION = "1.0.0.0"
> > +CADENCE_MHDP_FW_VERSION = "1.2.17"
> >  
> >  SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
> >  BRANCH ?= "ti-linux-firmware"
> 
> [...]
> Regards
> Vignesh
