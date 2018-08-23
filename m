Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9D66E00718; Thu, 23 Aug 2018 09:05:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68251E003C1
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 09:05:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NG58st021439
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 11:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535040308;
	bh=CntybEKJr/0y67D9Jsk3sZWT3P6PFpI+dd8+7zsC/5U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=b+0JJIbBAKcDYeQqs7a1g7ZEBjo+h0l+hK3plHEco0xReK4D78v2ZXmhHBRi6ak/M
	YwT4IfowC1rIrIw0JT+OQoObLha/frDNdPr9yZnQw4mHlqzGBsaOJez/M1tHevmWVF
	XRei/4CgrXAeLHdgF4ri2SqE7JSAgUD89qOpxgFk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NG58K3028996
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 11:05:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 11:05:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 11:05:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NG57OM012222;
	Thu, 23 Aug 2018 11:05:07 -0500
Date: Thu, 23 Aug 2018 12:04:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20180823160412.GP29422@beryl>
References: <1534972730-13639-1-git-send-email-sam.nelson@ti.com>
	<20180822225012.GM29422@beryl>
	<517a413655f74fe1b30c8a3ac2044258@ti.com>
MIME-Version: 1.0
In-Reply-To: <517a413655f74fe1b30c8a3ac2044258@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko][PATCH] ti-pdk: Add tool chain dependencies for am65xx platform
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
X-List-Received-Date: Thu, 23 Aug 2018 16:05:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2018 at 07:14:16PM -0400, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, August 22, 2018 6:50 PM
> > To: Nelson, Sam
> > Cc: meta-ti@yoctoproject.org; Zhang, Hao
> > Subject: Re: [meta-ti] [rocko][PATCH] ti-pdk: Add tool chain dependencies for
> > am65xx platform
> > 
> > On Wed, Aug 22, 2018 at 05:18:50PM -0400, Sam Nelson wrote:
> > > Adds the dependency on toolchain needed for A53 and R5 cores
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  classes/ti-pdk.bbclass | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > > index 7ad6205..f0d14a7 100644
> > > --- a/classes/ti-pdk.bbclass
> > > +++ b/classes/ti-pdk.bbclass
> > > @@ -9,6 +9,8 @@ DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> > >  DEPENDS_remove_ti33x = "ti-cgt6x-native"
> > >  DEPENDS_remove_ti43x = "ti-cgt6x-native"
> > >  DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> > > +DEPENDS_remove_am65xx-evm = "gcc-arm-none-eabi-native ti-cgt6x-
> > native"
> > 
> > Will gcc-arm-none-eabi-native recipe be removed?
> 
> My understanding is gcc-arm-none-eabi-native will still be used for A15.

That's strange, because both armv7 and armv8 versions of baremetal Linaro gcc 
were added by Hao recently...


> > > +DEPENDS_append_am65xx-evm = " ti-cgt-arm-native gcc-linaro-baremetal-
> > aarch64-native"
> > >
> > >  S = "${WORKDIR}/git"
> > >  B = "${WORKDIR}/build"
> > > @@ -42,6 +44,8 @@ export TOOLCHAIN_PATH_M4 =
> > "${M4_TOOLCHAIN_INSTALL_DIR}"
> > >  export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> > >  export C6X_GEN_INSTALL_PATH =
> > "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > >  export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
> > > +export TOOLCHAIN_PATH_GCC_ARCH64 =
> > "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
> > > +export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> > >
> > >  export ROOTDIR = "${B}"
> > >  export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

