Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1D7AE00890; Mon, 27 Mar 2017 09:47:08 -0700 (PDT)
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
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8ACF6E007BA
	for <meta-ti@yoctoproject.org>; Mon, 27 Mar 2017 09:47:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RGkVnj025771;
	Mon, 27 Mar 2017 11:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490633191;
	bh=1CZGC4hB8g/lEMLjx1Jdnq75YokMaN4JTOl/4OlT/Gk=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=ElsCC0Myr20soiOPx/ZWPuruEPDVvRYMxVq7ehrXAFlPR48bwsM7LVMqBoQY/k/Pz
	2M0czriikc3H5po0Aaz7UXQjVi5kdk7T3y0pl52uDOEAOTB8iv9+2oYcQb+IDKmhrB
	iPvND6UQKwwotLyMYIZd2VOUT0Gy3AT4w3IxRxzg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RGkVmd014496;
	Mon, 27 Mar 2017 11:46:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 11:46:30 -0500
Received: from [128.247.83.68] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RGkUi9031687;
	Mon, 27 Mar 2017 11:46:30 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@yoctoproject.org>
References: <1490632891-60160-1-git-send-email-denis@denix.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <f5901cc6-d81e-ee24-01bc-e7e4b2e9add0@ti.com>
Date: Mon, 27 Mar 2017 11:46:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1490632891-60160-1-git-send-email-denis@denix.org>
X-Mailman-Approved-At: Mon, 27 Mar 2017 10:41:01 -0700
Subject: Re: [morty/master][PATCH] ti-ipc: add module dependency between omap_remoteproc and virtio_rpmsg_bus
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
X-List-Received-Date: Mon, 27 Mar 2017 16:47:09 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Denys,

On 03/27/2017 11:41 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This is required to workaround the remoteproc crash due to watchdog interrupt
> conflicts - LCPD-9490
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Sam Nelson <sam.nelson@ti.com>
> Cc: Suman Anna <s-anna@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc/omap_remoteproc.conf | 1 +
>  recipes-ti/ipc/ti-ipc_git.bb               | 4 ++++
>  2 files changed, 5 insertions(+)
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
> index 5878b63..b536f61 100644
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
> @@ -41,6 +42,9 @@ do_install_append() {
>      # lad daemon executable.
>      sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.sh
>      install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +
> +    install -d ${D}${sysconfdir}/modprobe.d/
> +    install -c -m 644 ${WORKDIR}/omap_remoteproc.conf ${D}${sysconfdir}/modprobe.d/

Does this install even on K2 builds/FS? It is ideally not required on K2
builds, though I believe this will be a no-op on K2.

Otherwise, LGTM.

regards
Suman

>  }
>  
>  PACKAGES =+ "${PN}-test"
> 


