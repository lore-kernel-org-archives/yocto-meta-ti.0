Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E74DFE0084A; Wed,  5 Jul 2017 08:47:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21FF1E00349
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 08:47:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65FlUKC016172
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 10:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499269650;
	bh=7c2JroxICuNrF9leCGznQOqf1hrl35ud8VwkoDFO74s=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=dg4exH69Wfl++nDlkcdyPpqJv8NpORXi6Xa5Jv1QryDgXopriDcWvgJ3n4+lebudx
	0bqoyPlU+3vGr3dIMo7wSTcqvVPQEP55MQHtKI+gcyxDNHQV9NxCec0WjUtGRASqHw
	CsJqLTviwyepyVn0wWatY1x4UF/11HyFsG2pYaUA=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65FlULF018377
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 10:47:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 10:47:29 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65FlToZ030981;
	Wed, 5 Jul 2017 10:47:29 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1498853539-39412-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c2408117-d08c-aed7-3491-44e05ce4fef2@ti.com>
Date: Wed, 5 Jul 2017 11:47:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1498853539-39412-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] common-csl-ip: Update for CSL version 3.3.0.7 & support for ti33x, ti43x & omapl1
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
X-List-Received-Date: Wed, 05 Jul 2017 15:47:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK


On 6/30/2017 4:12 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/common-csl-ip/common-csl-ip.inc | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> index cac0b93..71ef9e9 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -2,9 +2,9 @@ DESCRIPTION = "Chip support library low level interface"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>   
> -COMPATIBLE_MACHINE = "keystone|dra7xx"
> +COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
>   
> -PV = "03.03.00.06C"
> +PV = "03.03.00.07B"
>   INC_PR = "r0"
>   
>   CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
>   CSL_GIT_BRANCH = "master"
>   CSL_GIT_DESTSUFFIX = "git"
>   
> -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.06C"
> -CSL_SRCREV = "ce2bbf96b08fa69eda7bfc92aa7760b7ca70dddf"
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.07B"
> +CSL_SRCREV = "28dbc2f4b0b06b29ac4e962a9494987d242b48b5"
>   
>   BRANCH="${CSL_GIT_BRANCH}"
>   SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"


