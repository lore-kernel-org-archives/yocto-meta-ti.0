Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60221E00D5F; Tue, 21 May 2019 12:07:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF3CFE00D32
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 12:07:16 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4LJ7GkB109773
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 14:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558465636;
	bh=uACareyPnPRc6R5yll3LmXg2eQIMMb7+YzXbPcT++eY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IhFjtz3ANidjxabzqlmYhCJSSFkNmHo442m29H/dErtd4RzOTLiFhMVD2eXoAkk3H
	ExL8gAk4R/Hw5qIe52+H5AZg/lli3BD3/QALijcHp9NLkzeBQWDHP3LKoRYZ1ugJNi
	JfEFnPWFlotSoyKFCUc3rC97Tz6Z5GBxxFvXKEB0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4LJ7Gkx086226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 14:07:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 21 May 2019 14:07:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 21 May 2019 14:07:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4LJ7FVB075011;
	Tue, 21 May 2019 14:07:15 -0500
Date: Tue, 21 May 2019 15:07:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20190521190715.GC19550@beryl>
References: <20190521184613.18443-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190521184613.18443-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-ti-staging: update to ti2019.01-rc5 tag
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
X-List-Received-Date: Tue, 21 May 2019 19:07:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 21, 2019 at 01:46:13PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
> index ac219376..6ba8e24e 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r10"
> +PR = "r11"
>  
>  BRANCH = "ti-u-boot-2019.01"
>  
> -SRCREV = "859e3aec28a8f9de80f1abc0de63de50bfe513de"
> +SRCREV = "291330731de984d05401cbab3d925818ebf7588b"

Wrong commit.


> 2.21.0.5.gaeb582a983
> 

