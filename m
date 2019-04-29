Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DF07E00CAA; Mon, 29 Apr 2019 11:22:17 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02C2FE00927
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 11:22:16 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TIMGe9085595
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 13:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556562136;
	bh=kmSz5nFl5Y5s4ICvzK7bubODSDKhHBRjXGa5sZbvoeo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rvZtHEYxKCSi0tTr5lOsSXJj/tKaIKUbwRo5f+2q+mzKqXn6ycWJfuWQGneZLGcpp
	i5eQcUtm0R5ASAzClFZ7svaiDGolPK3Z1oHWo31xCvqKHU/CbWzqvE+43wUuoTp4o9
	C4ywM0nvMTzHdo1XR+4UUZkLQjseq/ciAhLhOSZw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TIMGaa094960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2019 13:22:16 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 13:22:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 13:22:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TIMFwT124580;
	Mon, 29 Apr 2019 13:22:16 -0500
Date: Mon, 29 Apr 2019 14:22:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190429182215.GE19665@beryl>
References: <1556561699-57509-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1556561699-57509-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH v3] ti-cgt-arm-native: Upgrade to 18.12.1.LTS
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
X-List-Received-Date: Mon, 29 Apr 2019 18:22:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged into next for testing.

On Mon, Apr 29, 2019 at 02:14:59PM -0400, Mahesh Radhakrishnan wrote:
> The checksum changed due to version & year changes. The licenses remain
> the same
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  v3 - Updating the commit description citing no license change
>  v2 - Correcting the LIC_CHECKSUM
> 
>  .../{ti-cgt-arm-native_18.1.5.bb => ti-cgt-arm-native_18.12.1.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt-arm-native_18.1.5.bb => ti-cgt-arm-native_18.12.1.bb} (9%)
> 
> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
> similarity index 9%
> rename from recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> rename to recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
> index 0ed1939..7df9660 100644
> --- a/recipes-ti/devtools/ti-cgt-arm-native_18.1.5.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm-native_18.12.1.bb
> @@ -1,6 +1,6 @@
>  include ti-cgt-arm.inc
>  
> -LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3faed35326711d6596f0377279323df1"
> +LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
>  
> -BINFILE_MD5 = "d0559bccc323002a9256dd68e1d223ab"
> -BINFILE_SHA256 = "8462eb7ce837274582721ed75c73928865d7678aca23b30fde962cdd36c21414"
> +BINFILE_MD5 = "af2378cf8d5d6f200ef3329f5a065529"
> +BINFILE_SHA256 = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

