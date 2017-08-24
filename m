Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B413E00B6F; Thu, 24 Aug 2017 13:04:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D599EE0090A
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 13:04:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7OK48TX024353
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 15:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503605048;
	bh=ow6L6h+OU6UpqG1vDE6LExUhcrrOSx3/cmpkJRNQXBU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vqynbCa4uLqqPZkEBoFDg64PtXDxb1b39bQTINetC5btgQHkWjAZpE1mgWcLkIQhs
	DPX8EGCI4Vbl/EbocbB5B/YHSW0lMZ4qUP8KXyBB/YdITXulnd1PXpYc1IpPWH5agF
	00S5Q6khhGBhJXVqHewV6Mhm2/I9lUIpgWWyWlm0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OK48Ee013832
	for <meta-ti@yoctoproject.org>; Thu, 24 Aug 2017 15:04:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 24 Aug 2017 15:04:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 24 Aug 2017 15:04:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7OK48fI001329;
	Thu, 24 Aug 2017 15:04:08 -0500
Date: Thu, 24 Aug 2017 16:04:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170824200404.GL28233@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-32-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-32-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 32/37] emac-lld-rtos: Added emac-lld-rtos recipe
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
X-List-Received-Date: Thu, 24 Aug 2017 20:04:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 18, 2017 at 07:03:43PM -0400, Mahesh Radhakrishnan wrote:
> Upstreaming RTOS low level driver for Ethernet MAC
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
> v2 - Added summary and merged in to a single recipe
> 
>  recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> 
> diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> new file mode 100644
> index 0000000..0ad74cb
> --- /dev/null
> +++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral"
> +
> +inherit ti-pdk
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
> +EMAC_LLD_GIT_PROTOCOL = "git"
> +EMAC_LLD_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.06A"
> +EMAC_LLD_SRCREV = "30ed663809ab178098f8207e9d49913d1446ee6c"
> +
> +BRANCH ="${EMAC_LLD_GIT_BRANCH}"
> +SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${EMAC_LLD_SRCREV}"
> +PV = "01.00.03.06A"
> +PR = "r0"
> +
> +DEPENDS_append = " board-rtos osal-rtos"

Blocked by board-rtos.


> +DEPENDS_append_ti33x = " starterware-rtos"
> +DEPENDS_append_ti43x = " starterware-rtos"
> +DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "EMAC LLD"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

