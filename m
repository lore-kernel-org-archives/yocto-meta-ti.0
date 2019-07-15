Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE520E00D35; Mon, 15 Jul 2019 12:52:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1637DE00BF7
	for <meta-ti@yoctoproject.org>; Mon, 15 Jul 2019 12:52:25 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FJqO3s026201;
	Mon, 15 Jul 2019 14:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563220344;
	bh=n+S3UpQjgHC0SHyiFiVVFN2xKNPCwxO8rnvKKmq01wg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QeLanokrtSV3WX2qsQaaZvt1FolRFROn8/wswwD/jEEvYKTN7Xs7/UbYd57OM2wJP
	Mr38acu0JcrNVPIjq7Cw1Bu2DBb6yNNBaS0BfpmX/TPTlGFN8IzOMyzjDm9RHKsUau
	AAZKjrGTQiRwUdQ3u896NAzIWGwD9GYdw1/O7b/E=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FJqOU7017038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jul 2019 14:52:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 14:52:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 14:52:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FJqO3U026020;
	Mon, 15 Jul 2019 14:52:24 -0500
Date: Mon, 15 Jul 2019 15:52:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190715195224.GG9038@beryl>
References: <20190713004324.12695-1-raj.khem@gmail.com>
	<20190713004324.12695-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190713004324.12695-2-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/4] jailhouse: Limit OE architectures to supported ones
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
X-List-Received-Date: Mon, 15 Jul 2019 19:52:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 12, 2019 at 05:43:22PM -0700, Khem Raj wrote:
> Fixes
> ERROR: cannot map 'mips' to a jailhouse supported architecture
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-kernel/jailhouse/jailhouse-arch.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse-arch.inc b/recipes-kernel/jailhouse/jailhouse-arch.inc
> index e06ec231..0546fa26 100644
> --- a/recipes-kernel/jailhouse/jailhouse-arch.inc
> +++ b/recipes-kernel/jailhouse/jailhouse-arch.inc
> @@ -18,3 +18,6 @@ def map_jh_arch(a, d):
>          bb.error("cannot map '%s' to a jailhouse supported architecture" % a)
>  
>  export JH_ARCH = "${@map_jh_arch(d.getVar('TARGET_ARCH', True), d)}"
> +
> +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
> +

Applying: jailhouse: Limit OE architectures to supported ones
.git/rebase-apply/patch:15: new blank line at EOF.
+
warning: 1 line adds whitespace errors.


I'll fix it myself.


> -- 
> 2.22.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

