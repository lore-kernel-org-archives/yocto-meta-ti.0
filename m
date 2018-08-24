Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6EA4FE0074B; Fri, 24 Aug 2018 13:21:09 -0700 (PDT)
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
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B99D6E0043F
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 13:21:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7OKL8L6073170
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 15:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535142068;
	bh=i8wKsNU3ndEWMBSuUoKuaq5Q1b+ShFYEAuk7lHUFz6I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hnkG9z6LBi0FFunHXmqr3J4Nzvdrl5LSfi1vZDUlEvRUrbZV76tCaa07/+7K8IdRk
	hOg2USOnkkyqa1TftJTigAhv5VMpHaeC8VQege3AisD3xGmh1qfTS4nk1hnYHV95fP
	NlAG84YwB1Asoxd8Ab1ZXLRJnDPVkcXUi0SbUGc0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OKL7tP009500
	for <meta-ti@yoctoproject.org>; Fri, 24 Aug 2018 15:21:07 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 24 Aug 2018 15:21:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 24 Aug 2018 15:21:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7OKL77M030389;
	Fri, 24 Aug 2018 15:21:07 -0500
Date: Fri, 24 Aug 2018 16:20:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20180824202014.GC9228@beryl>
References: <1534972730-13639-1-git-send-email-sam.nelson@ti.com>
	<20180822225012.GM29422@beryl>
	<517a413655f74fe1b30c8a3ac2044258@ti.com>
	<20180823160412.GP29422@beryl>
	<086f20d586f043bbb6aa57697b9b0470@ti.com>
MIME-Version: 1.0
In-Reply-To: <086f20d586f043bbb6aa57697b9b0470@ti.com>
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
X-List-Received-Date: Fri, 24 Aug 2018 20:21:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 23, 2018 at 03:23:57PM -0400, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, August 23, 2018 12:04 PM
> > To: Nelson, Sam
> > Cc: meta-ti@yoctoproject.org; Zhang, Hao
> > Subject: Re: [meta-ti] [rocko][PATCH] ti-pdk: Add tool chain dependencies for
> > am65xx platform
> > 
> > On Wed, Aug 22, 2018 at 07:14:16PM -0400, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Wednesday, August 22, 2018 6:50 PM
> > > > To: Nelson, Sam
> > > > Cc: meta-ti@yoctoproject.org; Zhang, Hao
> > > > Subject: Re: [meta-ti] [rocko][PATCH] ti-pdk: Add tool chain dependencies
> > for
> > > > am65xx platform
> > > >
> > > > On Wed, Aug 22, 2018 at 05:18:50PM -0400, Sam Nelson wrote:
> > > > > Adds the dependency on toolchain needed for A53 and R5 cores
> > > > >
> > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > ---
> > > > >  classes/ti-pdk.bbclass | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> > > > > index 7ad6205..f0d14a7 100644
> > > > > --- a/classes/ti-pdk.bbclass
> > > > > +++ b/classes/ti-pdk.bbclass
> > > > > @@ -9,6 +9,8 @@ DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
> > > > >  DEPENDS_remove_ti33x = "ti-cgt6x-native"
> > > > >  DEPENDS_remove_ti43x = "ti-cgt6x-native"
> > > > >  DEPENDS_append_omapl1 = " ti-cgt-arm-native"
> > > > > +DEPENDS_remove_am65xx-evm = "gcc-arm-none-eabi-native ti-cgt6x-
> > > > native"
> > > >
> > > > Will gcc-arm-none-eabi-native recipe be removed?
> > >
> > > My understanding is gcc-arm-none-eabi-native will still be used for A15.
> > 
> > That's strange, because both armv7 and armv8 versions of baremetal Linaro
> > gcc
> > were added by Hao recently...
> 
> Checked with Hao to confirm.
> Looks like we cannot use baremetal gcc linaro for a15 currently.  
> (we may move to use baremetal gcc linaro later)
> So this patch has to stay in the current form for now.

Ok, sounds good, thanks. Please don't forget to clean it up later.


> > > > > +DEPENDS_append_am65xx-evm = " ti-cgt-arm-native gcc-linaro-
> > baremetal-
> > > > aarch64-native"
> > > > >
> > > > >  S = "${WORKDIR}/git"
> > > > >  B = "${WORKDIR}/build"
> > > > > @@ -42,6 +44,8 @@ export TOOLCHAIN_PATH_M4 =
> > > > "${M4_TOOLCHAIN_INSTALL_DIR}"
> > > > >  export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> > > > >  export C6X_GEN_INSTALL_PATH =
> > > > "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > > > >  export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
> > > > > +export TOOLCHAIN_PATH_GCC_ARCH64 =
> > > > "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
> > > > > +export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> > > > >
> > > > >  export ROOTDIR = "${B}"
> > > > >  export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti

