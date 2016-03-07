Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACCF3E00894; Mon,  7 Mar 2016 10:39:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA4D7E008DB
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 10:39:45 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u27IdjlF000905
	for <meta-ti@yoctoproject.org>; Mon, 7 Mar 2016 12:39:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27IdjuN018348
	for <meta-ti@yoctoproject.org>; Mon, 7 Mar 2016 12:39:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Mar 2016 12:39:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27IdjHw030226;
	Mon, 7 Mar 2016 12:39:45 -0600
Date: Mon, 7 Mar 2016 13:39:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Justin Sobota <jsobota@ti.com>
Message-ID: <20160307183929.GA14393@edge>
References: <1457375774-27214-1-git-send-email-jsobota@ti.com>
	<1457375774-27214-2-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
In-Reply-To: <1457375774-27214-2-git-send-email-jsobota@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 2/2] ti-xdctools: Update to verion 3.32.00.06
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
X-List-Received-Date: Mon, 07 Mar 2016 18:39:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 07, 2016 at 01:36:14PM -0500, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
> V2 Changes: Removed old version and submitted with -C01 so new version is detected as copy of old
> 
>  .../{ti-xdctools_3.31.02.38.bb => ti-xdctools_3.32.00.06.bb} |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename recipes-ti/devtools/{ti-xdctools_3.31.02.38.bb => ti-xdctools_3.32.00.06.bb} (22%)
> 
> diff --git a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
> similarity index 22%
> rename from recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
> rename to recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
> index 5e970ee..fb0c123 100644
> --- a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
> +++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
> @@ -1,9 +1,9 @@
> -require ti-xdctools-core.inc
> +require recipes-ti/devtools/ti-xdctools-core.inc
>  
> -PV = "3_31_02_38"
> +PV = "3_32_00_06"
>  PR = "r0"
>  
> -LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=9dbb0095cdb8b35508b344aa4f1de333"
> +LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=732d986a63b648562f3e658b1df43036"

Why did the license checksum change? Are there any changes to the license 
itself?


> -SRC_URI[xdczip.md5sum] = "c76b3d90c3e25d199765557e393d165b"
> -SRC_URI[xdczip.sha256sum] = "c0e1f6911f2294bfb76471fac1a0ceac3e89c7eb1300f84d2571bf78cb62a7d2"
> +SRC_URI[xdczip.md5sum] = "93127f4c2f35d94b6c8e5a52b79c38ae"
> +SRC_URI[xdczip.sha256sum] = "d6f38a7f846ae4b1478554d75fc5f72cf677a1e2f348e214a725d1e849bd39c7"
> -- 
> 1.7.10.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

