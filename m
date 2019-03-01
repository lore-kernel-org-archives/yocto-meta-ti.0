Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACAA4E00994; Fri,  1 Mar 2019 09:20:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E344E0053F
	for <meta-ti@yoctoproject.org>; Fri,  1 Mar 2019 09:20:50 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x21HKngq064097;
	Fri, 1 Mar 2019 11:20:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551460849;
	bh=FImmMbeBCdXKS5fSBfeNFWBzg7BljIr8kEaS4xoqh3I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=y9f1zbHXaQ1533Ginb8bweTAswNpGZgImQfpV4jh1WsjvoLOAbDmF6w24Xm6a0nTP
	9n2lavOzCn8aSL1blftZb4OBJYaWl2mmyeOfUrFvExa80Au4zFwv/lzmrQ2CFsSbDJ
	UVGDVbXDFA1SrFpPxwT8httl18DjTIHBkIQvSuJg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x21HKnD9050477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Mar 2019 11:20:49 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 1 Mar 2019 11:20:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 1 Mar 2019 11:20:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x21HKmIs021201;
	Fri, 1 Mar 2019 11:20:48 -0600
Date: Fri, 1 Mar 2019 12:20:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190301172047.GS5250@beryl>
References: <1550866849-31173-1-git-send-email-j-stiffler@ti.com>
	<CAMKF1soxpPcwDzfzeKL1aKPwOt9eOo+h180EGqDtoVp-Pyd5bQ@mail.gmail.com>
	<20190301150727.GR5250@beryl>
	<CAMKF1spepGOyi3O1rznabFYivcsUdxL1+u4hZYjMfH_3n1NvLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spepGOyi3O1rznabFYivcsUdxL1+u4hZYjMfH_3n1NvLw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2] gcc-arm-none-eabi: extend to nativesdk class
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
X-List-Received-Date: Fri, 01 Mar 2019 17:20:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 01, 2019 at 07:59:38AM -0800, Khem Raj wrote:
> On Fri, Mar 1, 2019 at 7:07 AM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Fri, Mar 01, 2019 at 06:54:50AM -0800, Khem Raj wrote:
> > > On Fri, Feb 22, 2019 at 12:33 PM Jacob Stiffler <j-stiffler@ti.com> wrote:
> > > >
> > > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > > ---
> > > > v2 changes:
> > > > * Use COMPATIBLE_HOST instead of anonymous python to limit to x86_64-linux
> > > >
> > > >  ..._6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >  rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} (83%)
> > > >
> > > > diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > > similarity index 83%
> > > > rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> > > > rename to recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > > index 1140f27..ae3d1d7 100644
> > > > --- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> > > > +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > > @@ -3,7 +3,6 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > >
> > > >  LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
> > > >
> > > > -inherit native
> > >
> > > this means it is also available as target package now.
> >
> > Yes, hence COMPATIBLE_HOST below. Also see earlier discussion on v1 of the
> > patch for other considered options.
> >
> >
> > > >  require recipes-ti/includes/ti-paths.inc
> > > >
> > > >  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
> > > > @@ -13,6 +12,9 @@ SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6
> > > >
> > > >  S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
> > > >
> > > > +# only x86_64 is supported
> > > > +COMPATIBLE_HOST = "x86_64.*-linux"
> > > > +
> > >
> > > fails on qemux86-64
> > > https://errors.yoctoproject.org/Errors/Details/230712/
> >
> > The errors are from package_qa and seem to be due to binary nature of the
> > package and RDEPENDS between libraries.
> >
> >
> > > you have to limit its availability to native and nativesdk only.
> >
> > While intension of COMPATIBLE_HOST was to limit it to native and nativesdk
> > indirectly, x86-64 target does also match. And theoretically it can be a valid
> > use case for this bare-metal Arm cross-compile toolchain... I wonder if simply
> > skipping "file-rdeps" QA checks would be fine.
> >
> 
> If you dont intend to support this usecase, then I would suggest to
> keep it limited to what you intend to support. Either way this is a
> regression which should be fixed

https://lists.yoctoproject.org/pipermail/meta-ti/2019-March/011597.html


> > > >  do_install() {
> > > >      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> > > >      cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> > > > @@ -20,4 +22,6 @@ do_install() {
> > > >
> > > >  FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
> > > >
> > > > -INSANE_SKIP_${PN} = "already-stripped"
> > > > +INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
> > > > +
> > > > +BBCLASSEXTEND = "native nativesdk"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

