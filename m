Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2053.1582156714458329593
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 15:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uM47AUhk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JNwXxr096671
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 17:58:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582156713;
	bh=yssPvME6jLU9MSvLwwm/kwYYcOcc0RQMw+Uj0ePJ1+A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uM47AUhkjmeX4BEJOSH9Yabc0wAMuRlZ5z41rXYU16Ihs7CtdvB90wYY17EuO30cM
	 iAdFD2xgrwE4BQPGl24cFqHVpZhcxHDEUM4+xIPnSBdl+XN5HRKtPIwAdZVcAKpPux
	 tAEtaai56CbBEIcb4RmOVHK352aNjj0llwGrI69w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01JNwXCw034073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 17:58:33 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 17:58:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 17:58:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JNwXDx020021;
	Wed, 19 Feb 2020 17:58:33 -0600
Date: Wed, 19 Feb 2020 18:58:33 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
Message-ID: <20200219235832.GY720@beryl>
References: <20200218160621.26272-1-afd@ti.com>
 <20200218175234.GJ720@beryl>
 <ed392732-a4bb-fd54-6c0e-3c2358edba49@ti.com>
MIME-Version: 1.0
In-Reply-To: <ed392732-a4bb-fd54-6c0e-3c2358edba49@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 18, 2020 at 01:08:46PM -0500, Andrew F. Davis wrote:
> On 2/18/20 12:52 PM, Denys Dmytriyenko wrote:
> > I was sitting on a similar patch in a private testing branch:
> > https://lists.yoctoproject.org/g/meta-ti/message/12418
> 
> Why RRECOMMENDS? It should be a real dependency right?

Andrew,

Historically kernel modules used RRECOMMENDS.

Plus, it's easier to break RRECOMMENDS dependency than RDEPENDS. And we had 
instances in the past, when we needed to be able to build against UM libs, 
even when KM support is not there. Of course, it may not be an issue in the 
future, when we split up UM libs package into individual libs and/or move to 
Mesa based builds...

-- 
Denys


> > On Tue, Feb 18, 2020 at 11:06:21AM -0500, Andrew F. Davis wrote:
> >> The UM doesn't work too well without the KM side, add this dependency.
> >>
> >> Signed-off-by: Andrew F. Davis <afd@ti.com>
> >> ---
> >>  recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> >> index 129d5cee..d4bc0232 100644
> >> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> >> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> >> @@ -28,7 +28,7 @@ inherit update-rc.d
> >>  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
> >>  
> >>  DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
> >> -RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat"
> >> +RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols libffi expat ti-sgx-ddk-km"
> >>  
> >>  RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
> >>  RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
> >> -- 
> >> 2.17.1
> >>
