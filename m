Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C3C1E00B33; Thu, 18 Jul 2019 13:06:28 -0700 (PDT)
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
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28B69E00A96
	for <meta-ti@yoctoproject.org>; Thu, 18 Jul 2019 13:06:25 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6IK6P6u084794
	for <meta-ti@yoctoproject.org>; Thu, 18 Jul 2019 15:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563480385;
	bh=I8Pff0pG+zA37v7CNTLV0335qa8FNkG0fGUOmxQbkuo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YOE1LNLktAs1ZBG8HjLOiXyyJFVEtOk/tLbL20a5hfRZwAR5z3yHybC4Qp7jGuXby
	Mi+o1BXf5H/HlJGQTfDTNaX4yjZLlWtg96ax8dKZXYqsVY8xelv+Xfzp8jxjIMzXWr
	HMo2O5s10zJF4Q4LWY54dm7WOSTa9Ej0TLeJoMYE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6IK6PPK037760
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 18 Jul 2019 15:06:25 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 18 Jul 2019 15:06:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 18 Jul 2019 15:06:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6IK6PGo062789;
	Thu, 18 Jul 2019 15:06:25 -0500
Date: Thu, 18 Jul 2019 16:06:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <20190718200624.GI15837@beryl>
References: <1563476999-27662-1-git-send-email-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <1563476999-27662-1-git-send-email-praneeth@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] cadence-mhdp-fw: fix firmware license path
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
X-List-Received-Date: Thu, 18 Jul 2019 20:06:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks for catching this copy/paste omission - I'll merge it as soon as merge 
window opens.


On Thu, Jul 18, 2019 at 02:09:59PM -0500, Praneeth Bajjuri wrote:
> update license as defined at
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENCE.cadence
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index a7032720d36c..38a1f82beabf 100644
> --- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Cadence MHDP DP bridge firmware"
>  
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684daf27c852"
> +LICENSE = "BSD-3-Clause | Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
>  
>  PV = "1.2.15"
>  PR = "r0"
> -- 
> 2.7.4
> 

