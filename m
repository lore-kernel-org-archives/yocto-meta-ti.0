Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01BCCE00AF2; Sat, 29 Jun 2019 08:19:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC2EBE009CF
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 08:19:47 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5TFJla9120583
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 10:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561821587;
	bh=NoagbmAjBrO2Tr9ZDuHGM+Jmark/luWG7ABbBccMo0s=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=szzVEHh9rKB7O6wwQhDXM+t0gt5t4UjTq2XMHEEL4XgBpO6CPEBQKMWGDP0H4VYCi
	2FDKp2+iRQzfbTVQPdZVrpoiqYLsoTj8oNIzvuMuoj5ujVzAgWRKr0+/GOwPfuHhqI
	706iqE7HT5v1xZDykWT6AFe+8bjaD6qCK96osN+4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5TFJlle019652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 10:19:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 29 Jun 2019 10:19:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 29 Jun 2019 10:19:46 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5TFJk4h052200
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 10:19:46 -0500
To: <meta-ti@yoctoproject.org>
References: <1561724664-7146-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e8e49fd0-8bc4-bfdb-207d-336ccd1abafa@ti.com>
Date: Sat, 29 Jun 2019 11:19:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561724664-7146-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.01][PATCH] csl-rti-dwwdtest-fw: add MCU watchdog test firmware
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
X-List-Received-Date: Sat, 29 Jun 2019 15:19:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2019.01?


Thank you,

Jake

On 6/28/2019 8:24 AM, Jacob Stiffler wrote:
> * add firmware for the R5F core to test the detection of watchdog
>    timeout events to trigger SOC reset though DMSC.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../common-csl-ip/csl-rti-dwwdtest-fw_git.bb       | 77 ++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
>
> diff --git a/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
> new file mode 100644
> index 0000000..55e583b
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/csl-rti-dwwdtest-fw_git.bb
> @@ -0,0 +1,77 @@
> +SUMMARY = "MCU Watchdog test firmware"
> +DESCRIPTION = "Firmware for the R5F core to test the detection of watchdog timeout events to trigger SOC reset though DMSC."
> +
> +require recipes-bsp/common-csl-ip/common-csl-ip.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +LIC_FILES_CHKSUM = "file://../../../COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> +
> +S = "${WORKDIR}/${CSL_GIT_DESTSUFFIX}/example/rti/rti_dwwdtest_app"
> +
> +COMPATIBLE_MACHINE = "am65xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +DEPENDS = "ti-cgt-arm-native \
> +           ti-pdk-build-rtos \
> +           uart-lld-rtos \
> +           board-rtos \
> +           sciclient-rtos \
> +           udma-lld-rtos"
> +
> +export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
> +export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"
> +
> +EXTRA_OEMAKE = "WDT_RESET=enable DEST_ROOT=${S}"
> +
> +do_compile() {
> +    for soc in ${TI_PDK_LIMIT_SOCS}
> +    do
> +        for board in ${TI_PDK_LIMIT_BOARDS}
> +        do
> +            oe_runmake SOC=$soc BOARD=$board
> +        done
> +    done
> +}
> +
> +do_install() {
> +    install -d ${D}${base_libdir}/firmware/rti_dwwdtest
> +
> +    for board in ${TI_PDK_LIMIT_BOARDS}
> +    do
> +        install -d ${D}${base_libdir}/firmware/rti_dwwdtest/$board
> +        install -m 0644 csl_rti_dwwd_test_app/bin/$board/csl_rti_dwwd_test_app_mcu1_0_release.xer5f \
> +                        ${D}${base_libdir}/firmware/rti_dwwdtest/$board
> +    done
> +}
> +
> +# Create separate package for each firmware so we can utilize
> +# update-alternatives.
> +PACKAGES =+ "${PN}-evm ${PN}-idk"
> +RDEPENDS_${PN} = "${PN}-evm ${PN}-idk"
> +ALLOW_EMPTY_${PN} = "1"
> +
> +FILES_${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm"
> +FILES_${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk"
> +
> +# We are packaging R5 firmware
> +INSANE_SKIP_${PN}-evm = "arch"
> +INSANE_SKIP_${PN}-idk = "arch"
> +
> +# Configure update-alternatives as there may be other firmwares provided in an
> +# image.
> +inherit update-alternatives
> +
> +# It might be nice to dynamically declare the following based on
> +# TI_PDK_LIMIT_BOARDS, but that is probably overkill.
> +ALTERNATIVE_${PN}-evm = "am65x-mcu-r5f0_0-fw"
> +ALTERNATIVE_${PN}-idk = "am65x-mcu-r5f0_0-fw"
> +
> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/am65x-mcu-r5f0_0-fw"
> +
> +ALTERNATIVE_TARGET_${PN}-evm = "${base_libdir}/firmware/rti_dwwdtest/am65xx_evm/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
> +ALTERNATIVE_TARGET_${PN}-idk = "${base_libdir}/firmware/rti_dwwdtest/am65xx_idk/csl_rti_dwwd_test_app_mcu1_0_release.xer5f"
> +
> +# Use a lesser priority than ipc example fw
> +# See meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +ALTERNATIVE_PRIORITY_${PN}-evm = "4"
> +ALTERNATIVE_PRIORITY_${PN}-idk = "3"

