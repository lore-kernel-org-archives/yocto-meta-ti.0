Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 567AEE00519; Mon, 27 Aug 2018 13:35:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86EA2E00519
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 13:35:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7RKZoEg104689
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 15:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535402150;
	bh=jbu2WQI1bPGiatBUR6J0oKPsfQ9iDg1pGTx6ZI9uzzU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KHO90k+5Sl/98Lp2hGaRuHx0tvQXahUtEYcor2CTZjWtc6DhUH3pAMRSnIEog6po4
	m6m6TE7UCoP4vm0pMDGkhkKXBxf8wK4ZWTUw6MqMoMzJ2ZNo/EiuAKdl3qpymLo/ek
	Luz6WJbs9dP3Z7x0FwWldzCvAdFBykpPn4cMcJWU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RKZoph027820
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 15:35:50 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 27 Aug 2018 15:35:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 27 Aug 2018 15:35:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RKZo6d018143;
	Mon, 27 Aug 2018 15:35:50 -0500
Date: Mon, 27 Aug 2018 16:35:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nick Saulnier <nsaulnier@ti.com>
Message-ID: <20180827203500.GI21923@beryl>
References: <1535339954-20697-1-git-send-email-nsaulnier@ti.com>
MIME-Version: 1.0
In-Reply-To: <1535339954-20697-1-git-send-email-nsaulnier@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v1] pru-icss_git.bb: add am65x examples, Lab_0, 5
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
X-List-Received-Date: Mon, 27 Aug 2018 20:35:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

| make[1]: Entering directory '/OE/arago-rocko-next/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/pru-icss/5.3.0-r1/git/labs'
| make[1]: *** lab_5/solution/PRU_RPMsg_Echo_Interrupt1: No such file or directory.  Stop.
| make[1]: Leaving directory '/OE/arago-rocko-next/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/pru-icss/5.3.0-r1/git/labs'
| Makefile:16: recipe for target 'lab_5/solution/PRU_RPMsg_Echo_Interrupt1' failed
| make: *** [lab_5/solution/PRU_RPMsg_Echo_Interrupt1] Error 2


On Sun, Aug 26, 2018 at 10:19:14PM -0500, Nick Saulnier wrote:
> This updates the commit ID of the PRU Software Support Package
> which is pulled into the SDK. The updated PRU Software Support
> Package includes:
> 
> added am65x resources:
> PRU_Halt example
> PRU_MAC_Multiply_Accum example
> ICSSG header files
> 
> added Lab_0:
> this provides a "Hello World" style beginning Linux example for
> every TI processor with a supported PRU (am335x, am437x, am57x,
> k2g, am65x).
> 
> expanded Lab_5:
> expanded Lab 5 to provide a more advanced PRU Linux example for
> every TI processor with a supported PRU (am335x, am437x, am57x,
> k2g, am65x).
> 
> Kernel 4.14 new features:
> updated resource table for all examples and labs to match the
> new template introduced in kernel 4.14
> 
> Code cleanup/bug fixes:
> update RPMsg examples to provide a more elegent way to provide
> the max message length.
> updated Linker Command files to better match TRM.
> 
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index e150076ec0a2..ff8f4a4ab321 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -8,10 +8,10 @@ inherit update-alternatives
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "1d9249c012005a669a6ffb2f76255d72ed5c0e4c"
> +SRCREV = "78bef8fcc5204129a1da6ba015563c904478f568"
>  
> -PV = "5.2.1"
> -PR = "r2"
> +PV = "5.3.0"
> +PR = "r1"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -- 
> 1.9.1
> 

