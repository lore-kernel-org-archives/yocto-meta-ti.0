Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48D7CE00B18; Fri, 16 Jun 2017 08:45:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BCF4E009A0
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 08:45:34 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5GFjYFZ031522
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 10:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497627934;
	bh=fbCCVFD0gMbb0KaWflKqh/YANaqXFmI7lpSyEfxqePE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tHMRHIIT41mNif4YI7Ho82mZHHEwLdmvSkf+haM8GD5giJynBrF3+Zw3+qDm8c//B
	o5ZQZ+XJIS84jWhDvm/d8hxEcIDPMH4OcAcR6wreqjmdmx56FYv96EHP7/Z8YNLbaf
	EP3rpeCL/K9EIRAk22HUht+2Lyb9YsK/4BOvxWis=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5GFjYCF030440
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 10:45:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Jun 2017 10:45:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5GFjY8V021439;
	Fri, 16 Jun 2017 10:45:34 -0500
Date: Fri, 16 Jun 2017 11:45:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20170616154532.GS21219@edge>
References: <1497627256-18932-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1497627256-18932-1-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-sysbios: Upstream version 6.46.5.55
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
X-List-Received-Date: Fri, 16 Jun 2017 15:45:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> ti-sysbios: Upstream version 6.46.5.55

"... upgrade to ..."

Also, please make it a diff - pass -M/-C to git format-patch or send email...

-- 
Denys


On Fri, Jun 16, 2017 at 10:34:16AM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.46.01.38.bb | 12 ------------
>  recipes-ti/bios/ti-sysbios_6.46.05.55.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 recipes-ti/bios/ti-sysbios_6.46.01.38.bb
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.46.05.55.bb
> 
> diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> deleted file mode 100644
> index 407b3b4..0000000
> --- a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require recipes-ti/bios/ti-sysbios.inc
> -
> -PV = "6_46_01_38"
> -PR = "r0"
> -
> -LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
> -
> -SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
> -SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
> -
> -TI_BIN_UNPK_CMDS=""
> -TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> diff --git a/recipes-ti/bios/ti-sysbios_6.46.05.55.bb b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
> new file mode 100644
> index 0000000..e910d53
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
> @@ -0,0 +1,12 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV = "6_46_05_55"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=1c88b63f0ce751d88354de0727623eba"
> +
> +SRC_URI[sysbiosbin.md5sum] = "8182effcbeea90778e393818ec4d65e8"
> +SRC_URI[sysbiosbin.sha256sum] = "2ad3432cafd1a93dd8cd1e56b722c979852d5c72f5defc29843d507cdd7b667a"
> +
> +TI_BIN_UNPK_CMDS=""
> +TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

