Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 747BFE00D2C; Thu, 21 Mar 2019 13:50:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52E07E00D2A
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 13:50:04 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LKo4Xm066162
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 15:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553201404;
	bh=Zfg8txtFUJBy/qe2sQ0x/U4gQoTttJ4iNwGjCI0bOuU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LcInd7nJxDmlxiEpZtoEOwd9W9GkrWJ8cNy2VAploeH3MeoviP2zqpPiPyxWuRvsc
	AeMdqWQB1Y3lvKevIkLa/xTLh8/Cf6btzNmzzoBB/nKsnIs/28NbrYtryqBi1AZ+Ge
	/x2tAmCPv0KTMXGJdg9sPfMbgoANxi38IhQzrAuE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LKo4ev080791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 15:50:04 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 15:50:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 15:50:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LKo31n007920;
	Thu, 21 Mar 2019 15:50:03 -0500
Date: Thu, 21 Mar 2019 16:50:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190321205002.GH30002@beryl>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553174173-28679-29-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1553174173-28679-29-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 28/29] swtools: Enhancements to facilitate AUTOREV
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
X-List-Received-Date: Thu, 21 Mar 2019 20:50:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 21, 2019 at 09:16:12AM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/swtools/swtools_git.bb | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
> index 16a8cc0..89a64d5 100644
> --- a/recipes-ti/swtools/swtools_git.bb
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -11,11 +11,18 @@ DEPENDS = "ti-cgt6x-native \
>             ti-xdctools-native"
>  
>  PV = "5_0_8"
> -PR = "r0"
> +PR = "r1"
>  S = "${WORKDIR}/git"
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "d0c1022954b489d5f3d8d2f5c81d8c6a392f4af4"
> +
> +SWTOOLS_GIT_BRANCH = "master"
> +SWTOOLS_GIT_PROTOCOL = "git"
> +SWTOOLS_GIT_URI = "git://git.ti.com/ep-processor-libraries/swtools.git"
> +SWTOOLS_SRCREV = "d0c1022954b489d5f3d8d2f5c81d8c6a392f4af4"
> +
> +BRANCH = "${SWTOOLS_GIT_BRANCH}"

Here as well.


> +SRC_URI = "${SWTOOLS_GIT_URI};protocol=${SWTOOLS_GIT_PROTOCOL};branch=${SWTOOLS_GIT_BRANCH}"
> +SRCREV = "${SWTOOLS_SRCREV}"
> +
>  
>  export C64PCODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
>  export C674CODEGENTOOL = "${CGTOOLS_INSTALL_DIR}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

