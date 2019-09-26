Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85B8BE00C9B; Thu, 26 Sep 2019 09:13:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F466E0084E
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 09:13:12 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QGDAaD114798
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569514390;
	bh=dp9mnyJBOmlBKe9ia2ZkHYsvQvwkc3THe5PcdDliHdM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZNRcRKxtFfFuH/ze/zPryUNVz/4O+T7OudZtJx2oGkuZdJco6+NmMNrlIeFqYzkA3
	Rjlhn+kSvLqTCWIkHw9WxGjtBpyCPeYIKrnLh1Gk3YSQNuPnb5Lg/q6G1pTae2dxUc
	T3B3yQGB+RPczsxRISPhp74uY0pUU2CZgd96sQ/M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QGDAVG003475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:13:10 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 11:13:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 11:13:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QGDA1D002709;
	Thu, 26 Sep 2019 11:13:10 -0500
Date: Thu, 26 Sep 2019 12:13:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190926161310.GB5386@beryl>
References: <1569514059-8832-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1569514059-8832-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master PATCH v1] recipes-kernel: jailhouse: update SRCREV to ti2019.04-rc2 tag
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
X-List-Received-Date: Thu, 26 Sep 2019 16:13:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 26, 2019 at 09:37:39PM +0530, Nikhil Devshatwar wrote:
> /work/nikhil/ybd/k3-yocto-26-Sep/sources/meta-ti/recipes-kernel/jailhouse/jailhouse_git.bb

What's this for?


> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 32aecf8..409b325 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>  "
>  
>  PV = "0.10+git${SRCPV}"
> -SRCREV = "6dce20f902f73fe9ce53ba0c41262a4defa8d328"
> +SRCREV = "8858ba60ab078d8e3e5317fd644f09c560775a99"
>  BRANCH = "ti-jailhouse-0.10"
>  
>  SRC_URI = " \
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

