Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97C98E0095C; Fri,  1 Mar 2019 08:00:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85284E00BE8
	for <meta-ti@yoctoproject.org>; Fri,  1 Mar 2019 08:00:05 -0800 (PST)
Received: by mail-qt1-f194.google.com with SMTP id y4so28263026qtc.10
	for <meta-ti@yoctoproject.org>; Fri, 01 Mar 2019 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bIAEwvE8oMHtyt7GOug7fUSX1ObTODtK6scfCi/Hd/k=;
	b=tJIsW+ZHg6H1a7XIIMe71mArUjof4xR2N8kJETc32syRJEcE4DwHWTFys+IAMD8zAb
	AENSgSjCg5ij1y3CVYEArdAjbEa5jPNJyvqpurxoPVCGHaL/YluxobYylq9FKQz0mbEy
	Z6abUDWt8vODz2wZEaxjLb/Gco8X2LM7JiR+FWj0eiE4nhLRxcg5FkNsVv1xVseh+0Jz
	wslQnHw15sM53/RLeQQHRuyIaeGoJKeGYVtRmcpJLKS/s76EyjULaP0Gl1czWHLzcaGB
	9Vx7P3wCs1ry2Oj6FNfM//v2td2Bu+IxYAWigz/C49rYwacseK3oSUnIp+p7cLYwxHeT
	T81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bIAEwvE8oMHtyt7GOug7fUSX1ObTODtK6scfCi/Hd/k=;
	b=B7Dww57S0vH7w80qfsozt45x/DaztUnFAAMPIDfxzoTuP7fMyjByLgxLRH9KUstaRi
	6LiB6NtzATYMng2cLx/R3dkseiqsC3k7uvIzLvjHunl3YisjzkspU5p2XCrF9jV5t3DQ
	RQqKaxEsIKrGtifqaPaa2Hky4Iqm/CceTYAZxDF1R2yjF8VnZ4Ac40u0avmHbp/9YtG7
	vrhOPrLBq9lbOunDDXQVQotNjW/Txn1Ks/xJ8RDskZzsuD1e/YZD7LBUDkn9gCzApaql
	cSd8d/Zwha6DZE8fkE2nN8ShVVT8YXT7t3JRhq7lMdEp2E2ivCYmqL63YLcYIMy5b8O1
	lGTA==
X-Gm-Message-State: APjAAAX5iRzsNMjbhI4r/WQEAI6xKtje9BpsxQHmY/kyk6YqMZtPYaZe
	Szh2j6XpUTzpKJhJjbEvZ2SHXqQhxPtANGw/bOc=
X-Google-Smtp-Source: APXvYqz48J3c1lBAAXzG1Ts3SpVEZEw++ieaBGyyvLdOW0Hxj6/w95nHMuXI/uGPE0i6oxp+Sd7lu0N4AJt9QvJ22FU=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr4245149qvq.224.1551456004815; 
	Fri, 01 Mar 2019 08:00:04 -0800 (PST)
MIME-Version: 1.0
References: <1550866849-31173-1-git-send-email-j-stiffler@ti.com>
	<CAMKF1soxpPcwDzfzeKL1aKPwOt9eOo+h180EGqDtoVp-Pyd5bQ@mail.gmail.com>
	<20190301150727.GR5250@beryl>
In-Reply-To: <20190301150727.GR5250@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 07:59:38 -0800
Message-ID: <CAMKF1spepGOyi3O1rznabFYivcsUdxL1+u4hZYjMfH_3n1NvLw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Fri, 01 Mar 2019 16:00:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 1, 2019 at 7:07 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Fri, Mar 01, 2019 at 06:54:50AM -0800, Khem Raj wrote:
> > On Fri, Feb 22, 2019 at 12:33 PM Jacob Stiffler <j-stiffler@ti.com> wrote:
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > > v2 changes:
> > > * Use COMPATIBLE_HOST instead of anonymous python to limit to x86_64-linux
> > >
> > >  ..._6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >  rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} (83%)
> > >
> > > diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > similarity index 83%
> > > rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> > > rename to recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > index 1140f27..ae3d1d7 100644
> > > --- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> > > +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > @@ -3,7 +3,6 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > >
> > >  LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
> > >
> > > -inherit native
> >
> > this means it is also available as target package now.
>
> Yes, hence COMPATIBLE_HOST below. Also see earlier discussion on v1 of the
> patch for other considered options.
>
>
> > >  require recipes-ti/includes/ti-paths.inc
> > >
> > >  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
> > > @@ -13,6 +12,9 @@ SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6
> > >
> > >  S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
> > >
> > > +# only x86_64 is supported
> > > +COMPATIBLE_HOST = "x86_64.*-linux"
> > > +
> >
> > fails on qemux86-64
> > https://errors.yoctoproject.org/Errors/Details/230712/
>
> The errors are from package_qa and seem to be due to binary nature of the
> package and RDEPENDS between libraries.
>
>
> > you have to limit its availability to native and nativesdk only.
>
> While intension of COMPATIBLE_HOST was to limit it to native and nativesdk
> indirectly, x86-64 target does also match. And theoretically it can be a valid
> use case for this bare-metal Arm cross-compile toolchain... I wonder if simply
> skipping "file-rdeps" QA checks would be fine.
>

If you dont intend to support this usecase, then I would suggest to
keep it limited to what you intend to support. Either way this is a
regression which should be fixed

>
> > >  do_install() {
> > >      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> > >      cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> > > @@ -20,4 +22,6 @@ do_install() {
> > >
> > >  FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
> > >
> > > -INSANE_SKIP_${PN} = "already-stripped"
> > > +INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

