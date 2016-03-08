Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 732CEE008F1; Tue,  8 Mar 2016 07:25:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEC74E008C6
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 07:25:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u28FPtw0009924
	for <meta-ti@yoctoproject.org>; Tue, 8 Mar 2016 09:25:55 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u28FPtgk026351
	for <meta-ti@yoctoproject.org>; Tue, 8 Mar 2016 09:25:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Mar 2016 09:25:55 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u28FPsI6010957	for
	<meta-ti@yoctoproject.org>; Tue, 8 Mar 2016 09:25:54 -0600
Message-ID: <56DEEF02.4020305@ti.com>
Date: Tue, 8 Mar 2016 10:25:54 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <1457441435-18074-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1457441435-18074-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [PATCH] edma3-lld-rtos: Point TMS470_CGTOOLS to correct toolchain
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
X-List-Received-Date: Tue, 08 Mar 2016 15:25:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hold off on this one. This is sufficient for omap-a15, but requires more 
for keystone devices.


On 3/8/2016 7:50 AM, Jacob Stiffler wrote:
> * This fixes do_configure with latest ti-xdctools
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> index dc39fee..0195173 100644
> --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> @@ -2,7 +2,7 @@ require edma3-lld.inc
>   require recipes-ti/includes/ti-paths.inc
>   require recipes-ti/includes/ti-staging.inc
>   
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>   
>   DEPENDS = "ti-sysbios ti-xdctools"
>   
> @@ -67,7 +67,7 @@ export CGTOOLS = "${XDCCGROOT}"
>   export CGTOOLS_ELF = "${XDCCGROOT}"
>   export CODEGEN_PATH_DSP = "${XDCCGROOT}"
>   export CODEGEN_PATH_DSPELF = "${XDCCGROOT}"
> -export TMS470_CGTOOLS = "${XDCCGROOT}"
> +export TMS470_CGTOOLS = "${M4_TOOLCHAIN_INSTALL_DIR}"
>   export UTILS_INSTALL_DIR = "${XDC_INSTALL_DIR}"
>   export XDCPATH = "${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages"
>   export PATH := "${XDC_INSTALL_DIR}:${PATH}"


