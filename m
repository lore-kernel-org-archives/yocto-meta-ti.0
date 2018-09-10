Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33AE6E00A85; Mon, 10 Sep 2018 11:48:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64D89E00994
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2018 11:48:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AImc5P102522
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2018 13:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536605318;
	bh=xRoZCAKnKKBsdRVj9eybzGqB0ag9ZrRhQOJwYt+Cc/Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VLzVdEB1Flj4i1K5RuEDQSAFeeV54UAHy4Cy4NZudHu/cymH8YvRscqgHUQJqgdjQ
	Fq7/q5NIn5jw6b3fld0MawFHhDxC0T+GZBhZ+AfjvSCVxqy9Y7KsMN3iNq83i040ZL
	qIwVobPrIJg7E5G9lBOiU7yMl1YM0G81/qJHeHIs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AImcEL021967
	for <meta-ti@yoctoproject.org>; Mon, 10 Sep 2018 13:48:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 13:48:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 13:48:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AImbML022921;
	Mon, 10 Sep 2018 13:48:38 -0500
Date: Mon, 10 Sep 2018 14:47:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180910184709.GD32127@beryl>
References: <1536321902-7078-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536321902-7078-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko-next][PATCH] ti-ipc: Add systemd startup script
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
X-List-Received-Date: Mon, 10 Sep 2018 18:48:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

On Friday night Suman and I were debugging issues with this new systemd 
service file.

First of all, you hahve PIDFile entry twice.
Second, this entry is recommended, but not required. But if specified, systemd 
expects the daemon to create that PID file and if the file is not there after 
a minute or so, it kills the daemon.

Everything seems to work just fine w/o any PIDFile entries.

Please send v2 of the patch - I'll drop it from the next branch.


On Fri, Sep 07, 2018 at 08:05:02AM -0400, Sam Nelson wrote:
> With systemd enabled, it is better to add the proper systemd
> script instead of legacy init.d script.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc/tiipclad-daemon.service | 11 +++++++++++
>  recipes-ti/ipc/ti-ipc_git.bb                  | 21 +++++++++++++++++----
>  2 files changed, 28 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
> 
> diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
> new file mode 100644
> index 0000000..7c09c7d
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=TI IPC Daemon
> +
> +[Service]
> +Type=forking
> +PIDFile=/var/run/tiipclad.pid
> +ExecStart=/usr/bin/__LAD_DAEMON__ -g -l lad.txt
> +PIDFile=/var/run/tiipclad.pid
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

