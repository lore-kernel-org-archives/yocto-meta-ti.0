Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2C13E00BC0; Tue, 25 Jul 2017 07:14:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABC62E00B76
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 07:14:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6PEEscw001319
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500992094;
	bh=AzNvfaE5iQ+ax9Ltumr/zMt2XEdJjSFIm5CZBqLtI34=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=A0T5ifvuFJ9YuIgiX40T11Wbb+uhWFDBPeuXX/7wrEsvSmOPs8KjXkGNFMJVac4mG
	w2XVUTfAQvSrfHRq+l2WNb3Ff63uFAa+iNtxz8QiwyZ8NRwkCQMZEQjsHR7WPzEWFj
	INVfBbEcuNUH5QNB0KDOBGVtTReqSl8IzK3XzBn0=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PEEsKC027970
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:14:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Jul 2017 09:14:54 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PEEs3S001802;
	Tue, 25 Jul 2017 09:14:54 -0500
To: Ivan Pang <i-pang@ti.com>, <meta-ti@yoctoproject.org>
References: <1500935470-11179-1-git-send-email-i-pang@ti.com>
	<1500935470-11179-2-git-send-email-i-pang@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3cbd5766-d1c7-f8e0-10aa-a072492e8565@ti.com>
Date: Tue, 25 Jul 2017 10:14:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500935470-11179-2-git-send-email-i-pang@ti.com>
Subject: Re: [PATCH 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
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
X-List-Received-Date: Tue, 25 Jul 2017 14:14:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The "target" class of this recipe does not appear to be supported (i.e. 
no ARM binary package). Shoudl this be native only, similar to ti-cgt-arm?


On 7/24/2017 6:31 PM, Ivan Pang wrote:
> This recipe specifically installs the 7.x.x series of TI CGT6x.
>
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>   recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb | 38 ++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
>
> diff --git a/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> new file mode 100644
> index 0000000..51d359e
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "TI DSP Code Generation Tools"
> +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> +LICENSE = "TI"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> +
> +PE = "0"
> +PR = "r0"
> +
> +S = "${WORKDIR}/c6000_7.4.16"
> +
> +require recipes-ti/includes/ti-paths.inc
> +require recipes-ti/includes/ti-unpack.inc
> +
> +BINFILE = "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
> +BINFILE_NAME = "cgt6x_7.4.16_x86_installer"
> +TI_BIN_UNPK_ARGS = "--prefix ${WORKDIR} --mode unattended"
> +TI_BIN_UNPK_CMDS=""
> +
> +SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
> +
> +SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] = "21ca55c5b1f6b2d8d4fb7570d5eb5513"
> +SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] = "baa0d1ef20397383f99f45068a6d160963a01419d42fbbb851263b54c91df82f"
> +
> +do_install() {
> +    install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
> +    cp -r ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
> +}
> +
> +FILES_${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN} += "arch staticdev"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"


