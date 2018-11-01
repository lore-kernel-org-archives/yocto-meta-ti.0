Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C657EE00C10; Thu,  1 Nov 2018 14:21:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A349E00A10
	for <meta-ti@yoctoproject.org>; Thu,  1 Nov 2018 14:21:43 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA1LLgvh107385
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:21:42 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA1LLg4B063525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 1 Nov 2018 16:21:42 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 1 Nov 2018 16:21:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 1 Nov 2018 16:21:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA1LLgG7027480;
	Thu, 1 Nov 2018 16:21:42 -0500
Date: Thu, 1 Nov 2018 17:21:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20181101212142.GK27560@beryl>
References: <1541106208-26108-1-git-send-email-m-radhakrishnan2@ti.com>
	<1541106208-26108-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1541106208-26108-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] ti-cgt-arm-native: Update to 16.9.9
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
X-List-Received-Date: Thu, 01 Nov 2018 21:21:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Have you tested it?

ERROR: ti-cgt-arm-native-16.9.9-r2 do_populate_lic: QA Issue: ti-cgt-arm-native: The LIC_FILES_CHKSUM does not match for file://ti-cgt-arm_16.9.9.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b
ti-cgt-arm-native: The new md5 checksum is 1c0dc8c15d8c4768e399b9ce7651c25e


On Thu, Nov 01, 2018 at 05:03:28PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-cgt-arm-native_16.9.2.bb => ti-cgt-arm-native_16.9.9.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.2.bb => ti-cgt-arm-native_16.9.9.bb} (47%)
> 
> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb b/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
> similarity index 47%
> rename from recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
> rename to recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
> index 8ff29ca..b804a1c 100644
> --- a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bb
> @@ -2,5 +2,5 @@ include ti-cgt-arm.inc
>  
>  LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
>  
> -BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
> -BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
> +BINFILE_MD5 = "ccae16e9c6fc3749e7da49d3a2b6fb44"
> +BINFILE_SHA256 = "13b66686cc012af6f2e7f021099b5bc735a461d8eb254a2b0edef0fd8b26e81e"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

