Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D43F1E00D68; Mon,  4 Dec 2017 11:52:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41683E00D00
	for <meta-ti@yoctoproject.org>; Mon,  4 Dec 2017 11:52:22 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4JqCXs031288
	for <meta-ti@yoctoproject.org>; Mon, 4 Dec 2017 13:52:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512417132;
	bh=frZsIJxO8Szs3PbMZuWEe8tiZL7/IaZ6a4YyFKU5KzI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OsYimcOUKFojw9o7vLvXmpxu5e6C/9MdzVg1VyBsAhwDH1IaGutXDPphC24sGSe7G
	BCnajJMqa4olNhuxEXr6wJU1mXsohoYZPCgSsKbr/dfqtcKC/Y+GpIPYF8pZ8jrV3L
	Cx3wD31+2XEPg8lvLp8JVXZzmm01hJxRfX8wJ4wI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4Jq7Ka004786
	for <meta-ti@yoctoproject.org>; Mon, 4 Dec 2017 13:52:07 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 4 Dec 2017 13:52:06 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 4 Dec 2017 13:52:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4Jq6Bj021431;
	Mon, 4 Dec 2017 13:52:06 -0600
Date: Mon, 4 Dec 2017 14:51:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20171204195150.GC15340@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B364A8553@DFRE01.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B364A8553@DFRE01.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/4] wl18xx-fw: add recipe for version R8.7_SP3
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
X-List-Received-Date: Mon, 04 Dec 2017 19:52:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Dec 03, 2017 at 05:34:49AM -0500, Reizer, Eyal wrote:
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb

Thanks! Can we just update from 8.7.1 to 8.7.3 by replacing the recipe, 
instead of adding new one?


> diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> new file mode 100644
> index 0000000..a52ec89
> --- /dev/null
> +++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Firmware files for use with TI wl18xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"
> +
> +SRC_URI = " \
> +	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;branch=${BRANCH} \
> +	file://0001-Add-Makefile-to-install-firmware-files.patch \
> +"
> +
> +# Tag: R8.7-SP3 (8.7.3)
> +SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
> +BRANCH = "master"
> +
> +S = "${WORKDIR}/git"
> +
> +CLEANBROKEN = "1"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> -- 
> 2.7.4
> 

