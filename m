Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C93FE00924; Fri, 27 Sep 2019 06:13:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE7D7E0084E
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 06:13:44 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RDDiM5012824
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 08:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569590024;
	bh=9mpUo/1aFM9iLcba2+TsgcMWwcLf3uF/NztpiNk5//I=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=EjKGFh2R3MgvR8pOx/xxmPyuDzVyghk/iQNMGazYqDkbPF5LOvprQz1tYYTWQKTWy
	crBAsXOP3R7znpVro14YFJuonr3t8d7BCFGb+NEY8SFddiEmoHQije8o/wOt3pRGOV
	SoPc6+HHCbU2285HxmZgxyNbX4nlvLJ8FCXbQYqw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDDiYq091980
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 08:13:44 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 08:13:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 08:13:43 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RDDhNM004565;
	Fri, 27 Sep 2019 08:13:43 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1569521826-10051-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f85277b8-b9db-8a3d-82a6-2194579eac09@ti.com>
Date: Fri, 27 Sep 2019 09:13:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569521826-10051-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] ti-cgt7x: Update to version 1.2.0
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
X-List-Received-Date: Fri, 27 Sep 2019 13:13:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thank you,

Jake

On 9/26/2019 2:17 PM, Mahesh Radhakrishnan wrote:
> The license checksum changed due to the version, but the license itself
> has not changed since the last release (1.1.0)
> ---
>   .../devtools/{ti-cgt7x_1.1.0.bb => ti-cgt7x_1.2.0.bb}       | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>   rename recipes-ti/devtools/{ti-cgt7x_1.1.0.bb => ti-cgt7x_1.2.0.bb} (68%)
>
> diff --git a/recipes-ti/devtools/ti-cgt7x_1.1.0.bb b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> similarity index 68%
> rename from recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> rename to recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> index 72bbcc1..09178af 100644
> --- a/recipes-ti/devtools/ti-cgt7x_1.1.0.bb
> +++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
> @@ -8,7 +8,7 @@ libraries and standard header files needed to produce a working DSP application.
>   HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
>   LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
>   
> -LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}/C7000_1.0.x_CodeGenerationTools_Manifest.html;md5=3074e433c5d52657076d1d138dfbdaf8"
> +LIC_FILES_CHKSUM = "file://ti-cgt-c7000_${PV}.STS/C7000_Code_Generation_Tools_1.x_manifest.html;md5=f1156d241d104c281bc64a6ec8eadc64"
>   
>   require recipes-ti/includes/ti-unpack.inc
>   require recipes-ti/includes/ti-paths.inc
> @@ -17,23 +17,22 @@ require recipes-ti/includes/ti-paths.inc
>   COMPATIBLE_HOST = "x86_64.*-linux"
>   COMPATIBLE_HOST_class-target = "null"
>   
> -BINFILE = "ti_cgt_c7000_${PV}_linux_installer_x86.bin"
> +BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
>   BINFILE_NAME = "cgt7x_x86_installer"
>   
> -# Please note, "install.source.dir.local" is not a real URL, below files need to be pre-downloaded
> -SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
> +SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=${BINFILE_NAME}"
>   
>   TI_BIN_UNPK_ARGS = "--prefix ${S}"
>   TI_BIN_UNPK_CMDS = ""
>   
> -SRC_URI[cgt7x_x86_installer.md5sum]    = "feb668b4213403c661909adcf65d2ba8"
> -SRC_URI[cgt7x_x86_installer.sha256sum] = "4a3954c973622c00a9b91fa90473cf921f4b763300b0e7c32735304867856ab8"
> +SRC_URI[cgt7x_x86_installer.md5sum]    = "813840908f333dd2a31f92edec71c1fb"
> +SRC_URI[cgt7x_x86_installer.sha256sum] = "21379811a8857489f72ca8ec45a46eb086ced0bdbb58e78f73a86e63984ab2f5"
>   
>   S = "${WORKDIR}/c7000_${PV}"
>   
>   do_install() {
>       install -d ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
> -    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
> +    cp -rP --preserve=mode,links,timestamps --no-preserve=ownership ${WORKDIR}/c7000_${PV}/ti-cgt-c7000_${PV}.STS/. ${D}/${TI_CGT7X_INSTALL_DIR_RECIPE}
>   }
>   
>   

