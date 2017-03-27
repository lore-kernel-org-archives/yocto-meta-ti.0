Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81F9FE00995; Mon, 27 Mar 2017 10:54:37 -0700 (PDT)
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
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 443FDE00867
	for <meta-ti@yoctoproject.org>; Mon, 27 Mar 2017 10:54:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RHrvh7016983;
	Mon, 27 Mar 2017 12:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490637237;
	bh=Dbki3rjKWoMyZUuKfk9Aepf5V9dz9+81Dm/eR7JqGJY=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=xTg2IU0uOivyw6/gimxzrC/7bCIW1vsEkP0Nfk8HZkXm+bEYYDA+I3QzwV0RpBJ+f
	gXOz0Bso7hcXnPBkB24y5jucwwWPobfHC3y0BUWqcCtREMVFTofLI4WcIYF1GDTOEv
	o6Y1qxaOLhPMpIK0nPPFMT4kDS25eBKTm8+HB/rw=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RHrvhk026871;
	Mon, 27 Mar 2017 12:53:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 12:53:57 -0500
Received: from [128.247.83.68] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RHruf2025447;
	Mon, 27 Mar 2017 12:53:57 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@yoctoproject.org>
References: <1490635625-86103-1-git-send-email-denis@denix.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <05fb86d2-2181-1a32-e592-f1110969a60a@ti.com>
Date: Mon, 27 Mar 2017 12:53:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1490635625-86103-1-git-send-email-denis@denix.org>
Subject: Re: [morty/master][PATCH v2] ti-ipc: add module dependency between omap_remoteproc and virtio_rpmsg_bus
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
X-List-Received-Date: Mon, 27 Mar 2017 17:54:37 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 03/27/2017 12:27 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This is required to workaround the remoteproc crash due to watchdog interrupt
> conflicts - LCPD-9490
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Sam Nelson <sam.nelson@ti.com>
> Cc: Suman Anna <s-anna@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
> v2 - only add module dependency for dra7xx platforms
> 
>  recipes-ti/ipc/ti-ipc/omap_remoteproc.conf | 1 +
>  recipes-ti/ipc/ti-ipc_git.bb               | 6 ++++++
>  2 files changed, 7 insertions(+)
>  create mode 100644 recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
> 
> diff --git a/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf b/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
> new file mode 100644
> index 0000000..6b5034c
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc/omap_remoteproc.conf
> @@ -0,0 +1 @@
> +softdep omap_remoteproc pre: virtio_rpmsg_bus
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
> index 5878b63..05b4d85 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -9,6 +9,7 @@ PR = "${INC_PR}.0"
>  DEPENDS += "virtual/kernel"
>  
>  SRC_URI += "file://tiipclad-daemon.sh \
> +            file://omap_remoteproc.conf \
>              file://0001-Add-kernel-build-dir.patch \
>             "
>  
> @@ -43,6 +44,11 @@ do_install_append() {
>      install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>  }
>  
> +do_install_append_dra7xx() {
> +    install -d ${D}${sysconfdir}/modprobe.d/
> +    install -c -m 644 ${WORKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/
> +}
> +
>  PACKAGES =+ "${PN}-test"
>  RDEPENDS_${PN}-test += "${PN}"
>  
> 


