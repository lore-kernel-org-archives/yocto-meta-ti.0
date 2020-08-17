Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.47971.1597683906660120695
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 10:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jxHHcMyX;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 253C0E02033; Mon, 17 Aug 2020 10:05:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDD74E02031
	for <meta-ti@yoctoproject.org>; Mon, 17 Aug 2020 10:05:03 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07HH53iM044665
	for <meta-ti@yoctoproject.org>; Mon, 17 Aug 2020 12:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597683903;
	bh=zmrICPPfmDr8pWUHoQkF+07+DlTiDyRhpMlICkj5cgk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jxHHcMyXsAr3n1bL4cZVoeMWkCAgBX6EBgdysJ49u0O2rcSJTLFKtXoB9/+09l3e1
	 OCpqoBXweCeKFBQKg+nqrdcbQZOnpeECGTfL1Ks0vYexFMjZWrrggV3ZtZRHC2VEN4
	 VHNCJULLAyxpVp2VyjaNtLfeCC7h5q3hlud6wzmY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07HH53xx040677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Aug 2020 12:05:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 17
 Aug 2020 12:05:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 17 Aug 2020 12:05:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07HH52N5042507;
	Mon, 17 Aug 2020 12:05:02 -0500
Date: Mon, 17 Aug 2020 13:05:02 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: <dmurphy@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Update SRCREV to latest
Message-ID: <20200817170502.GA9780@beryl>
References: <20200817055808.26422-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200817055808.26422-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is it a duplicate?
Please be clear when re-submitting.


On Mon, Aug 17, 2020 at 11:28:08AM +0530, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 46447af6..8f5e50b6 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>  "
>  
>  PV = "0.12+git${SRCPV}"
> -SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
> +SRCREV = "0d059b6f2c3efeaa2466517300540498b34b7655"
>  BRANCH = "ti-jailhouse-0.12"
>  
>  SRC_URI = " \
> -- 
> 2.17.1
> 
