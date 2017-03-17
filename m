Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59298E009CF; Fri, 17 Mar 2017 10:04:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01AC0E00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:04:41 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE56B20B7A;
	Fri, 17 Mar 2017 17:04:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TUb-YLahMCep; Fri, 17 Mar 2017 17:04:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5032208FB;
	Fri, 17 Mar 2017 17:04:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7EA4A1623E8; Fri, 17 Mar 2017 13:04:39 -0400 (EDT)
Date: Fri, 17 Mar 2017 13:04:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20170317170439.GR15664@denix.org>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170317163653.13127-1-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty-next][PATCH 1/2] kselftests: add libpcap-ng dependency
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
X-List-Received-Date: Fri, 17 Mar 2017 17:04:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fathi,

Since I haven't merged morty-next anywhere yet, I can rebase and modify my 
previous patch to not do a workaround for capabilities tests...

On Fri, Mar 17, 2017 at 06:36:52PM +0200, Fathi Boudra wrote:
> libpcap-ng is required to build capabilities tests.
> 
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
> index a7b4ba67..dd94a65b 100644
> --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
> @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEPENDS = "libcap popt rsync-native"
> +DEPENDS = "libcap libcap-ng popt rsync-native"
>  
>  inherit kernel-arch
>  
> @@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
>  FILES_${PN}-zram = "${bindir}/kselftests/zram"
>  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>  
> -ALLOW_EMPTY_${PN}-capabilities = "1"
> -
>  RDEPENDS_${PN}-cpu-hotplug += "bash"
>  RDEPENDS_${PN}-efivarfs += "bash"
>  RDEPENDS_${PN}-memory-hotplug += "bash"
> -- 
> 2.11.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

