Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95262E00CCE; Thu, 21 Feb 2019 18:29:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CBECE00B5C
	for <meta-ti@yoctoproject.org>; Thu, 21 Feb 2019 18:29:52 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1M2Tpd0094523
	for <meta-ti@yoctoproject.org>; Thu, 21 Feb 2019 20:29:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550802591;
	bh=M5Lh4jybP0dZSWKnl5jvdXvCV+0XRXExGxTam3k6aH0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wRN8kctlYMgaIXz9nSZLQ3S1KOrRvUgJ+Wfv19LUkcWXaS5cqKFAtOxMAOUCMU1mK
	hNJg5w4fZSJLzFIN2hqJSURCUIbmBhCxt98mlCAo8vMDY9kUGisB/GPBapEytJekzW
	HtLjZUucn3azqiNBwKRcNY1KMjRSmAod/fXHXfSc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1M2Tp5E033990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Feb 2019 20:29:51 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 21 Feb 2019 20:29:50 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 21 Feb 2019 20:29:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1M2Toqu015918;
	Thu, 21 Feb 2019 20:29:50 -0600
Date: Thu, 21 Feb 2019 21:29:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190222022950.GD16391@beryl>
References: <1550671926-8313-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1550671926-8313-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] gcc-arm-none-eabi: extend to nativesdk class
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
X-List-Received-Date: Fri, 22 Feb 2019 02:29:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 20, 2019 at 09:12:06AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>  rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi_6-2017-q1-update.bb} (67%)
> 
> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> similarity index 67%
> rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> rename to recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> index 1140f27..c10ee16 100644
> --- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> @@ -3,7 +3,6 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
>  LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
>  
> -inherit native
>  require recipes-ti/includes/ti-paths.inc
>  
>  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
> @@ -13,6 +12,17 @@ SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6
>  
>  S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
>  
> +# only x86_64 is supported
> +python __anonymous() {
> +    host_arch = d.getVar("HOST_ARCH")
> +
> +    if host_arch != "x86_64":
> +        pkgn = d.getVar("PN")
> +        pkgv = d.getVar("PV")
> +
> +        raise bb.parse.SkipPackage("%s-%s ONLY supported for x86_64 target" % (pkgn, pkgv))
> +}
> +

I've been thinking about this one.
Would it be better to have a common .inc file and 2 one-line native and 
nativesdk recipes that include that .inc file, and avoid __anonymous() 
function altogether?



>  do_install() {
>      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
>      cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> @@ -20,4 +30,6 @@ do_install() {
>  
>  FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
>  
> -INSANE_SKIP_${PN} = "already-stripped"
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

