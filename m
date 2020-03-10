Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.629.1583863594599694162
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2020 11:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nX13BZYb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02AI6XqU058255
	for <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2020 13:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583863593;
	bh=zYvnfjT3STG8qLJgIKZSUAMbGbTiOO0yVEVHPsciFOY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=nX13BZYbhWRSMjGJzptisxijFbpVCjqnUFxcV988fNE4epbcVBSFikLqzaQ220Yt+
	 6PSjRQU1pIDOyyXK7bi6fByqclpuCBE7CkKsI9xHhPo7zNITvqwl9BGgKlz0WIPaxZ
	 vkJ5yaa9artG7KT1AiORyIl89+ety3nOP64kWoXw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02AI6XVB017714
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2020 13:06:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Mar 2020 13:06:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Mar 2020 13:06:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02AI6X0I030522;
	Tue, 10 Mar 2020 13:06:33 -0500
Date: Tue, 10 Mar 2020 14:06:33 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH] sciclient-rtos: SRCREV update, adding steps to generate sysfw.bin
Message-ID: <20200310180632.GX2301@beryl>
References: <20200226213750.32020-1-m-radhakrishnan2@ti.com>
 <15F75F9B6D48606D.22756@lists.yoctoproject.org>
 <15F890DA7571B9C2.27899@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15F890DA7571B9C2.27899@lists.yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping again. Any feedback?

On Mon, Mar 02, 2020 at 01:42:14PM -0500, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> Ping.
> 
> On Thu, Feb 27, 2020 at 04:28:33PM -0500, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> > On Wed, Feb 26, 2020 at 04:37:50PM -0500, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> > > ---
> > >  recipes-bsp/sciclient/sciclient-rtos_git.bb | 40 +++++++++++++++++++--
> > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > index 6a3d79c3..ca3894fa 100644
> > > --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> > > @@ -7,14 +7,15 @@ TI_PDK_COMP = "ti.drv.sciclient"
> > >  PE = "1"
> > >  
> > >  LICENSE = "BSD-3-Clause"
> > > -LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> > > +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=99d7639a81c1ba1f16fd070a928ffddb"
> > >  
> > >  COMPATIBLE_MACHINE = "k3"
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >  
> > > -PR = "r0"
> > > +PR = "r1"
> > >  
> > >  DEPENDS_append = " osal-rtos common-csl-ip-rtos"
> > > +DEPENDS_append_k3 = " openssl-native"
> > 
> > Isn't it redundant since the recipe is only compatible with "k3"?
> > 
> > 
> > >  # Build with make instead of XDC
> > >  TI_PDK_XDCMAKE = "0"
> > > @@ -60,6 +61,41 @@ do_compile() {
> > >      tar -cf sciclient.tar --exclude='*.tar' ./*
> > >  }
> > >  
> > > +
> > > +do_compile_prepend_am65xx-hs-evm() {
> > > +
> > > +    cd ${SCICLIENT_ROOTPATH}
> > > +
> > > +    # Saving the GP firmware to a different GP name
> > > +    cp ${CP_ARGS} ./soc/V0/sysfw.bin ./soc/V0/sysfw-gp.bin
> > > +    
> > > +    cd ${SCICLIENT_ROOTPATH}/tools
> > > +    # Create the .bin file for HS
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x-hs ${PDK_INSTALL_DIR}/packages
> > > +    cd -
> > > +}
> > > +
> > > +do_compile_prepend_am65xx-evm() {
> > > +
> > > +    cd ${SCICLIENT_ROOTPATH}/tools
> > > +
> > > +    # Create the .bin file for GP, PG1
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x ${PDK_INSTALL_DIR}/packages
> > > +    # Create the .bin file for GP, PG2
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x_pg2 ${PDK_INSTALL_DIR}/packages
> > > +    
> > > +    cd -
> > > +}
> > > +
> > > +
> > > +do_compile_prepend_j7-evm() {
> > > +
> > > +    cd ${SCICLIENT_ROOTPATH}/tools
> > > +    # Create the .bin file for GP
> > > +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e ${PDK_INSTALL_DIR}/packages
> > > +    cd -
> > > +}
> > > +
> > >  do_install() {
> > >      cd ${SCICLIENT_ROOTPATH}
> > >      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
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

