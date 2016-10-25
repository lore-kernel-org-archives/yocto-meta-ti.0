Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8824BE00CC2; Tue, 25 Oct 2016 16:52:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C17B3E00B93
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 16:52:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PNqlOU020373
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 18:52:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PNqlAU027401
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 18:52:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 18:52:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PNqlEr032470;
	Tue, 25 Oct 2016 18:52:47 -0500
Date: Tue, 25 Oct 2016 19:52:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20161025235246.GV12745@edge>
References: <1477439360-19677-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1477439360-19677-1-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-sysbios: update version to 6.46.1.38
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
X-List-Received-Date: Tue, 25 Oct 2016 23:52:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please pass -M flag to git format-patch.

On Tue, Oct 25, 2016 at 06:49:19PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.45.01.29.bb | 12 ------------
>  recipes-ti/bios/ti-sysbios_6.46.01.38.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 recipes-ti/bios/ti-sysbios_6.45.01.29.bb
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> 
> diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> deleted file mode 100644
> index 6ab4e27..0000000
> --- a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require recipes-ti/bios/ti-sysbios.inc
> -
> -PV = "6_45_01_29"
> -PR = "r0"
> -
> -LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
> -
> -SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
> -SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
> -
> -TI_BIN_UNPK_CMDS=""
> -TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> new file mode 100644
> index 0000000..407b3b4
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> @@ -0,0 +1,12 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV = "6_46_01_38"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
> +
> +SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
> +SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
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

