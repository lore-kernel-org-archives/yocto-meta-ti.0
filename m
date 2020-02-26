Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1585.1582680853999276417
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 17:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=am7T+B3a;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q1YCfX028787;
	Tue, 25 Feb 2020 19:34:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582680852;
	bh=3L/AQePwvFwFa9y1f6dbHlYParZi3NYA4DfZG5dKXsQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=am7T+B3aYQsAyvdb4v8Orm9TjOfuO0vANF+CnAzVpbkoIlXdJrmttD8Y+i+tZ2jB7
	 xwbgcZ/SECvFoSSHbJbakuAEi4tABzM0hDBJzGz8dQLZhkoAkQXhaA0uOq8NBCzXpE
	 dQtFxd1ejHxdBKB1OPBN8feFMSq5W2Ro977APHN8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01Q1YCXL050502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2020 19:34:12 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 19:34:12 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 19:34:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01Q1YC9O099851;
	Tue, 25 Feb 2020 19:34:12 -0600
Date: Tue, 25 Feb 2020 20:34:12 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [master][PATCH] ti-cgt6x: fix packaging issue due to libc.a
Message-ID: <20200226013412.GL22188@beryl>
References: <1582679379-48365-1-git-send-email-denys@ti.com>
 <bbde41fb-0ff0-ad9f-609f-542371a62d9d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bbde41fb-0ff0-ad9f-609f-542371a62d9d@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 25, 2020 at 05:23:48PM -0800, Khem Raj wrote:
> 
> 
> On 2/25/20 5:09 PM, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> > dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a: not a valid ELF file
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> > index c63c3f6..1188b4e 100644
> > --- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> > +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> > @@ -100,6 +100,7 @@ FILES_${PN} += "${datadir}/ti/*"
> >  FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
> >  
> >  INSANE_SKIP_${PN} += "staticdev"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >  
> 
> Thanks for taking care of this issue, does it have any downsides, like
> not stripping binaries which otherwise should have been stripped besides
> libc.a

This is C6000 DSP code and is not the main architecture for the platform being 
built, so standard ARM tools won't be able to handle that anyway. But all the 
other ARM binaries in that package are not stripped now, unfortunately.

On the other hand, I'm getting the same error from dwarfsrcfiles on another 
static .a library from another package, which contains the proper ARM code, 
which is rather strange. The only suspicious thing there is an empty metafile 
called ".created", but for now I have to disable stripping there as well...


> >  BBCLASSEXTEND = "native nativesdk"
> >  
> > 
> > 
> > 
> > 
