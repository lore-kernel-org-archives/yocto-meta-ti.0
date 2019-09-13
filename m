Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4920AE009DC; Fri, 13 Sep 2019 12:46:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE4A1E00961
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 12:46:57 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DJkurw008729
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 14:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568404016;
	bh=Grd1nD0GF+Lt42VbNZRVSkkWTJdoApf+ST3+Myjo27U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RavBjDNENzPX4zeYGwGRK4TuBzLU++1Z2sdam9I0ubDSbvUEoxYNmQ1Tzk6J82kmD
	hKx5XIyS+Kn1hmI4TURrPDMH0KeeHscR6+srG87zvL34IjVP8Ry1Cz/1ysTqwVZRtq
	5jR9D1yPJVYikh57PaOMAAaRlZAB8KCAVZD5Lc10=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DJku4l001062
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 14:46:56 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 14:46:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 14:46:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJku9h050582;
	Fri, 13 Sep 2019 14:46:56 -0500
Date: Fri, 13 Sep 2019 15:46:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Santhana Bharathi <santa@ti.com>
Message-ID: <20190913194656.GE8889@beryl>
References: <1568361432-43215-1-git-send-email-santa@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568361432-43215-1-git-send-email-santa@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, nsekhar@ti.com, prasad.jondhale@ti.com
Subject: Re: [thud][PATCH V2] cpsw9g-eth-fw: Add CPSW 9G support for J7
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
X-List-Received-Date: Fri, 13 Sep 2019 19:46:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 13, 2019 at 01:27:12PM +0530, Santhana Bharathi wrote:
> Signed-off-by: Santhana Bharathi <santa@ti.com>
> ---
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 43 ++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> 
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> new file mode 100644
> index 0000000..2c597ff
> --- /dev/null
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -0,0 +1,43 @@
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
> +  install -m 0555 ${CPSW9G_FW_DIR}/${CPSW9G_FW_FILENAME} ${D}${base_libdir}/firmware

0555 doesn't seem right. Standard Unix permissions are 0755 for executables 
and 0644 for regular files. Unless you specifically need something else - 
please explain.


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

