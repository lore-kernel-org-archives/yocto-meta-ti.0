Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8573FE00C08; Thu,  3 Mar 2016 19:02:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D099E00BEF
	for <meta-ti@yoctoproject.org>; Thu,  3 Mar 2016 19:02:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2432g27019697
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 21:02:42 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2432g96005296
	for <meta-ti@yoctoproject.org>; Thu, 3 Mar 2016 21:02:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Mar 2016 21:02:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2432fxR013578;
	Thu, 3 Mar 2016 21:02:41 -0600
Date: Thu, 3 Mar 2016 22:02:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Justin Sobota <jsobota@ti.com>
Message-ID: <20160304030225.GT7505@edge>
References: <1457048726-16687-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
In-Reply-To: <1457048726-16687-1-git-send-email-jsobota@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-sysbios: Update to 6.45.01.29
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
X-List-Received-Date: Fri, 04 Mar 2016 03:02:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Justin,

Any reason these patches don't replace the version, but add a new one?

-- 
Denys


On Thu, Mar 03, 2016 at 06:45:25PM -0500, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>  recipes-ti/bios/ti-sysbios_6.45.01.29.bb |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> 
> diff --git a/recipes-ti/bios/ti-sysbios_6.45.01.29.bb b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> new file mode 100644
> index 0000000..6ab4e27
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.45.01.29.bb
> @@ -0,0 +1,12 @@
> +require recipes-ti/bios/ti-sysbios.inc
> +
> +PV = "6_45_01_29"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=dbcd89745f1745f24ace8171a96ed493"
> +
> +SRC_URI[sysbiosbin.md5sum] = "16cf6dc3c5cc9d2b877fa7d81dd12150"
> +SRC_URI[sysbiosbin.sha256sum] = "efaf5f1d725f3fd06e45476109b1124c74c16c39c870d12929e071047c3e5a22"
> +
> +TI_BIN_UNPK_CMDS=""
> +TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> -- 
> 1.7.10.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

