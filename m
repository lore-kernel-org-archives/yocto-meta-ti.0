Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3605BE0074B; Tue,  2 Aug 2016 08:59:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1FE5E006D8
	for <meta-ti@yoctoproject.org>; Tue,  2 Aug 2016 08:59:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u72Ft3ZK027049
	for <meta-ti@yoctoproject.org>; Tue, 2 Aug 2016 10:55:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u72Fx1Nv016156
	for <meta-ti@yoctoproject.org>; Tue, 2 Aug 2016 10:59:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 2 Aug 2016 10:59:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u72Fx1r4013012;
	Tue, 2 Aug 2016 10:59:01 -0500
Date: Tue, 2 Aug 2016 11:59:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160802155900.GL3677@edge>
References: <1470151667-35399-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1470151667-35399-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc-rtos: Cleanup scripts for srcipk generation after compile
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
X-List-Received-Date: Tue, 02 Aug 2016 15:59:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NO, it shouldn't have been here in the first place! How did I miss it? I'm 
going to remove that compile_append() below.


On Tue, Aug 02, 2016 at 11:27:47AM -0400, Sam Nelson wrote:
> This avoid issues with double srcipk generation.
> Resolves issues with empty srcipk package, with some latest updates in
> meta-arago.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-rtos_git.bb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> index c9c4714..0213782 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -35,7 +35,7 @@ SRCREV_ipc-metadata = "b6dd82a450d75b9483a7cc9b619a30cf3cc25ae6"
>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
>  DEPENDS_append_keystone = " ti-cgt6x-native \
> @@ -82,6 +82,9 @@ RELEASE_SUFFIX = ""
>  
>  IPC_PACKAGE_DIR = "${S}/ipc-package"
>  
> +deltask do_create_srcipk
> +addtask create_srcipk after do_compile before do_install
> +
>  do_compile() {
>    oe_runmake -f ipc-bios.mak clean
>    oe_runmake -f ipc-bios.mak release
> @@ -123,10 +126,6 @@ do_compile() {
>    fi
>  }
>  
> -do_compile_append() {
> -  sourceipk_do_create_srcipk
> -}
> -
>  do_install() {
>    IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
>    # Copy docs and other meta files
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

