Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 204F7E0098A; Mon, 16 Sep 2019 10:57:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B9F1E008C8
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:57:34 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GHvXn0118298
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 12:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568656653;
	bh=89kqsUcmGqMcc1xRC7hrHNZD2+RUiBEOYDjTuZO1dTA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HYC0jxFYJH8B4xtDgtYoKyq3Nz7BTqY3nli0cy5kBwcqVojhu3J7Wp973o6swSRDL
	Y/lLI8JBLOj87FwvmXPpj9W7fCBqWcDSsw/FgjEP4wjGLgA7/jsqxagGAbX+Fu0Rrd
	2uYYR0BNjt8lThKKq6CraGDz3ZKH0kZJU8sXzEns=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GHvXiU118068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 12:57:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 12:57:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 12:57:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GHvXJj111873;
	Mon, 16 Sep 2019 12:57:33 -0500
Date: Mon, 16 Sep 2019 13:57:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Santhana Bharathi <santa@ti.com>
Message-ID: <20190916175732.GH26975@beryl>
References: <1568611061-195385-1-git-send-email-santa@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568611061-195385-1-git-send-email-santa@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, nsekhar@ti.com, prasad.jondhale@ti.com
Subject: Re: [thud][PATCH V3] cpsw9g-eth-fw: Add CPSW 9G support for J7
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
X-List-Received-Date: Mon, 16 Sep 2019 17:57:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 16, 2019 at 10:47:41AM +0530, Santhana Bharathi wrote:
> Signed-off-by: Santhana Bharathi <santa@ti.com>
> ---

Thanks. For next time please document patch revision changes here. I.e. what 
changed in v2, what changed in v3, etc. I'll merge this one as is now - no 
need to resubmit.


>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> 
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> new file mode 100644
> index 0000000..29a5f1d
> --- /dev/null
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "R5 PSDK CPSW9G Ethernet Switch Firmware"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
> +
> +PV = "1.0+git${SRCPV}"
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
> +# Ethernet firmware to be loaded on Main R5 core(needs read permission)
> +  install -m 0644 ${CPSW9G_FW_DIR}/${CPSW9G_FW_FILENAME} ${D}${base_libdir}/firmware
> +}
> +
> +TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
> +ALTERNATIVE_${PN} = "j7-main-r5f0_0-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${CPSW9G_FW_FILENAME}"
> +ALTERNATIVE_PRIORITY = "17"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INSANE_SKIP_${PN} += "arch"
> +
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"
> +
> -- 
> 1.9.1
> 

