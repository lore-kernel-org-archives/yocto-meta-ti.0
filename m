Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34DC0E00C25; Tue,  2 Jul 2019 11:08:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 933CFE003C1
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 11:08:52 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62I8qZf011636
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 13:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562090932;
	bh=C0nA5QaCjXBtp0A8/vm4Wd02sGjK69PfQj1ODp9vqms=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=OWHy2m6RdZg7Uby/exNG4wHTI9XFxDomRQ2cU2fAFDZW+MSDKm4yvfORj85Hej/Zf
	dcXPveK0uW63MylYmQxRrxKHrHTs3W8af9dRja2XcMmQkDVur6ttMaJvR16HMUnUFs
	s9jADIhamELU7wjrKf3hKGDwtYaBDU5idbNbnvQw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62I8qUn026116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 13:08:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 13:08:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 13:08:51 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62I8pau075613;
	Tue, 2 Jul 2019 13:08:51 -0500
To: Subhajit Paul <subhajit_paul@ti.com>, <meta-ti@yoctoproject.org>
References: <1562090231-28810-1-git-send-email-subhajit_paul@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0464c465-dd67-62cc-d5e9-5d27934e027f@ti.com>
Date: Tue, 2 Jul 2019 13:08:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562090231-28810-1-git-send-email-subhajit_paul@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH V2] ti-display-sharing: add recipe for fw integration
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
X-List-Received-Date: Tue, 02 Jul 2019 18:08:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/2/19 12:57 PM, Subhajit Paul wrote:
> Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
> ---
>   .../ti-display-sharing-firmware_git.bb             | 46 ++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb
>
> diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb
> new file mode 100644
> index 0000000..113102e
> --- /dev/null
> +++ b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-firmware_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "TI Display Sharing Firmware Packaging recipe"
> +
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +
> +PV = "00.09.00.00-git${SRCPV}"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit deploy
> +inherit update-alternatives
> +
> +PROTOCOL = "git"
> +BRANCH = "ti-linux-firmware"
> +SRCREV = "4a86f16df9b44798851e51fa465825710cda76cf"
> +
> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TI_DISP_SHARE_FW_DIR = "${S}/ti-display-sharing/"
> +TI_DISP_SHARE_FW_FILENAME = "ti-display-sharing-j721e.bin"
> +
> +# make sure that lib/firmware, and all its contents are part of the package
> +FILES_${PN} += "${base_libdir}/firmware"
> +
> +do_install() {
> +  install -d ${D}${base_libdir}/firmware
> +  install -m 0755 ${TI_DISP_SHARE_FW_DIR}/${TI_DISP_SHARE_FW_FILENAME} ${D}${base_libdir}/firmware
> +}
> +
> +TARGET_MAIN_R5FSS0_1 = "j7-main-r5f0_1-fw"
> +ALTERNATIVE_${PN} = "j7-main-r5f0_1-fw"
> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TI_DISP_SHARE_FW_FILENAME}"
> +ALTERNATIVE_PRIORITY = "9"
> +
> +# This is used to prevent the build system to strip the executables
> +INHIBIT_PACKAGE_STRIP = "1"
> +# This is used to prevent the build system to split the debug info in a separate file
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
> +INSANE_SKIP_${PN} += "arch"
> +
> +# we don't want to configure and build the source code
> +do_compile[noexec] = "1"
> +do_configure[noexec] = "1"


Reviewed-by: Dan Murphy <dmurphy@ti.com>


