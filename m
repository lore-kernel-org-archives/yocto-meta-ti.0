Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE7C3E00754; Thu, 27 Sep 2018 16:38:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42167E00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:38:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNcoou026807
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538091531;
	bh=vGamy3rrLDrNn0kS94jlsBVpyjIddDCAzLUQk2FN1F8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NEUFohN28HzLBFoZ4ZUqB2hsnahSQmEr8TPJE1M70xJdtK5H2m9vtq6DH09NqUkHQ
	G/YPWwrsRmXwf6aVBHg4ZFkZXgKzaVhSAllU/jesR/QvE+PysZmScz7Vfhul4yUPPG
	eUuiI17huGwWDd226TVsJ9MFd5n4WWkWUR2bJ8rQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNcoHe030215
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 18:38:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:38:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 18:38:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNco2T011096;
	Thu, 27 Sep 2018 18:38:50 -0500
Date: Thu, 27 Sep 2018 19:38:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20180927233850.GA13888@beryl>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-21-git-send-email-m-radhakrishnan2@ti.com>
	<20180927214524.GR8582@beryl>
	<9093020a82614713b6bff4433652cdad@ti.com>
MIME-Version: 1.0
In-Reply-To: <9093020a82614713b6bff4433652cdad@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v2 20/30] pcie-lld-rtos: Update to version 02.03.00.01 and added k3 support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2018 23:38:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 07:37:58PM -0400, Radhakrishnan, Mahesh wrote:
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, September 27, 2018 5:45 PM
> To: Radhakrishnan, Mahesh
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko/master][PATCH v2 20/30] pcie-lld-rtos: Update to version 02.03.00.01 and added k3 support
> 
> On Thu, Sep 27, 2018 at 04:43:19PM -0400, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >  recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> > index 1b7218a..35a0cbc 100644
> > --- a/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> > +++ b/recipes-bsp/pcie-lld/pcie-lld-rtos_git.bb
> > @@ -3,9 +3,9 @@ SUMMARY = "TI RTOS low lever driver for Peripheral Interconnect Express (PCIE)"
> >  inherit ti-pdk
> >  
> >  LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=c094db055596498ba803933936611eb2"
> > +LIC_FILES_CHKSUM = "file://pcie.h;beginline=1;endline=34;md5=566a784d78790a716d641764d5d60b74"
> 
> Why the change?
> The copyright year changed. Here is the diff

Thanks, please add a brief note in the commit log.


>  @@ -1,6 +1,6 @@
>  /*
>   *
> - * Copyright (C) 2010-2016 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010-2018 Texas Instruments Incorporated - http://www.ti.com/^M
>   *
>   *
> 
> 
> > -COMPATIBLE_MACHINE = "omap-a15|keystone|c66x"
> > +COMPATIBLE_MACHINE = "omap-a15|keystone|c66x|k3"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  
> >  PCIE_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pcie-lld.git"
> > @@ -13,16 +13,19 @@ PCIE_LLD_GIT_PROTOCOL = "git"
> >  PCIE_LLD_GIT_BRANCH = "master"
> >  PCIE_LLD_GIT_DESTSUFFIX = "git/ti/drv/pcie"
> >  
> > -# Below commit ID corresponds to "DEV.PCIE_LLD.02.02.00.13"
> > -PCIE_LLD_SRCREV = "bf8d3a22c03a5f273321c284fa1737072eca3f77"
> > +# Below commit ID corresponds to "DEV.PCIE_LLD.02.03.00.01"
> > +PCIE_LLD_SRCREV = "61759fc238600e3d5506ce86db1f6b604334edf8"
> >  
> >  BRANCH = "${PCIE_LLD_GIT_BRANCH}"
> >  SRC_URI = "${PCIE_LLD_GIT_URI};destsuffix=${PCIE_LLD_GIT_DESTSUFFIX};protocol=${PCIE_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> >  
> >  SRCREV = "${PCIE_LLD_SRCREV}"
> > -PV = "02.02.00.13"
> > +PV = "02.03.00.01"
> >  PR = "r0"
> >  
> > +DEPENDS_append_k3 = " udma-lld-rtos \
> > +"
> > +
> >  S = "${WORKDIR}/${PCIE_LLD_GIT_DESTSUFFIX}"
> >  
> >  export PDK_PCIE_ROOT_PATH ="${WORKDIR}/build"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

