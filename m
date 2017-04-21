Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CF32E00AD5; Fri, 21 Apr 2017 07:32:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2861BE00A30
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 07:32:25 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3LEWF1p001130
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 09:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492785135;
	bh=fPYfdrFCOJOk7BAwOnDkq3OOSvoo7O4zypS5iZRlxnA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=J0K7QSJ4n+Eb79rWBKIP0eO0qGFJ9MdG8NDOXHuKzwpJd4onKKbbVt6EIjmck+Aj9
	F6L4Bqdg69y3bLFgvPBFJZqGmUSXtnlSufTwzxIwgxej5oXnepjaoEwI9clmC/Dt8T
	/45Qx9+89T1O/emf1EvEYxNS0076iJ+UXSc4NhQk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3LEWASN015983
	for <meta-ti@yoctoproject.org>; Fri, 21 Apr 2017 09:32:10 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Apr 2017 09:32:09 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3LEW9XJ026288;
	Fri, 21 Apr 2017 09:32:09 -0500
To: Karthik Ramanan <a0393906@ti.com>, <meta-ti@yoctoproject.org>
References: <1492784105-58653-1-git-send-email-a0393906@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bc8f561f-870e-c493-1696-ab2910b091ce@ti.com>
Date: Fri, 21 Apr 2017 10:32:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1492784105-58653-1-git-send-email-a0393906@ti.com>
Subject: Re: [morty PATCH v2 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Fri, 21 Apr 2017 14:32:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Karthik,

A couple concerns below.

Thanks,

Jake


On 4/21/2017 10:15 AM, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>   recipes-ti/devtools/ti-cgt-arm.bb  |  8 ++++++++
>   recipes-ti/devtools/ti-cgt-arm.inc | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 recipes-ti/devtools/ti-cgt-arm.bb
>   create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
>
> diff --git a/recipes-ti/devtools/ti-cgt-arm.bb b/recipes-ti/devtools/ti-cgt-arm.bb
> new file mode 100644
> index 0000000..82c1903
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-arm.bb
> @@ -0,0 +1,8 @@
> +include ti-cgt-arm.inc
> +
> +LIC_FILES_CHKSUM = "file://${PN}_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
> +
> +PV = "16.9.2"

Would it be better to have this in the recipe filename? I'm not sure if 
there is a preference.

> +
> +BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
> +BINFILE_SHA256 = "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
> new file mode 100644
> index 0000000..3897b2e
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
> @@ -0,0 +1,36 @@
> +SUMMARY= "TI ARM Code Generation Tools"
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
> +
> +require recipes-ti/includes/ti-unpack.inc
> +require recipes-ti/includes/ti-staging.inc
> +require recipes-ti/includes/ti-paths.inc
> +
> +S = "${WORKDIR}/ti-cgt-arm-${PV}"
> +
> +SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
> +
> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
> +TI_BIN_UNPK_CMDS = ""
> +
> +do_install() {
> +    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> +    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> +}
> +
> +SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
> +SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
> +
> +BINFILE_NAME = "cgt_arm_installer"
> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> +
> +FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> +
> +BBCLASSEXTEND = "native nativesdk"

It appears that there is not support for the "target" class as the 
installer is for the x86 architecture.

> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +INSANE_SKIP_${PN} += "arch staticdev"


