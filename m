Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.15097.1603300104800741763
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 10:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wvD7mnfA;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: denys@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9D80538C13A6
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:08:24 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LH8O1u025937
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603300104;
	bh=2kjjsX4MxvuY4aqDeLZzyQsLBVWLcWnEVS15+YGuomg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wvD7mnfA76hR4ssV62ZNvsMS1oEsSEumcdgK7W5X8NP9zfEmM8ZsyZp8iQA+3bQga
	 oTuZphoa/c0Ucdob0RsaxlhTKYEtf/3jn8a20xLv9lzCzrhtU+Z+j71lVe3OoEfpTn
	 JktbBw+icu6iY6v5I2/JdpOpANlEChyNCyUttoec=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LH8O8U089033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:08:24 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 12:08:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 12:08:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LH8NmV092280;
	Wed, 21 Oct 2020 12:08:23 -0500
Date: Wed, 21 Oct 2020 13:08:23 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <s-anna@ti.com>, <praneeth@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 3/3] u-boot-ti-staging: Update to latest HEAD for j7 build
Message-ID: <20201021170823.GN14852@beryl>
References: <20201021150210.29966-1-dmurphy@ti.com>
 <20201021150210.29966-3-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201021150210.29966-3-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2020 at 10:02:10AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 5b09cb579eff..dd213d5d670d 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r18"
> +PR = "r19"
>  
>  BRANCH = "ti-u-boot-2020.01"
>  
> -SRCREV = "eea73800730b3d9125f5c12a629db2f88e566b71"
> +SRCREV = "bf0a77ee8e102e921c8f08f8e919a45ffb270ebe"
> -- 
> 2.17.1
> 
