Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 022DAE00C1E; Tue, 19 Mar 2019 08:47:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14B5BE00D15
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2019 08:47:37 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2JFlbVl125790
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2019 10:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553010457;
	bh=5xZLOYw3he8/skzrF44KhZ1yInLyTLinTXjwxA8xNHI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SQBPsHQAFcGTXXz5FigG9mA/nZX5xGJPAbwP0aiM4+7uyJ9tlMURBHK/tfODGZEGz
	xoxd9yplN4NOb7lKfdP0CYAdFfJGE2vj/pVmphErgXMEYnxH0k2WSeH2C4g08E+izx
	K3tBr5Zzx5SRvtX3yfqewYuotu7TsPY1a+xvTU3A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2JFlbrm114163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2019 10:47:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 19 Mar 2019 10:47:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Tue, 19 Mar 2019 10:47:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2JFlaDc004705;
	Tue, 19 Mar 2019 10:47:36 -0500
Date: Tue, 19 Mar 2019 11:47:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190319154736.GD3374@beryl>
References: <1552925583-28723-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1552925583-28723-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/thud/master][PATCH] gcc-arm-none-eabi: suppress more QA warnings and errors
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
X-List-Received-Date: Tue, 19 Mar 2019 15:47:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Care to rebase against latest updates? Thanks.

On Mon, Mar 18, 2019 at 12:13:03PM -0400, Jacob Stiffler wrote:
> As this is a pre-built package:
> * Skip the build-deps and file-rdeps checks.
> * Disable package debug split.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> index d08dd2f..b0349af 100644
> --- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> @@ -23,6 +23,7 @@ do_install() {
>  
>  FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
>  
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev build-deps file-rdeps"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

