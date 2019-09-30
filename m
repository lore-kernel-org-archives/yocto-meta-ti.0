Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CF4CE00A93; Mon, 30 Sep 2019 11:32:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A332E009E2
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 11:32:46 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UIWjsq085566;
	Mon, 30 Sep 2019 13:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569868365;
	bh=2Fyk8anxB2Wb600HDbA2Nw9Kf0RKnPUvXm0W4mFhCsc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mEA4b7m4ARLq/PopwBD8sbCZIEghnv0/35sMl6tYJTRTpZf4vMasf/5qwzA9v1KlR
	Z9TJ1O0ROiNt8NY8K2uK1yFpBmR/Ln7elz1hRmn6JOWXC3ETQIvvrnPaGouPB9DqCB
	RsVB5WNq5a2+zYd2p6mJ5zhEBSle7SXVr8S+7ax0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UIWjZA042131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Sep 2019 13:32:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 13:32:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 13:32:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UIWiUF126235;
	Mon, 30 Sep 2019 13:32:44 -0500
Date: Mon, 30 Sep 2019 14:32:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190930183244.GB12684@beryl>
References: <20190929154335.2646732-1-raj.khem@gmail.com>
	<20190929154335.2646732-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190929154335.2646732-3-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] beaglebone-getting-started: Mention CC-BY-SA-3.0 and correct GPL version
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
X-List-Received-Date: Mon, 30 Sep 2019 18:32:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Sep 29, 2019 at 08:43:35AM -0700, Khem Raj wrote:
> This is as per
> https://github.com/jadonk/beaglebone-getting-started/blob/master/LICENSE.txt

You are looking at the latest LICENSE file, while the recipe hasn't updated 
its SRCREV since early 2012, back when beagleboard.org was still active in OE. 
Specifically, GPLv3+ was added in 2013:
https://github.com/jadonk/beaglebone-getting-started/commits/master/LICENSE.txt

We don't use this package, but I kept it in case someone still needs it. I did 
put a README with a note in that directory:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README

Probably, this can be updated to the latest, as part of fixing the LICENSE? :)

Denys


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> index 6c61a4e9..c86e3518 100644
> --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> @@ -4,7 +4,7 @@ PR = "r21"
>  
>  inherit allarch
>  
> -LICENSE = "GPLv2+ & MIT & PD & others"
> +LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD & others"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
>  
>  SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

