Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA1F4E00D28; Mon,  4 Mar 2019 17:48:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84F86E00D14
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 17:48:50 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x251mo8E053146
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:48:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551750530;
	bh=xkMjkly7QSXxIFLywkrQ4/7m2WsZ5HwT/K/4A3m+8ek=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wvSLEZ8MJ/iwtU2oGAA5wAGef/+HoQb5c6KVw0XjFi+qaAe5Bm97lN4uch2fVyDnG
	Xbfj9QHXxKSz2AGnocwG0dmJN6SodKKo3RUpo1esnmDawJEj2jNRG1m9AtPn9ZFYVX
	jSf5GpVXc7Nf5UwEroN2NiVtmIMv6Unh1HXLJY5A=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x251moII015038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:48:50 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 19:48:49 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 19:48:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x251mniX013527;
	Mon, 4 Mar 2019 19:48:49 -0600
Date: Mon, 4 Mar 2019 20:48:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190305014849.GW26081@beryl>
References: <1551750219-10022-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551750219-10022-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551750219-10022-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] ti-xdctools: Update to version 3.51.01.18
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
X-List-Received-Date: Tue, 05 Mar 2019 01:48:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 08:43:39PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-xdctools_3.50.08.24.bb => ti-xdctools_3.51.01.18.bb}      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-ti/devtools/{ti-xdctools_3.50.08.24.bb => ti-xdctools_3.51.01.18.bb} (35%)
> 
> diff --git a/recipes-ti/devtools/ti-xdctools_3.50.08.24.bb b/recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
> similarity index 35%
> rename from recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
> rename to recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
> index 1e776e7..35258b4 100644
> --- a/recipes-ti/devtools/ti-xdctools_3.50.08.24.bb
> +++ b/recipes-ti/devtools/ti-xdctools_3.51.01.18.bb
> @@ -1,9 +1,9 @@
>  require recipes-ti/devtools/ti-xdctools-core.inc
>  
> -PV = "3_50_08_24"
> +PV = "3_51_01_18"
>  PR = "r0"
>  
> -LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
> +LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=7d8508a640d8e76fe372141df01c351f"

Same - please explain checksum change.


> -SRC_URI[xdczip.md5sum] = "19e73ea981354e6fa7144978bc16e215"
> -SRC_URI[xdczip.sha256sum] = "335fd4050abba8e3c1c38d382d39a889441ef0d9bee57dba5892923acd586488"
> +SRC_URI[xdczip.md5sum] = "54b80b603471623c1dbb0cfeb75b0fe2"
> +SRC_URI[xdczip.sha256sum] = "9bbbf433f0970bcb0cbf938615afe4d54420ecc56bc6e872f1a004338a8f19d5"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

