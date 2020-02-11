Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4444.1581386969277549735
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 18:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Sba/p23g;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B29SMq091085
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2020 20:09:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581386968;
	bh=Cy70+Npty7NsLLydw7IQNGxTVJNLMsbSILu90G/JqOc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Sba/p23grqltqr7btnSI/ArMS7Hy5zZSg0JAOToKIBNlQ9LhuKuehfpn9kqT7o4r9
	 Dd4qbxygudsVy0MD04EuuckvZ5yRx7rT+AVntymAw8r9ideesbyOu/4Gxuq3ps3eW2
	 um9dyyBRgVARXhV9/lJ8wEivk6kJ2kWBTQz+pUh4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01B29SiD101021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Feb 2020 20:09:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 20:09:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 20:09:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B29RJ8120491;
	Mon, 10 Feb 2020 20:09:28 -0600
Date: Mon, 10 Feb 2020 21:09:27 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <nikhil.nd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH] recipes-kernel: jailhouse: Update to 0.12 version
Message-ID: <20200211020927.GI17543@beryl>
References: <20200210151800.17737-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200210151800.17737-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Have you tried building it?


On Mon, Feb 10, 2020 at 08:48:00PM +0530, Nikhil Devshatwar via Lists.Yoctoproject.Org wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 4186dc3a..bdbcb820 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
>  "
>  
> -PV = "0.10+git${SRCPV}"
> -SRCREV = "b3a68ac89d7ed955546eae91954b184ec1583ce3"
> -BRANCH = "ti-jailhouse-0.10"
> +PV = "0.12+git${SRCPV}"
> +SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
> +BRANCH = "ti-jailhouse-0.12"
>  
>  SRC_URI = " \
>      git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
> -- 
> 2.17.1
> 

> 

