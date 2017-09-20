Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5CEFEE00A96; Wed, 20 Sep 2017 13:00:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3D5AE00970
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 13:00:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KK0A9b014669
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 15:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505937611;
	bh=tExnF6oNllXTW/kxSPnwFFQp2M/BZbcDU/sxxVYmqNU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZBQr+z2eVBZoojVfdrkkq2VIsYVzpitjYFsN9sGsRi/4plMDbhokMbB/2DOhC8MgC
	6BlIamwgt0o7amNXlSxYQ6UXQBaLtRNZTm0IZqOqJ0aDdo+xIqGv6OV65+IRCrZ2t8
	iT9yrA3gK4REsNYfYhORiJ2f+52vi+B9tvGfydUY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KK0ALf031744
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 15:00:10 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 15:00:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 15:00:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KK0AJD022655;
	Wed, 20 Sep 2017 15:00:10 -0500
Date: Wed, 20 Sep 2017 15:59:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170920195954.GZ26843@edge>
References: <1505842486-12219-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1505842486-12219-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] uio-test_pruss: Update to new version 1.0.2.0
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
X-List-Received-Date: Wed, 20 Sep 2017 20:00:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Unfortunately, it missed the final RC4 tag on Monday, so I'll merge it into 
morty-next-rel.

-- 
Denys


On Tue, Sep 19, 2017 at 01:34:46PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/uio-test-pruss/uio-test-pruss_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> index 724ca07..0fae726 100644
> --- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> +++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Provides test pruss firmware for uio based tests"
>  LICENSE = "BSD-3-Clause"
> -PV = "1.0.1.0"
> +PV = "1.0.2.0"
>  require recipes-ti/includes/ti-paths.inc
>  
>  S = "${WORKDIR}/git"
> @@ -14,12 +14,12 @@ UIO_TEST_PRUSS_GIT_URI = "git://git.ti.com/processor-sdk/uio-test-pruss.git"
>  UIO_TEST_PRUSS_GIT_PROTOCOL = "git"
>  SRC_URI = "${UIO_TEST_PRUSS_GIT_URI};protocol=${UIO_TEST_PRUSS_GIT_PROTOCOL};branch=${BRANCH}"
>  
> -# Corresponds to version 01.00.01.00
> -UIO_TEST_PRUSS_SRCREV = "72f7454c2460bd7d52dab70631b38bf5d3585542"
> +# Corresponds to version 01.00.02.00
> +UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
>  
>  SRCREV = "${UIO_TEST_PRUSS_SRCREV}"
>  
> -PR = "r2"
> +PR = "r0"
>  
>  COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

