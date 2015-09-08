Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28671E00B87; Tue,  8 Sep 2015 15:44:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A21B8E00C11
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 15:44:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t88MiH6G031409
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2015 17:44:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t88MiHNR010088
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2015 17:44:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Sep 2015 17:44:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t88MiGkN016743;
	Tue, 8 Sep 2015 17:44:16 -0500
Date: Tue, 8 Sep 2015 18:44:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20150908224401.GH4305@edge>
References: <1441228144-26221-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1441228144-26221-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-codec-engine: update to version 3.24.00.08
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
X-List-Received-Date: Tue, 08 Sep 2015 22:44:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same here - pushed to master/fido


On Wed, Sep 02, 2015 at 05:09:04PM -0400, Hongmei Gou wrote:
> * version update and install/stage the source tree w/o compiling examples
> 
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../codec-engine/ti-codec-engine_3.24.00.08.bb     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
> 
> diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
> new file mode 100644
> index 0000000..06a7ce1
> --- /dev/null
> +++ b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "Codec Engine for TI ARM/DSP processors"
> +HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-staging.inc
> +
> +PV = "3_24_00_08"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://codec_engine_${PV}_Manifest.html;md5=de7d9c2594a6f3868e42a33b6a748ce7"
> +
> +SRC_URI[cetarball.md5sum] = "d66a8ccbd6cdfe9f735af9f4a07e2b9b"
> +SRC_URI[cetarball.sha256sum] = "ed7b7399903bbf76af06ee6457836f344ad75b903618339bae82b3967f27ffa1"
> +
> +S = "${WORKDIR}/codec_engine_${PV}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
> +
> +do_install() {
> +
> +        # Install/Stage the Source Tree
> +        install -d ${D}${CE_INSTALL_DIR_RECIPE}
> +        cp -pPrf ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN}-dev += "${CE_INSTALL_DIR_RECIPE}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

