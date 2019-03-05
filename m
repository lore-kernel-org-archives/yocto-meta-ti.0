Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED9B7E00D24; Mon,  4 Mar 2019 16:50:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8600E00D11
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 16:50:11 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x250oBEt034212
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551747011;
	bh=+Jyjw0h9cgVODSB7B6vg9d86DLCnhxf+uHqyg51V5uo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=b4rltiiNjBX56DbJ3Wc/c05K578A2ZbgKLrSB+t+ObKh2/lDhqJWyGOcU9BjtWfVN
	s7MUG9kDH2sdJN8Ad2FV99M/nX9XnbBhaTkEJxCcWow7SeDHTcMxNQB+yF74l2Avp7
	qxeUdLirMAo2NRzD0QRp5aFbUtlf6xEimHqW2g7w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x250oBNf075490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:50:11 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:50:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:50:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x250oAQV005521;
	Mon, 4 Mar 2019 18:50:10 -0600
Date: Mon, 4 Mar 2019 19:50:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190305005010.GQ26081@beryl>
References: <1551745471-63345-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551745471-63345-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551745471-63345-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] ti-cg-xml: Update to version 2.61.00
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
X-List-Received-Date: Tue, 05 Mar 2019 00:50:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 07:24:31PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Thanks, please see below.


> ---
>  .../{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb}        | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>  rename recipes-ti/devtools/{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} (61%)
> 
> diff --git a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
> similarity index 61%
> rename from recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> rename to recipes-ti/devtools/ti-cg-xml_2.61.00.bb
> index 5c0ff63..a97b7b7 100644
> --- a/recipes-ti/devtools/ti-cg-xml_2.41.00.bb
> +++ b/recipes-ti/devtools/ti-cg-xml_2.61.00.bb
> @@ -7,22 +7,21 @@ require recipes-ti/includes/ti-paths.inc
>  require recipes-ti/includes/ti-staging.inc
>  require recipes-ti/includes/ti-unpack.inc
>  
> -PV = "2_41_00"
> +PV = "2_61_00"
>  
>  S = "${WORKDIR}/cg_xml_${PV}"
>  
>  SRC_URI = "\
> -    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${PV}/cg_xml-v${PV}-Linux-x86-Install;name=cgxmlbin_linux \
> +    http://software-dl.ti.com/ccs/non-esd/releases/other/applications_packages/cg_xml/cg_xml_v${PV}/cgxml-${@'${PV}'.replace('_','.')}-linux-installer.run;name=cgxmlbin_linux \
>  "
> +LIC_FILES_CHKSUM = "file://cg_xml_${@'${PV}'.replace('_','.')}_Manifest.pdf;md5=fc02a39748ba50373f32b2f4a5e3a684"
> -LIC_FILES_CHKSUM = "file://cg_xml_${PV}_Manifest.pdf;md5=ba23d76ef3d5ec111b03267105c91bd4"

Looks like license checksum has changed - please briefly mention this in the 
commit log with explanation and whether the license itself has changed.


> +SRC_URI[cgxmlbin_linux.md5sum] = "6ce60caa97bbf15158d806fb062fadff"
> +SRC_URI[cgxmlbin_linux.sha256sum] = "da77cb10bd3d5de89e27e4ce8f4408a2e50775c8980225f9a828ddc242bb81f9"
>  
> -SRC_URI[cgxmlbin_linux.md5sum] = "9e421f25f6da455b0155570ce0e62628"
> -SRC_URI[cgxmlbin_linux.sha256sum] = "bbc25f4abe27a8b93bae1d8581c3dee87111c3769c305d086287038ee9038cbf"
> -
> -BINFILE="cg_xml-v${PV}-Linux-x86-Install"
> +BINFILE="cgxml-${@'${PV}'.replace('_','.')}-linux-installer.run"

So, every reference to ${PV} has been replaced to ${@'${PV}'.replace('_','.')}
Should we just change PV to replace underscores with dots (maybe bump PE)? 
E.g.:

PV = "2.61.00"
PE = "1"


>  TI_BIN_UNPK_CMDS=""
> -TI_BIN_UNPK_ARGS="--prefix ${S} --mode silent"
> +TI_BIN_UNPK_ARGS="--prefix ${S} --mode unattended"
>  
>  do_install() {
>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

