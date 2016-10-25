Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A07AE00BE7; Tue, 25 Oct 2016 15:51:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAB0AE00A7B
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 15:51:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PMpSJS018746
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:51:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PMpSx0027050
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:51:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 17:51:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PMpRjZ008782;
	Tue, 25 Oct 2016 17:51:27 -0500
Date: Tue, 25 Oct 2016 18:51:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20161025225127.GS12745@edge>
References: <1477433645-16457-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1477433645-16457-1-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-sysbios: updated version to 6.46.1.38
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
X-List-Received-Date: Tue, 25 Oct 2016 22:51:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 25, 2016 at 05:14:04PM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.46.01.38.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.46.01.38.bb

Did you mean to update the version instead of adding a new one?


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

