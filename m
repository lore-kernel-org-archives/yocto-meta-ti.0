Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44C75E007BA; Tue,  6 Jan 2015 10:19:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5518CE002F9
	for <meta-ti@yoctoproject.org>; Tue,  6 Jan 2015 10:19:23 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06IJMOC032047
	for <meta-ti@yoctoproject.org>; Tue, 6 Jan 2015 12:19:22 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IJMWe017525
	for <meta-ti@yoctoproject.org>; Tue, 6 Jan 2015 12:19:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:19:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IJMva021417;
	Tue, 6 Jan 2015 12:19:22 -0600
Date: Tue, 6 Jan 2015 13:19:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181921.GZ4759@edge>
References: <1420556964-20311-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420556964-20311-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [daisy][PATCH] ti-ipc: Upgrade to IPC 3.30.01.12 GA.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:19:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Jan 06, 2015 at 10:09:24AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc_git.bb |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
> index 185e58b..07f8195 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -6,16 +6,13 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f
>  
>  DEPENDS += "virtual/kernel"
>  
> -PV = "3.30.00.09"
> -
> -# This is the first version of the 3.30.00.09 
> -# PR = "r0"
> +PV = "3.30.01.12"
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
>             file://tiipclad-daemon.sh \
>             "
> -SRCREV = "595bc3e3bbb2e7ec12a8287145d8e3929291e59d"
> +SRCREV = "8deec9b295a5700b26449986927c77d60c5c0e5f"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

