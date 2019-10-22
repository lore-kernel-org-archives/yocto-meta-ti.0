Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7B9CE0097C; Mon, 21 Oct 2019 18:04:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 333ECE0083C
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2019 18:03:59 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9M13xto121101;
	Mon, 21 Oct 2019 20:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571706239;
	bh=kt+ufLE1s+E968g9xKm0n5Xt3KkOvkCoBzMwakPIRHg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=At/Hz3xqHVQb4t16uGEDgmstP3TgTw0TtXsqP1xmlXbGGSReAgjnVCjK7O2hUHfJ1
	YD+CUAWNsQ99ni6GNzqt6X5jOnRBM5I3FVBSNN1b0O4eKJeqPcz7wi1aKGcULa69rD
	LvYM1AIpdFZv81VCVRhCHDh1NxCmpdG6izEvBLuE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9M13iFi064042
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2019 20:03:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 21 Oct 2019 20:03:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 21 Oct 2019 20:03:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9M13h3S085826;
	Mon, 21 Oct 2019 20:03:43 -0500
Date: Mon, 21 Oct 2019 21:03:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191022010343.GD1912@beryl>
References: <20191017174109.17002-1-denys@ti.com>
	<CAMKF1srJazaTzus6_Oq+F_6A74qk6JXuzd3EHMiR5uv0Gmy0Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srJazaTzus6_Oq+F_6A74qk6JXuzd3EHMiR5uv0Gmy0Yg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH] ti-display-sharing-fw: update to 06.01.00.00
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
X-List-Received-Date: Tue, 22 Oct 2019 01:04:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 21, 2019 at 02:32:38PM -0700, Khem Raj wrote:
> On Thu, Oct 17, 2019 at 10:58 AM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../ti-display-sharing-fw/ti-display-sharing-fw_git.bb        | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
> > index db095d90..9115b6b4 100644
> > --- a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
> > +++ b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
> > @@ -3,7 +3,7 @@ SUMMARY = "TI Display Sharing Firmware"
> >  LICENSE = "TI-TFL"
> >  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >
> > -PV = "00.09.00.00-git${SRCPV}"
> > +PV = "06.01.00.00+git${SRCPV}"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  inherit deploy
> > @@ -11,7 +11,7 @@ inherit update-alternatives
> >
> >  PROTOCOL = "git"
> >  BRANCH = "ti-linux-firmware"
> > -SRCREV = "4a86f16df9b44798851e51fa465825710cda76cf"
> > +SRCREV = "e7be1ab85266c47236330e2909997d20fc62e312"
> >
> 
> I get
> 
> Cloning into bare repository
> 'TOPDIR/downloads/git2/git.ti.com.processor-firmware.ti-linux-firmware.git'...
> fatal: unable to connect to git.ti.com:
> git.ti.com[0: 198.47.28.207]: errno=Connection refused
> 
> 
> ERROR: Fetcher failure for URL:
> 'git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=ti-linux-firmware'.
> Unable to fetch URL from any source.
> 
> is this temporary ?

Hopefully temporary, but don't know for how long.
https://www.dallasnews.com/news/weather/2019/10/21/3-tornadoes-tear-through-dallas-leveling-homes-and-leaving-thousands-in-north-texas-without-power/

Let me know if you need mirror tarballs for those repo...

Denys


> >  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

