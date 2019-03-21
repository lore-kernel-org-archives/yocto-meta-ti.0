Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E322DE00D15; Thu, 21 Mar 2019 13:49:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0512CE00798
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 13:49:24 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LKnO27065912
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 15:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553201364;
	bh=LgFDReBLnxWieO2QMjgY6o1yzU1Ng09RQlqoqXoH2BA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Us7V+1Os9Fj1J5RnnYZS2RvDN/SQD1v9ls8eMv5L25FQGqNHi8eQ+gNFohJpucRV4
	8vfuTkOu8dzjGJHdBBfFx2oO6vGtkLbVo3yiWzfx5wARCZAGmVO8aY15/41y581Y+B
	oVfS6e+kI+MSJvrhjNyQaUhAEIFmVhG7ntEoFXng=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LKnOQo110550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 15:49:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 15:49:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 15:49:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LKnNKA025328;
	Thu, 21 Mar 2019 15:49:23 -0500
Date: Thu, 21 Mar 2019 16:49:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190321204923.GF30002@beryl>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553174173-28679-28-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1553174173-28679-28-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 27/29] mathlib: Enhancements to facilitate AUTOREV
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
X-List-Received-Date: Thu, 21 Mar 2019 20:49:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 21, 2019 at 09:16:11AM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/mathlib/mathlib.inc | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
> index 41130c0..8672a7d 100644
> --- a/recipes-ti/mathlib/mathlib.inc
> +++ b/recipes-ti/mathlib/mathlib.inc
> @@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
>  require ../includes/ti-paths.inc
>  
>  PV = "3_1_2_3"
> -PR = "r0"
> +PR = "r1"
>  
>  DEPENDS = "ti-cgt6x-native \
>             ti-xdctools-native \
> @@ -16,8 +16,14 @@ DEPENDS = "ti-cgt6x-native \
>  
>  S = "${WORKDIR}/git"
>  
> -SRC_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git;protocol=git;branch=master"
> -SRCREV = "faedd650c47becb48b2d179242c8310327ef9853"
> +MATHLIB_GIT_BRANCH = "master"
> +MATHLIB_GIT_PROTOCOL = "git"
> +MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
> +MATHLIB_SRCREV = "faedd650c47becb48b2d179242c8310327ef9853"
> +
> +BRANCH = "${MATHLIB_GIT_BRANCH}"

This variable is not being used, why define it?


> +SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"

You pass MATHLIB_GIT_BRANCH directly to SRC_URI, so BRANCH is left unused - 
don't need it.


> +SRCREV = "${MATHLIB_SRCREV}"
>  
>  LIC_FILES_CHKSUM = "file://ti/mathlib/src/acosdp/acosdp.h;beginline=1;endline=35;md5=c133f7e139b46385906c861dd9552250"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

