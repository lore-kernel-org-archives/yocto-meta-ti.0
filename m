Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.18166.1589562223678116140
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2020 10:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ITrpsSoh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FH3gP1015238
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2020 12:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589562222;
	bh=BR61NrmfNTolO21zJi2TGk+4+lGsZoP2zrpX0uP9MkM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ITrpsSohlmqd+gQE8Ys3CvmPslt87Z87nzuUSeD50wqnejXyjzO/tvREs3Xgrd8Lu
	 yUgMclhweFGRatT8Lv8LCoQwcnnEt3nl4KBWJc1IzKZaOqepflrJ3Zvq2SQhwdwHJQ
	 115CX8A+6ZJwmeuSbf8gULWrk66d09ewHjt5lS0M=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04FH3gO1038672
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2020 12:03:42 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 12:03:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 12:03:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FH3gfJ000770;
	Fri, 15 May 2020 12:03:42 -0500
Date: Fri, 15 May 2020 13:03:41 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <nikhil.nd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Update SRCREV to latest
Message-ID: <20200515170341.GE8594@beryl>
References: <20200515135844.4333-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200515135844.4333-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 15, 2020 at 07:28:44PM +0530, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>

Any version updates? Still 0.12 based?


> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 3ee24e58..46447af6 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>  "
>  
>  PV = "0.12+git${SRCPV}"
> -SRCREV = "2c6516ce3d0e0c4e9372e4439562dd660877cb79"
> +SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
>  BRANCH = "ti-jailhouse-0.12"
>  
>  SRC_URI = " \
> -- 
> 2.17.1
> 
