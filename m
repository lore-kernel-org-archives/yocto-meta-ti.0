Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F265E00D83; Thu, 12 Sep 2019 09:40:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48B10E00D53
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2019 09:40:44 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CGeiHQ030456
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2019 11:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568306444;
	bh=Pc3LdqfodpprPHfderIweAl5tbGo38i6/eG5ULuk6h8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rwtQDSBEH+AQpBtDLY2nFN9cpYtEMh8rtJGJOnE/0g7SpucKvTIgRDWA1x4hsnTEz
	m42oYeeLW78M34/8Yui60LbBDqtsOem6ZOqAOO3pSY98kG8Gf5J10m9903wDfyCl35
	SEWSv4vH/pQcmELDWdkUtrCxUkNEzZZ0al0/7QA8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CGeiOX082846
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2019 11:40:44 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 12 Sep 2019 11:40:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 11:40:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CGeh8x083614;
	Thu, 12 Sep 2019 11:40:43 -0500
Date: Thu, 12 Sep 2019 12:40:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Santhana Bharathi <santa@ti.com>
Message-ID: <20190912164043.GF28369@beryl>
References: <1568306045-118503-1-git-send-email-santa@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568306045-118503-1-git-send-email-santa@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, prasad.jondhale@ti.com
Subject: Re: [thud][PATCH] cpsw9g-eth-fw: Add CPSW 9G support for J7
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
X-List-Received-Date: Thu, 12 Sep 2019 16:40:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, but please subscribe to the list before posting.


On Thu, Sep 12, 2019 at 10:04:05PM +0530, Santhana Bharathi wrote:
> Signed-off-by: Santhana Bharathi <santa@ti.com>
> ---
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 47 ++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> 
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> new file mode 100644
> index 0000000..8677034
> --- /dev/null
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -0,0 +1,47 @@
> +Summary = "R5 PSDK CPSW9G ethernet switch firmware"

Uppercase


> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
> +
> +PV = "1.0-git${SRCPV}"

1.0+git...


> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit deploy
> +inherit update-alternatives
> +
> +PROTOCOL = "git"
> +BRANCH = "master"
> +SRCREV = "df7f399319ee401dfbda9317878128a0f718507f"
> +
> +SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +CPSW9G_FW_DIR = "${S}/ethfw"
> +CPSW9G_FW_FILENAME = "app_remoteswitchcfg_server.xer5f"
> +
> +# make sure that lib/firmware, and all its contents are part of the package
> +FILES_${PN} += "${base_libdir}/firmware"
> +
> +do_install() {
> +  install -d ${D}${base_libdir}/firmware
> +  install -m 0755 ${CPSW9G_FW_DIR}/${CPSW9G_FW_FILENAME} ${D}${base_libdir}/firmware
> +}
> +
> +TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
> +ALTERNATIVE_${PN} = "j7-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${CPSW9G_FW_FILENAME}"
> +ALTERNATIVE_PRIORITY = "17"
> +
> +# This is used to prevent the build system to strip the executables
> +INHIBIT_PACKAGE_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> +INSANE_SKIP_${PN} += "arch"

No need to comment each and every line here - those comments were provided in 
the example to explain what they do, but they don't need to be copied over and 
over in every new recipe...


> +# we don't want to configure and build the source code
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
> +
> -- 
> 1.9.1
> 

