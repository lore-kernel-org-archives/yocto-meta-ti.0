Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4EDFE00C1E; Tue,  9 Apr 2019 13:13:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 357CBE00AD5
	for <meta-ti@yoctoproject.org>; Tue,  9 Apr 2019 13:13:30 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39KDUAt102279
	for <meta-ti@yoctoproject.org>; Tue, 9 Apr 2019 15:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554840810;
	bh=K56plAr4+Dab/4jyualiABuwcxtnqozP9mXC46D7zCE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iHHUrNlVO717wUvhSZxLKC5XarFcyyeHSHRsSyx/g31hJh9RgQ2GKNp0Tfw2lp6Sq
	TyN9NVijqb3HvkRCPKtvTltoA0SGpJbILV/t9YFnUan33GIvo8E4JscwWzetDflVeK
	0+42ShGYSAIIYG9IR64yJEfiIC1nQbAqQRtWr49o=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39KDU57127287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 9 Apr 2019 15:13:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 9 Apr 2019 15:13:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 9 Apr 2019 15:13:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39KDTpD079853;
	Tue, 9 Apr 2019 15:13:29 -0500
Date: Tue, 9 Apr 2019 16:13:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20190409201329.GA21998@beryl>
References: <20190409183847.5457-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190409183847.5457-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: update to ti2019.00 tag
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2019 20:13:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Dan,

This patch looks incorrect - release tag is the same as RC5, but you are 
changing it to the HEAD...


On Tue, Apr 09, 2019 at 01:38:47PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
> index adb4976b..5d2a2846 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
>  
>  BRANCH = "ti-rt-linux-4.19.y"
>  
> -SRCREV = "dd79f85919e94693a894edd21cae767d74751961"
> +SRCREV = "e3bbce7978e3a0b0e3a1a0072ebfaa34e23d4b11"
>  PV = "4.19.25+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> index 3cd1a878..e5fcb72c 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> @@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-4.19.y"
>  
> -SRCREV = "85f9077a5ff8ee28e1415be4c5174c6fd71ee968"
> +SRCREV = "f95e1cb61f787ab00fa93182e03598d2470eff4b"
>  PV = "4.19.25+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -- 
> 2.14.0
> 

