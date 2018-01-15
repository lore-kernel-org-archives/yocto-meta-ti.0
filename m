Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62C6AE00DCE; Mon, 15 Jan 2018 09:37:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1114E00DA9
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 09:37:33 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FHbWkO017133
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 11:37:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516037853;
	bh=XOiUIhgYdoX44VvPAvstpFVKPB1FxuQMCA5n2wQwTMs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=r692SF9jvhHUym4NJUHE1sZ5S8BWJiJmViP9WVg/sPM3+xXL2NPIHu61mG6OFM6ml
	Tkh21aW3yi0LqCYITqwwb4UaikX51AXbKFoU7oJg80ENpEioXjJ8WoL4ZNwuF/V8Mw
	wibuh7QfFjapSW0Ac3ZqkbtOz5ebpXhxwhDuw9+4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FHbWCN004188
	for <meta-ti@yoctoproject.org>; Mon, 15 Jan 2018 11:37:32 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 11:37:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 11:37:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FHbWEY020457;
	Mon, 15 Jan 2018 11:37:32 -0600
Date: Mon, 15 Jan 2018 12:37:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180115173732.GA31494@edge>
References: <1516037541-9913-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1516037541-9913-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/rocko/master][PATCH] ti-ipc: Update to new version 3.47.01.00_eng
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
X-List-Received-Date: Mon, 15 Jan 2018 17:37:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Is it really needed for morty?


On Mon, Jan 15, 2018 at 12:32:21PM -0500, Sam Nelson wrote:
> Also remove unused IPC_VERSION definition for ti-ipc-examples-linux
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-common.inc            |  2 +-
>  recipes-ti/ipc/ti-ipc-examples-linux_git.bb |  1 -
>  recipes-ti/ipc/ti-ipc-rtos.inc              | 10 +++++-----
>  recipes-ti/ipc/ti-ipc.inc                   |  6 +++---
>  4 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
> index 2fb7ffb..0ebe785 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,4 +1,4 @@
> -PV = "3.47.00.00"
> +PV = "3.47.01.00"
>  INC_PR = "r0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> index ddbe48f..471d7ff 100644
> --- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> @@ -27,7 +27,6 @@ do_compile_append() {
>  
>  do_install_append() {
>    cd ${S_ipc-examples}/src
> -  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
>  
>    if [  "${PLATFORM}" != "UNKNOWN" ]; then
>      # Install directory for linux examples
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index 57cd132..6eee228 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -24,17 +24,17 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=${TI_IPC_METADATA_GIT_BRANCH};\
>  name=${TI_IPC_METADATA_NAME}"
>  
> -# Corresponds to tag: 3.47.00.00
> +# Corresponds to tag: 3.47.01.00_eng
>  SRCREV_ipc-examples = "e71b82187a324faa9394b83e39495be38255f05b"
>  
> -# Corresponds to tag: 3.47.00.00
> -SRCREV_ipc-metadata = "f026a364d0b9c1aba5c695bf0aac0be8ede95f59"
> +# Corresponds to tag: 3.47.01.00_eng
> +SRCREV_ipc-metadata = "2e02a01c78f2545d84a8e497581db55e606da34c"
>  
>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>  
> -RELEASE_TYPE = "GA"
> -RELEASE_SUFFIX = ""
> +RELEASE_TYPE = "ENG"
> +RELEASE_SUFFIX = "_eng"
>  
>  PR = "${INC_PR}.r2"
>  
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index 02f3c8d..3e3ff8f 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
>  
>  TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
> -TI_IPC_GIT_BRANCH = "3.47"
> +TI_IPC_GIT_BRANCH = "ipc-next"
>  
> -#Corresponds to 3.47.00.00
> -TI_IPC_SRCREV = "e576990e3a220ad394b287588c1c7e85e8644d23"
> +#Corresponds to 3.47.01.00_eng
> +TI_IPC_SRCREV = "6a2595a4148fb12f259efc19164a9d33ad2ed294"
>  
>  BRANCH = "${TI_IPC_GIT_BRANCH}"
>  SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

