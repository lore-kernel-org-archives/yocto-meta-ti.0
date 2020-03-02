Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8943.1583117280191100721
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 Mar 2020 18:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YwZvXkNT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0222lx7N112266;
	Sun, 1 Mar 2020 20:47:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583117279;
	bh=RRjNl/N8ZW7FDVnwZuKqmEq6z+NGPKhUn3o9KMM57Xw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YwZvXkNT6oQ4+PFV+Di3kSkVipNtg1xe00UOBh22rgHvCmH4NS3TVZ2WkxrB9Ghg2
	 zP66KPhEEsONsMQScJ7+rbj2PDtjZPQWszUWfQzKqYBXn0+1RO+wQu+jV2SuIpdh4g
	 jMiX+Z5srVk/JBhQK4xEI+mwgdp5S8fV/GJafIto=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0222lxOf062058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 1 Mar 2020 20:47:59 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 1 Mar
 2020 20:47:58 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 1 Mar 2020 20:47:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 0222lvQ8035040;
	Sun, 1 Mar 2020 20:47:58 -0600
Date: Sun, 1 Mar 2020 21:47:56 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [master][PATCH] ti-cgt6x: fix packaging issue due to libc.a
Message-ID: <20200302024755.GL2466@beryl>
References: <1582679379-48365-1-git-send-email-denys@ti.com>
 <bbde41fb-0ff0-ad9f-609f-542371a62d9d@gmail.com>
 <20200226013412.GL22188@beryl>
 <178a642e-c89e-b1f3-53ca-c76a7a554efe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <178a642e-c89e-b1f3-53ca-c76a7a554efe@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 25, 2020 at 05:55:38PM -0800, Khem Raj wrote:
> 
> 
> On 2/25/20 5:34 PM, Denys Dmytriyenko wrote:
> > On Tue, Feb 25, 2020 at 05:23:48PM -0800, Khem Raj wrote:
> >>
> >>
> >> On 2/25/20 5:09 PM, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> >>> dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a: not a valid ELF file
> >>>
> >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>> ---
> >>>  recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> >>> index c63c3f6..1188b4e 100644
> >>> --- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> >>> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> >>> @@ -100,6 +100,7 @@ FILES_${PN} += "${datadir}/ti/*"
> >>>  FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
> >>>  
> >>>  INSANE_SKIP_${PN} += "staticdev"
> >>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >>>  
> >>
> >> Thanks for taking care of this issue, does it have any downsides, like
> >> not stripping binaries which otherwise should have been stripped besides
> >> libc.a
> > 
> > This is C6000 DSP code and is not the main architecture for the platform being 
> > built, so standard ARM tools won't be able to handle that anyway. But all the 
> > other ARM binaries in that package are not stripped now, unfortunately.
> 
> yeah I thought so, and dwarfsrcfiles is quite simplistic, perhaps you
> might want to file a defect so we could define a WHITELIST of files in
> recipes which should be spared from
> stripping

Sent v2 to use INHIBIT_PACKAGE_STRIP_FILES for whitelisting.


> > On the other hand, I'm getting the same error from dwarfsrcfiles on another 
> > static .a library from another package, which contains the proper ARM code, 
> > which is rather strange. The only suspicious thing there is an empty metafile 
> > called ".created", but for now I have to disable stripping there as well...
> > 
> > 
> >>>  BBCLASSEXTEND = "native nativesdk"
> >>>  
> >>>
> >>>
> >>> 
> >>>
