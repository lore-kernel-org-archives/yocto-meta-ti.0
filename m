Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1582.1582584235701944253
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 14:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ttgEWK81;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OMhsJx045683;
	Mon, 24 Feb 2020 16:43:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582584234;
	bh=2biUvU6pDFR7Gl0ALo8gjhbrcQdmiW6Z4emMN3xIV1Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ttgEWK81V+PceLjpFLl+1lhpNbCiOHzw4GGhtamdPb0fDEXLQ02ZaiJ30M5kkRIDV
	 dz/aBiCtlcDh0f9EwPP/3pjH+zSs15RA+WL2iUSUR4RwgdkzysNii81xhLD0J1OxnQ
	 hEXsDubB7ZmwDyNW+iQ40IgSmu3NumiZY2eFRR44=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01OMhsRd053383
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2020 16:43:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 16:43:54 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 16:43:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OMhsmw022576;
	Mon, 24 Feb 2020 16:43:54 -0600
Date: Mon, 24 Feb 2020 17:43:54 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [zeus/master][PATCH 1/4] sgx-um, rogue-umlibs, gc320-libs: RRECOMMENDS on corresponding drivers
Message-ID: <20200224224354.GL22205@beryl>
References: <20200220184722.25828-1-denys@ti.com>
 <7cfa3a22-979a-df7d-2dd5-81ed956fd408@ti.com>
MIME-Version: 1.0
In-Reply-To: <7cfa3a22-979a-df7d-2dd5-81ed956fd408@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 24, 2020 at 12:12:06PM -0500, Andrew F. Davis wrote:
> On 2/20/20 1:47 PM, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb           | 2 ++
> >  recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 +++-
> >  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb       | 2 ++
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > index e8c2f011..d6ecd229 100644
> > --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > @@ -12,6 +12,8 @@ BRANCH = "ti-${PV}"
> >  SRC_URI = "git://git.ti.com/graphics/ti-gc320-libs.git;protocol=git;branch=${BRANCH}"
> >  SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
> >  
> > +RRECOMMENDS_${PN} = "ti-gc320-driver"
> > +
> 
> 
> Do RRECOMMENDS pull in the package by default? If I just include in my
> image "ti-gc320-libs" then I'll also get "ti-gc320-driver" automatically
> in my image also right?

Yes.

> Andrew
> 
> 
> >  # There's only hardfp version available
> >  python __anonymous() {
> >      tunes = d.getVar("TUNE_FEATURES")
> > diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> > index 9cb863a5..67290756 100644
> > --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> > +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> > @@ -27,7 +27,7 @@ PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
> >  DEPENDS += "libdrm wayland expat"
> >  RDEPENDS_${PN} += "bash"
> >  RDEPENDS_${PN} += "python-core"
> > -RDEPENDS_${PN} += "ti-img-rogue-driver wayland expat"
> > +RDEPENDS_${PN} += "wayland expat"
> >  
> >  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
> >  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> > @@ -41,6 +41,8 @@ RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
> >  RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> >  RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg"
> >  
> > +RRECOMMENDS_${PN} += "ti-img-rogue-driver"
> > +
> >  S = "${WORKDIR}/git"
> >  
> >  do_install () {
> > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > index ecf3ffcc..8b0b3058 100644
> > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> > @@ -43,6 +43,8 @@ RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
> >  # The actual SONAME is libGLESv2.so.2, so need to explicitly specify RPROVIDES for .so.1 here
> >  RPROVIDES_${PN} += "libGLESv2.so.1"
> >  
> > +RRECOMMENDS_${PN} += "ti-sgx-ddk-km"
> > +
> >  S = "${WORKDIR}/git"
> >  
> >  do_install () {
> > 
> > 
> > 
> > 
