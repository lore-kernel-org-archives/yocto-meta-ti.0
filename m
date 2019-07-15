Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFB71E00D3F; Mon, 15 Jul 2019 13:01:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D510E00D35
	for <meta-ti@yoctoproject.org>; Mon, 15 Jul 2019 13:01:52 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FK1pNU028983;
	Mon, 15 Jul 2019 15:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563220911;
	bh=R9pKwbNy7wc2uLy9K17NYkjclKIElkNdzif0tzDoqrA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eLw0Is86JPB84yeY+oKOxEK2ApzcTTByG6PBW2V8unro5WFUCDm08okdCPmWUB/g6
	GGFOn13TJ0WT/2MkvZ3VazoF6+Y78voOO21/m7KcoB0omyQ6pqHg0NSQ7Tig8S81qy
	9LRqgUyIQzUdbbTDPFMM5HwLkYWpYfeyACAFDsxk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FK1pK3061124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jul 2019 15:01:51 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 15:01:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 15:01:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FK1poe100824;
	Mon, 15 Jul 2019 15:01:51 -0500
Date: Mon, 15 Jul 2019 16:01:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190715200151.GH9038@beryl>
References: <20190713005955.6870-1-raj.khem@gmail.com>
	<20190713005955.6870-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190713005955.6870-2-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] amx3-cm3,u-boot-ti: Pin to gcc compiler
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
X-List-Received-Date: Mon, 15 Jul 2019 20:01:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 12, 2019 at 05:59:55PM -0700, Khem Raj wrote:
> Using clang as default compiler fails to build these
> since these packages explicitly asks for gcc as compiler
> this ensures that we meet that demand
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 2 ++
>  recipes-bsp/u-boot/u-boot-ti.inc            | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> index 79166ca9..196b11b9 100644
> --- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> +++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
> @@ -26,3 +26,5 @@ do_install() {
>  FILES_${PN} += "${base_libdir}/firmware"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
> +TOOLCHAIN = "gcc"
> +
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index b66a7a6f..36746826 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -370,3 +370,6 @@ do_deploy_append_keystone () {
>  		fi
>  	fi
>  }
> +
> +TOOLCHAIN = "gcc"
> +

Applying: amx3-cm3,u-boot-ti: Pin to gcc compiler
.git/rebase-apply/patch:15: new blank line at EOF.
+
.git/rebase-apply/patch:26: new blank line at EOF.
+
warning: 2 lines add whitespace errors.


> -- 
> 2.22.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

