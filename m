Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2CEAE00AE0; Wed, 19 Apr 2017 12:47:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AE7AE00AD0
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 12:47:34 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3JJlOLF010235
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 14:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492631244;
	bh=Gzs6s/fE2i4S3eO9nAdG044L+Zgn7Xjm/bwQ24aZNRI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cXXVbEjm7QhvitXkqwql3dcNonc+vnm5J52qfPfh6208N8lZrbAtUOI1soLW4UVeB
	w2LiDvOi/4ghAlpXPUUwCLtczMfm43v9PtGUk0z0COy2y5CdEmTQatfFPeH8I2r4cy
	FKW4lzUrLCn5NPciyr+4bMwolyqVp30u2MUt4ND4=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JJlJIQ024611
	for <meta-ti@yoctoproject.org>; Wed, 19 Apr 2017 14:47:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 14:47:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3JJlJgK028345;
	Wed, 19 Apr 2017 14:47:19 -0500
Date: Wed, 19 Apr 2017 15:47:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170419194718.GL3457@edge>
References: <1492597804-77037-1-git-send-email-a0393906@ti.com>
	<1492597804-77037-4-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1492597804-77037-4-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty 4/4] ti-cgt-arm: Update to version 16.9.2
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
X-List-Received-Date: Wed, 19 Apr 2017 19:47:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Since you'd need to completely re-do patch #1, I suggest you squash this 
change as well.


On Wed, Apr 19, 2017 at 04:00:04PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt-arm.bb  | 4 ++--
>  recipes-ti/devtools/ti-cgt-arm.inc | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/devtools/ti-cgt-arm.bb b/recipes-ti/devtools/ti-cgt-arm.bb
> index 464374d..dbe61d4 100644
> --- a/recipes-ti/devtools/ti-cgt-arm.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm.bb
> @@ -10,8 +10,8 @@ TI_BIN_UNPK_ARGS = "--prefix ${S}"
>  TI_BIN_UNPK_CMDS = ""
>  
>  BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> -BINFILE_MD5 = "aa65a078eeddbf10e8e132a4cf1d58f0"
> -BINFILE_SHA256 = "a372fd6f7b2608e11326b5c7438311aa37c7fbca0728b158cb9064a0666a8a05"
> +BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
> +BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
>  
>  do_install() {
>      install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
> index 195d59e..c14580c 100644
> --- a/recipes-ti/devtools/ti-cgt-arm.inc
> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> @@ -4,7 +4,7 @@ LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0
>  
>  LIC_FILES_CHKSUM = "file://../${BINFILE};md5=${BINFILE_MD5}"
>  
> -PV = "16.9.1"
> +PV = "16.9.2"
>  PE = "0"
>  
>  BINFILE_NAME = "cgt_arm_installer"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

