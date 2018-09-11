Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54156E00AB3; Mon, 10 Sep 2018 18:16:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 939B7E00A85
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2018 18:16:56 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8B1GuHE117761
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2018 20:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536628616;
	bh=x/nSUtXnA5bYwYi2VDHM1rnEFnTld9S5OSRR7xqRjLk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jPpFyJFpFwU8ltqTGySm76e1iVwAGUStiFG7MuFl15WI9YIGxJx4HDoJT8j1Ux11y
	Y0hNxpQb+iSHKuFR5evp1ewymAvctGNZQNc+zdMpi7XObNf/VwvwotvoV8PFlNu/I8
	rnELn2uudm0Vi+jdYAY7/6lNuA1KRNtc5fi5Y+Qk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8B1GuOf004249
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2018 20:16:56 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 20:16:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 20:16:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8B1GtW1029927;
	Mon, 10 Sep 2018 20:16:55 -0500
Date: Mon, 10 Sep 2018 21:15:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180911011527.GB32486@beryl>
References: <1536613853-20701-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536613853-20701-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko-next][PATCH v2] ti-ipc: Add systemd startup script
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
X-List-Received-Date: Tue, 11 Sep 2018 01:16:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks.

BTW, rocko-next is not a correct destination release/LTS for a patch.


On Mon, Sep 10, 2018 at 05:10:53PM -0400, Sam Nelson wrote:
> With systemd enabled, it is better to add the proper systemd
> script instead of legacy init.d script.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous version of patch
> Remove PIDFile entries
> ---
> ---
>  recipes-ti/ipc/ti-ipc/tiipclad-daemon.service |  9 +++++++++
>  recipes-ti/ipc/ti-ipc_git.bb                  | 21 +++++++++++++++++----
>  2 files changed, 26 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
> 
> diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
> new file mode 100644
> index 0000000..ea26845
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=TI IPC Daemon
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/bin/__LAD_DAEMON__ -g -l lad.txt
> +
> +[Install]
> +WantedBy=basic.target
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
> index 23b8d94..8b3ac91 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -4,12 +4,13 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>  require ti-ipc.inc
>  require ti-ipc-common.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  DEPENDS += "virtual/kernel"
>  
>  SRC_URI += "file://tiipclad-daemon.sh \
>              file://omap_remoteproc.conf \
> +            file://tiipclad-daemon.service \
>              file://0001-Add-kernel-build-dir.patch \
>             "
>  
> @@ -23,11 +24,13 @@ DAEMON_k2g = "lad_66ak2g"
>  DAEMON_omapl138 = "lad_omapl138"
>  DAEMON_k3 = "lad_am65xx"
>  
> -inherit autotools-brokensep pkgconfig update-rc.d
> +inherit autotools-brokensep pkgconfig update-rc.d systemd
>  
>  INITSCRIPT_NAME = "tiipclad-daemon.sh"
>  INITSCRIPT_PARAMS = "defaults 10"
>  
> +SYSTEMD_SERVICE_${PN} = "tiipclad-daemon.service"
> +
>  EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=${STAGING_KERNEL_BUILDDIR}"
>  
>  do_compile[depends] += "virtual/kernel:do_shared_workdir"
> @@ -40,10 +43,20 @@ do_configure() {
>  do_install_append() {
>      install -d ${D}${sysconfdir}/init.d/
>  
> -    # Modify the tiipclad-daemon.sh script to point to the right
> +    # Modify the startup scripts to point to the right
>      # lad daemon executable.
>      sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.sh
> -    install -c -m 755 ${WORKDIR}/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +    sed -i -e "s/__LAD_DAEMON__/${DAEMON}/" ${WORKDIR}/tiipclad-daemon.service
> +
> +    systemd_enabled=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '1', '0', d)}
> +    if [ ${systemd_enabled} -eq 1 ]
> +    then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${WORKDIR}/tiipclad-daemon.service ${D}${systemd_system_unitdir}
> +    else
> +        install -d ${D}${sysconfdir}/init.d/
> +        install -c -m 755 ${S}/scripts/tiipclad-daemon.sh ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> +    fi
>  }
>  
>  do_install_append_dra7xx() {
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

