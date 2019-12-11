Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1685.1576031987772226242
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 18:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=E26U5yy+;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B4B1E01146; Tue, 10 Dec 2019 18:39:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B42AE00852
	for <meta-ti@yoctoproject.org>; Tue, 10 Dec 2019 18:39:45 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBB2djUi096652
	for <meta-ti@yoctoproject.org>; Tue, 10 Dec 2019 20:39:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576031985;
	bh=SomSYlF8BW0R7Cmba3s4EroCUvvZEJzJp32wH5cFYJI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E26U5yy+DcaUWk8gBDgpdVoozADxR8frvv9tXCouUwnKTSNorsv6hJdQi+9++b6P6
	 gz+e9PzllTTlVgofmSqYH0+0w+oj/Mnw33iWHDvR7h6wUR/ZZLNHK8Tsv6mPzuRGli
	 jDFparLUGPXYEjOrylNRyf6thqxMHB23z0DrLH/8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBB2djhD014184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 10 Dec 2019 20:39:45 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Dec 2019 20:39:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Dec 2019 20:39:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBB2dhTW110637;
	Tue, 10 Dec 2019 20:39:44 -0600
Date: Tue, 10 Dec 2019 21:39:42 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Nick Saulnier <nsaulnier@ti.com>
CC: <meta-ti@yoctoproject.org>, <j-stiffler@ti.com>
Subject: Re: [meta-ti][PATCH v1] pru-icss_git.bb: Update Manifest and PSSP commits
Message-ID: <20191211023941.GT11359@beryl>
References: <20191210052317.18417-1-nsaulnier@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191210052317.18417-1-nsaulnier@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Seems to be breaking the build for all platforms - was it tested?


On Mon, Dec 09, 2019 at 11:23:17PM -0600, Nick Saulnier wrote:
> - Updated the Software Manifest from 5.0 -> 6.0 to account for new processors,
> etc.
> 
> - Updated to PRU Software Support Package v5.6.0
> 	updated manifest
> 	added PRU Getting Started Labs
> 	improved several examples
> 
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 6508b6c2bcf3..189f37613973 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Programmable Real-time Unit Software Package"
>  HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
>  LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
>  
> -LIC_FILES_CHKSUM = "file://PRU-Package-v5.0-Manifest.html;md5=a86a37c8b6396ad0ad6ae752f1aa8fcc"
> +LIC_FILES_CHKSUM = "file://PRU-Package-v6.0-Manifest.html;md5=ea854230556f47609efdaedca174b44c"
>  
>  inherit update-alternatives
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "1ff0393b3b9454fe9c58399c1b5d2db511e8049c"
> +SRCREV = "e3aee2df1ad6d5678ac49e280fc7cf777e720804"
>  
> -PV = "5.5.0"
> +PV = "5.6.0"
>  PR = "r1"
>  
>  require recipes-ti/includes/ti-paths.inc
> -- 
> 2.17.1
> 
