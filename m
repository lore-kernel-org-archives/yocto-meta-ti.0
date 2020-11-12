Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4291.1605189247994616730
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 05:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T3eXWeeY;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D023B38C08A4
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 13:54:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACDs6IO062719
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 07:54:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605189246;
	bh=05bgdlQYSRsOz9MxC2hFOO31VPLjyZ02xTWeO77QK2U=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=T3eXWeeY72zkq0Eoa2WgTa7QHDt/l2y3JFm8crB/7Wl/CvaLQPpZejA9CL+dAWXxK
	 hC+YKLxnassiO4F9w2yCPJ+PdzaVY11u7DMFOO8XXVZU5Bt4FJ4v5mGCrYQbjxNNDU
	 uO6i+zKKmeUqwDOtWwrVTJztdqSFF3vIUPxBalTk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACDs62h045721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 07:54:06 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 07:54:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 07:54:06 -0600
Received: from [10.250.64.205] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACDs5KV026828;
	Thu, 12 Nov 2020 07:54:05 -0600
Subject: Re: [meta-ti][dunfell PATCH] k3conf: Update SRCREV to latest
To: Dan Murphy <dmurphy@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@yoctoproject.org>
References: <20201112134841.7108-1-s-anna@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <f4dd7293-6aad-aa09-c962-f6a2cc02b91f@ti.com>
Date: Thu, 12 Nov 2020 07:54:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201112134841.7108-1-s-anna@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/12/20 7:48 AM, Suman Anna wrote:
> Use latest SRCREV on master branch to pick up all the
> changes compliant with TIFS 2020.08b firmware.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Dan,
> 
> Please pick this up for 07.01.00.006. Will submit a separate patch
> for master, looks like Nikhil missed one update to master branch.

Sorry, my bad, I take this back, my local master branch was not up-to-date. This
is applicable for master as well.

regards
Suman

> 
> regards
> Suman
> 
>  recipes-devtools/k3conf/k3conf_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/k3conf/k3conf_git.bb b/recipes-devtools/k3conf/k3conf_git.bb
> index 6771eeb7682e..f7d062b91408 100644
> --- a/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/recipes-devtools/k3conf/k3conf_git.bb
> @@ -8,7 +8,7 @@ PV = "0.1+git${SRCPV}"
>  COMPATIBLE_MACHINE = "k3"
>  
>  BRANCH ?= "master"
> -SRCREV = "246eb4092d7d111ce10e0a310b9bde678b97ab36"
> +SRCREV = "1ff0c4f429e8e33d22b52ec002d9b97bbca6bf0b"
>  
>  SRC_URI = "git://git.ti.com/k3conf/k3conf.git;protocol=git;branch=${BRANCH}"
>  
> 

